import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart'; 

class OfferController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = false;
  String? errorMessage;

  // --- PROCESAMIENTO DE IMAGEN ULTRA RÁPIDO ---
  Future<Uint8List?> _procesarImagen(Uint8List bytes) async {
    try {
      final result = await FlutterImageCompress.compressWithList(
        bytes,
        minWidth: 800,  
        minHeight: 800,
        quality: 80,    
        format: CompressFormat.webp, 
      );
      return Uint8List.fromList(result);
    } catch (e) {
      debugPrint('Error procesando imagen, se usará la original: $e');
      return bytes; 
    }
  }

  Future<String?> _uploadImage(Uint8List imageBytes) async {
    try {
      final userId = _supabase.auth.currentUser!.id;
      final finalName = 'oferta_${DateTime.now().millisecondsSinceEpoch}.webp';
      final path = '$userId/$finalName';

      await _supabase.storage.from('productos_imagenes').uploadBinary(
        path,
        imageBytes,
        fileOptions: const FileOptions(
          contentType: 'image/webp',
          upsert: true,
        ),
      );

      return _supabase.storage.from('productos_imagenes').getPublicUrl(path);
    } catch (e) {
      debugPrint('Error subiendo imagen: $e');
      return null;
    }
  }

  Future<bool> createOffer({
    required String nombre,
    required String descripcion,
    required String categoria,
    required double precioRegular,
    required double precioOferta,
    required int stock,
    required Uint8List imageBytes, 
    String? solicitudAnimalId,
    DateTime? fechaCaducidad, // <-- NUEVO: parámetro de caducidad
  }) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final webpBytes = await _procesarImagen(imageBytes);
      if (webpBytes == null) {
        throw Exception('No se pudo procesar la imagen. Intenta con otra foto.');
      }

      final userId = _supabase.auth.currentUser!.id;
      final comercioData = await _supabase
          .from('comercios')
          .select('id')
          .eq('usuario_id', userId)
          .single();
      final comercioId = comercioData['id'];

      final imageUrl = await _uploadImage(webpBytes);
      if (imageUrl == null) {
        throw Exception('Error al subir la imagen al servidor.');
      }

      final inserted = await _supabase
          .from('ofertas')
          .insert({
            'comercio_id': comercioId,
            'producto_nombre': nombre.trim(),
            'descripcion': descripcion.trim(),
            'categoria': categoria,
            'precio_regular': precioRegular,
            'precio_oferta': precioOferta,
            'es_oferta': true,
            'stock': stock,
            'imagen_url': imageUrl,
            'estado': 'Activa',
            'fecha_inicio': DateTime.now().toIso8601String(),
            'fecha_fin': DateTime.now().add(const Duration(days: 7)).toIso8601String(),
            // <-- NUEVO: guardar caducidad si es perecedero
            'fecha_caducidad': fechaCaducidad != null
                ? fechaCaducidad.toIso8601String().split('T').first
                : null,
          })
          .select('id')
          .single();

      // --- GENERAR EMBEDDING IA PARA BÚSQUEDA SEMÁNTICA ---
      try {
        await _supabase.functions.invoke('generate-offer-embedding', body: {
          'offer_id': inserted['id'],
          'text': '${nombre.trim()} ${descripcion.trim()} ${categoria}',
        });
        debugPrint('🧠 Embedding generado con éxito para la oferta.');
      } catch (e) {
        debugPrint('⚠️ Error generando embedding IA: $e');
      }

      if (solicitudAnimalId != null) {
        try {
          await _supabase.from('solicitudes_animales').update({
            'oferta_id': inserted['id'],
            'estado': 'Publicado',
          }).eq('id', solicitudAnimalId);
        } catch (e) {
          debugPrint('⚠️ No se pudo vincular la solicitud al animal: $e');
        }
      }

      return true;
    } catch (e) {
      errorMessage = e.toString().replaceAll('Exception: ', '');
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> createInventoryProduct({
    required String nombre,
    required String descripcion,
    required String categoria,
    required double precioRegular,
    required int stock,
    required Uint8List imageBytes,
  }) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final webpBytes = await _procesarImagen(imageBytes);
      if (webpBytes == null) {
        throw Exception('No se pudo procesar la imagen.');
      }

      final userId = _supabase.auth.currentUser!.id;
      final comercioData = await _supabase
          .from('comercios')
          .select('id')
          .eq('usuario_id', userId)
          .single();
      final comercioId = comercioData['id'];

      final imageUrl = await _uploadImage(webpBytes);
      if (imageUrl == null) {
        throw Exception('Error al subir la imagen.');
      }

      // Mantiene select('id').single() para obtener ID del inventario
      final insertedInv = await _supabase.from('ofertas').insert({
        'comercio_id': comercioId,
        'producto_nombre': nombre.trim(),
        'descripcion': descripcion.trim(),
        'categoria': categoria,
        'precio_regular': precioRegular,
        'precio_oferta': null,
        'es_oferta': false,
        'stock': stock,
        'imagen_url': imageUrl,
        'estado': 'Activo',
        'fecha_inicio': DateTime.now().toIso8601String(),
      }).select('id').single();

      // --- GENERAR EMBEDDING IA TAMBIÉN PARA EL INVENTARIO ---
      try {
        await _supabase.functions.invoke('generate-offer-embedding', body: {
          'offer_id': insertedInv['id'],
          'text': '${nombre.trim()} ${descripcion.trim()} ${categoria}',
        });
        debugPrint('🧠 Embedding generado con éxito para el inventario.');
      } catch (e) {
        debugPrint('⚠️ Error generando embedding IA en inventario: $e');
      }

      return true;
    } catch (e) {
      errorMessage = e.toString().replaceAll('Exception: ', '');
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
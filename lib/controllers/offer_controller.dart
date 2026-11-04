import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart'; // <-- NUEVO PAQUETE

class OfferController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = false;
  String? errorMessage;

  // --- PROCESAMIENTO DE IMAGEN ULTRA RÁPIDO ---
  Future<Uint8List?> _procesarImagen(Uint8List bytes) async {
    try {
      final result = await FlutterImageCompress.compressWithList(
        bytes,
        minWidth: 800,  // Tamaño óptimo para la app
        minHeight: 800,
        quality: 80,    // Calidad 80% (excelente relación peso/calidad)
        format: CompressFormat.webp, // Conversión a WebP directo
      );
      return Uint8List.fromList(result);
    } catch (e) {
      debugPrint('Error procesando imagen, se usará la original: $e');
      return bytes; // Si falla, sube la original para no bloquear la venta
    }
  }
  // --------------------------------------------

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
  }) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      // 1. Procesar imagen a WebP (Ahora es casi instantáneo)
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

      // 2. Subir imagen procesada
      final imageUrl = await _uploadImage(webpBytes);
      if (imageUrl == null) {
        throw Exception('Error al subir la imagen al servidor.');
      }

      // 3. Insertar oferta en la BD
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
          })
          .select('id')
          .single();

      // 4. Vincular a solicitud de animal si aplica
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

      await _supabase.from('ofertas').insert({
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
      });

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
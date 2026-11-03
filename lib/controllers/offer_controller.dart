import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;

class OfferController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = false;
  String? errorMessage;

  Future<String?> _uploadImage(Uint8List imageBytes, String imageName) async {
    try {
      final userId = _supabase.auth.currentUser!.id;
      final ext = p.extension(imageName);
      final finalName = 'oferta_${DateTime.now().millisecondsSinceEpoch}$ext';
      final path = '$userId/$finalName';

      await _supabase.storage.from('productos_imagenes').uploadBinary(
        path,
        imageBytes,
        fileOptions: const FileOptions(upsert: true),
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
    Uint8List? imageBytes,
    String? imageName,
    String? solicitudAnimalId, // ← NUEVO PARÁMETRO
  }) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      // 1. MODERACIÓN CON IA
      // Se OMITE si el usuario viene desde una solicitud ya aprobada por el Admin.
      if (solicitudAnimalId == null) {
        final aiResponse = await _supabase.functions.invoke(
          'moderate-content',
          body: {'title': nombre, 'description': descripcion},
        );

        if (aiResponse.status != 200) {
          throw Exception('Error en el servidor de moderación.');
        }

        final aiData = aiResponse.data;

        // Si contiene contenido prohibido, bloqueamos
        if (aiData['es_prohibido'] == true) {
          throw Exception(
              'Publicación bloqueada: ${aiData['motivo_rechazo']}');
        }

        // Si contiene un animal no permitido, guardamos solicitud y bloqueamos
        if (aiData['contiene_animal'] == true &&
            aiData['animal_permitido'] == false) {
          final userId = _supabase.auth.currentUser!.id;
          await _supabase.from('solicitudes_animales').insert({
            'usuario_id': userId,
            'nombre_animal': aiData['animal_solicitado'] ?? nombre,
            'descripcion_venta': descripcion,
          });
          throw Exception(
              'Este animal no está permitido para venta directa. Hemos enviado una solicitud al Administrador para su aprobación.');
        }
      }

      // 2. SUBIR IMAGEN Y GUARDAR
      final userId = _supabase.auth.currentUser!.id;
      final comercioData = await _supabase
          .from('comercios')
          .select('id')
          .eq('usuario_id', userId)
          .single();
      final comercioId = comercioData['id'];

      String? imageUrl;
      if (imageBytes != null && imageName != null) {
        imageUrl = await _uploadImage(imageBytes, imageName);
      }

      // Insertamos y recuperamos el ID de la oferta creada
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
            'fecha_fin': DateTime.now()
                .add(const Duration(days: 7))
                .toIso8601String(),
          })
          .select('id')
          .single();

      // 3. VINCULAR LA OFERTA A LA SOLICITUD DE ANIMAL APROBADA
      if (solicitudAnimalId != null) {
        try {
          await _supabase.from('solicitudes_animales').update({
            'oferta_id': inserted['id'],
            'estado': 'Publicado',
          }).eq('id', solicitudAnimalId);
        } catch (e) {
          // Si falla el vínculo, no bloqueamos la publicación
          debugPrint('⚠️ No se pudo vincular la solicitud al animal: $e');
        }
      }

      return true;
    } catch (e) {
      errorMessage = e.toString();
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
    Uint8List? imageBytes,
    String? imageName,
  }) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      // 1. MODERACIÓN CON IA (ANTES DE GUARDAR)
      final aiResponse = await _supabase.functions.invoke(
        'moderate-content',
        body: {'title': nombre, 'description': descripcion},
      );

      if (aiResponse.status != 200) {
        throw Exception('Error en el servidor de moderación.');
      }

      final aiData = aiResponse.data;

      // Si contiene contenido prohibido, bloqueamos
      if (aiData['es_prohibido'] == true) {
        throw Exception(
            'Publicación bloqueada: ${aiData['motivo_rechazo']}');
      }

      // Si contiene un animal no permitido, guardamos solicitud y bloqueamos
      if (aiData['contiene_animal'] == true &&
          aiData['animal_permitido'] == false) {
        final userId = _supabase.auth.currentUser!.id;
        await _supabase.from('solicitudes_animales').insert({
          'usuario_id': userId,
          'nombre_animal': aiData['animal_solicitado'] ?? nombre,
          'descripcion_venta': descripcion,
        });
        throw Exception(
            'Este animal no está permitido para venta directa. Hemos enviado una solicitud al Administrador.');
      }

      // 2. SUBIR IMAGEN Y GUARDAR
      final userId = _supabase.auth.currentUser!.id;
      final comercioData = await _supabase
          .from('comercios')
          .select('id')
          .eq('usuario_id', userId)
          .single();
      final comercioId = comercioData['id'];

      String? imageUrl;
      if (imageBytes != null && imageName != null) {
        imageUrl = await _uploadImage(imageBytes, imageName);
      }

      await _supabase.from('ofertas').insert({
        'comercio_id': comercioId,
        'producto_nombre': nombre.trim(),
        'descripcion': descripcion.trim(),
        'categoria': categoria,
        'precio_regular': precioRegular,
        'precio_oferta': null, // Sin oferta
        'es_oferta': false,
        'stock': stock,
        'imagen_url': imageUrl,
        'estado': 'Activo',
        'fecha_inicio': DateTime.now().toIso8601String(),
      });

      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
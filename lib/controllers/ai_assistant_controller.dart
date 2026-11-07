import 'dart:convert'; // <-- NUEVO
import 'dart:typed_data'; // <-- NUEVO
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AiAssistantController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = false;
  String? generatedDescription;
  String? errorMessage;

  Future<void> generateDescription({
    required String productName,
    required String category,
    Uint8List? imageBytes, // <-- NUEVO
  }) async {
    // <-- NUEVO: validación mínima (sin nombre y sin imagen = basura)
    if (productName.isEmpty && imageBytes == null) {
      errorMessage = 'Escribe el nombre del producto o sube una foto.';
      notifyListeners();
      return;
    }

    isLoading = true;
    errorMessage = null;
    generatedDescription = null;
    notifyListeners();

    try {
      // <-- CAMBIO: body dinámico según haya imagen o no
      final Map<String, dynamic> body = {
        'product_name': productName,
        'category': category,
      };

      if (imageBytes != null) {
        body['image_base64'] = base64Encode(imageBytes);
        body['image_mime_type'] = _detectMimeType(imageBytes);
      }

      final response = await _supabase.functions
          .invoke('generate-offer-description', body: body)
          .timeout(const Duration(seconds: 30)); // <-- NUEVO: timeout (Vision es más lento)

      if (response.status == 200 && response.data != null) {
        generatedDescription = response.data['description'];
      } else {
        throw Exception('La IA no pudo generar el texto.');
      }
    } catch (e) {
      // <-- CAMBIO: mensaje limpio (igual patrón que offer_controller)
      errorMessage = e.toString().replaceAll('Exception: ', '');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // <-- NUEVO: detecta el MIME real por magic numbers.
  // Necesario porque image_picker puede devolver JPEG, PNG o WebP,
  // y Gemini Vision rechaza si el MIME no coincide con los bytes.
  String _detectMimeType(Uint8List bytes) {
    if (bytes.length >= 3 &&
        bytes[0] == 0xFF && bytes[1] == 0xD8 && bytes[2] == 0xFF) {
      return 'image/jpeg';
    }
    if (bytes.length >= 8 &&
        bytes[0] == 0x89 && bytes[1] == 0x50 &&
        bytes[2] == 0x4E && bytes[3] == 0x47) {
      return 'image/png';
    }
    if (bytes.length >= 12 &&
        bytes[0] == 0x52 && bytes[1] == 0x49 &&
        bytes[2] == 0x46 && bytes[3] == 0x46 &&
        bytes[8] == 0x57 && bytes[9] == 0x45 &&
        bytes[10] == 0x42 && bytes[11] == 0x50) {
      return 'image/webp';
    }
    return 'image/jpeg'; // fallback seguro
  }
}
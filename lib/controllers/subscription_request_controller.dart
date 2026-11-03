import 'dart:convert'; // <-- IMPORTACIÓN AGREGADA
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;

class SubscriptionRequestController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = false;
  String? errorMessage;
  String? successMessage;

  Future<bool> submitRequest({
    required String planName,
    required String method,
    required double amount,
    required String reference,
    Uint8List? imageBytes,
    String? imageName,
  }) async {
    isLoading = true;
    errorMessage = null;
    successMessage = null;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      String? comprobanteUrl;

      // 1. Subir comprobante a Storage (si existe)
      if (imageBytes != null && imageName != null) {
        final ext = p.extension(imageName);
        final fileName = 'pago_${DateTime.now().millisecondsSinceEpoch}$ext';
        final path = '$userId/$fileName';

        await _supabase.storage.from('comprobantes_pago').uploadBinary(
          path, imageBytes, fileOptions: const FileOptions(upsert: true)
        );
        comprobanteUrl = _supabase.storage.from('comprobantes_pago').getPublicUrl(path);
      }

      // 2. Crear la solicitud en la BD
      final response = await _supabase.from('solicitudes_suscripcion').insert({
        'usuario_id': userId,
        'plan_solicitado': planName,
        'metodo_pago': method,
        'monto': amount,
        'referencia': reference,
        'comprobante_url': comprobanteUrl,
      }).select('id').single();

      final solicitudId = response['id'];

      // 3. Invocar a la Edge Function para verificación
      await _supabase.functions.invoke('verify-payment', body: {
        'solicitud_id': solicitudId,
        'method': method,
        'reference': reference,
        'amount': amount,
        'image_base64': imageBytes != null ? base64Encode(imageBytes) : null,
      });

      successMessage = 'Solicitud enviada. Si la verificación es automática, tu plan se activará en segundos. De lo contrario, un administrador la revisará.';
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
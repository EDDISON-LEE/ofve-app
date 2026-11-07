import 'dart:convert'; 
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;

class SubscriptionRequestController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = false;
  String? errorMessage;
  String? successMessage;
  String? verificationStatus; // <-- NUEVO: Automatico, Manual, Rechazado

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
    verificationStatus = null;
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

      // 3. Invocar a la Edge Function para verificación con IA
      final verifyResponse = await _supabase.functions.invoke('verify-payment', body: {
        'solicitud_id': solicitudId,
        'method': method,
        'reference': reference,
        'amount': amount,
        'image_base64': imageBytes != null ? base64Encode(imageBytes) : null,
        'plan_name': planName,
      });

      // 4. Analizar la respuesta de la IA
      if (verifyResponse.status == 200 && verifyResponse.data != null) {
        final data = verifyResponse.data;
        verificationStatus = data['status']; 
        final motivo = data['motivo'];

        if (verificationStatus == 'Automatico') {
          successMessage = '¡Pago validado por IA! Tu plan ha sido activado instantáneamente.';
        } else if (verificationStatus == 'Manual') {
          successMessage = 'Comprobante recibido. La IA lo envió a revisión manual. Un administrador lo verificará pronto.';
        } else {
          // Rechazado
          successMessage = 'El pago fue rechazado. Motivo: ${motivo ?? "Comprobante inválido o no coincide con el monto."}';
        }
      } else {
        throw Exception('Error al comunicarse con el validador de pagos.');
      }

      // --- NOTIFICAR A LOS OWNERS POR NUEVO PAGO ---
      try {
        final owners = await _supabase.from('usuarios').select('email').eq('rol', 'owner');
        for (var owner in owners) {
          if (owner['email'] != null) {
            await _supabase.functions.invoke('send-push', body: {
              'target_email': owner['email'],
              'title': '💰 Nuevo Pago por Verificar',
              'body': 'Se ha subido un comprobante de \$${amount.toStringAsFixed(2)}.',
              'data': {'ruta': '/owner_manual_payments'}
            });
          }
        }
      } catch (e) {
        debugPrint('⚠️ Error notificando al owner: $e');
      }
      // ----------------------------------------------------

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
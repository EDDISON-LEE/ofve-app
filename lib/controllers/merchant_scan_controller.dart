import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart'; // <-- IMPORTANTE
import '../services/local_storage_service.dart'; // <-- IMPORTANTE

class MerchantScanController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = false;
  String? errorMessage;
  Map<String, dynamic>? purchaseData;
  bool isSuccess = false;
  bool isQueuedOffline = false; // <-- NUEVA VARIABLE

  final double commissionRate = 5.0; 

  Future<void> processScan(String qrToken) async {
    isLoading = true;
    errorMessage = null;
    isSuccess = false;
    isQueuedOffline = false;
    purchaseData = null;
    notifyListeners();

    try {
      // 1. VERIFICAR CONECTIVIDAD
      final connectivityResult = await (Connectivity().checkConnectivity());
      bool hasInternet = !connectivityResult.contains(ConnectivityResult.none);

      if (!hasInternet) {
        // --- MODO OFFLINE ---
        await LocalStorageService.addPendingQr(qrToken);
        isQueuedOffline = true;
        isSuccess = true; // Éxito visual
        notifyListeners();
        return; 
      }

      // --- MODO ONLINE (Lógica Original) ---
      final userId = _supabase.auth.currentUser!.id;

      final comercio = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      final comercioId = comercio['id'];

      final compra = await _supabase
          .from('compras')
          .select('*, usuarios(nombre, email)')
          .eq('qr_token', qrToken)
          .maybeSingle();

      if (compra == null) throw Exception('Código QR no válido o compra no encontrada.');
      if (compra['comercio_id'] != comercioId) throw Exception('Esta compra pertenece a otro comercio.');
      if (compra['estado'] == 'Completado') throw Exception('Esta compra ya fue escaneada y completada.');

      await _supabase.from('compras').update({
        'estado': 'Completado',
        'fecha_validacion': DateTime.now().toIso8601String(),
      }).eq('id', compra['id']);

      try {
        await _supabase.rpc('registrar_comision', params: {
          'p_compra_id': compra['id'],
          'p_porcentaje': commissionRate,
        });
      } catch (e) {
        debugPrint('⚠️ Error registrando comisión: $e');
      }

      try {
        final clienteEmail = compra['usuarios']?['email'];
        if (clienteEmail != null) {
          await _supabase.functions.invoke('send-push', body: {
            'target_email': clienteEmail,
            'title': '¡Compra Validada! ✅',
            'body': 'El comercio ha confirmado la entrega de tu producto.',
            'data': {'ruta': '/client_validation'}
          });
        }
      } catch (e) {
        debugPrint('⚠️ Error enviando notificación al cliente: $e');
      }

      purchaseData = compra;
      isSuccess = true;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
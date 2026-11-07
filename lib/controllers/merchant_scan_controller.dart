import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../services/local_storage_service.dart';

class MerchantScanController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = false;
  String? errorMessage;
  Map<String, dynamic>? purchaseData;
  bool isSuccess = false;
  bool isQueuedOffline = false;

  final double commissionRate = 5.0; 

  Future<void> processScan(String qrToken) async {
    isLoading = true;
    errorMessage = null;
    isSuccess = false;
    isQueuedOffline = false;
    purchaseData = null;
    notifyListeners();

    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      bool hasInternet = !connectivityResult.contains(ConnectivityResult.none);

      if (!hasInternet) {
        await LocalStorageService.addPendingQr(qrToken);
        isQueuedOffline = true;
        isSuccess = true;
        notifyListeners();
        return; 
      }

      final userId = _supabase.auth.currentUser!.id;

      final comercio = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      final comercioId = comercio['id'];

      // Buscamos la compra
      final compra = await _supabase
          .from('compras')
          .select('*, usuarios(nombre, email)')
          .eq('qr_token', qrToken)
          .maybeSingle();

      if (compra == null) throw Exception('Código QR no válido o compra no encontrada.');
      if (compra['comercio_id'] != comercioId) throw Exception('Esta compra pertenece a otro comercio.');
      if (compra['estado'] == 'Completado') throw Exception('Esta compra ya fue escaneada y completada.');

      // 1. Marcar compra como Completada
      await _supabase.from('compras').update({
        'estado': 'Completado',
        'fecha_validacion': DateTime.now().toIso8601String(),
      }).eq('id', compra['id']);

      // 2. Actualizar Stock y Estado de la Oferta (NUEVO)
      try {
        // La compra debe tener el ID de la oferta comprada
        final ofertaId = compra['oferta_id']; // Asegúrate de guardar esto en el PurchaseController
        if (ofertaId != null) {
          final ofertaData = await _supabase.from('ofertas').select('stock').eq('id', ofertaId).single();
          final stockActual = (ofertaData['stock'] as num?)?.toInt() ?? 0;
          final nuevoStock = stockActual > 0 ? stockActual - 1 : 0; // Asumiendo 1 unidad por compra

          await _supabase.from('ofertas').update({
            'stock': nuevoStock,
            'estado': nuevoStock <= 0 ? 'Terminada' : 'Activa',
          }).eq('id', ofertaId);
          debugPrint('📦 Stock actualizado a $nuevoStock para la oferta $ofertaId');
        }
      } catch (e) {
        debugPrint('⚠️ Error actualizando stock de la oferta: $e');
      }

      // 3. Registrar comisión
      try {
        await _supabase.rpc('registrar_comision', params: {
          'p_compra_id': compra['id'],
          'p_porcentaje': commissionRate,
        });
      } catch (e) {
        debugPrint('⚠️ Error registrando comisión: $e');
      }

      // 4. Notificar al cliente
      try {
        final clienteEmail = compra['usuarios']?['email'];
        if (clienteEmail != null) {
          await _supabase.functions.invoke('send-push', body: {
            'target_email': clienteEmail,
            'title': '¡Compra Validada! ✅',
            'body': 'El comercio ha confirmado la entrega de tu producto. ¡No olvides dejar tu reseña!',
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
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'local_storage_service.dart';

class SyncService {
  static Future<void> syncPendingScans() async {
    final pending = await LocalStorageService.getPendingQrs();
    if (pending.isEmpty) return;

    debugPrint('🔄 Sincronizando ${pending.length} QRs pendientes...');
    final supabase = Supabase.instance.client;

    for (String qrToken in pending) {
      try {
        final compra = await supabase.from('compras').select('id, estado').eq('qr_token', qrToken).maybeSingle();
        if (compra != null && compra['estado'] != 'Completado') {
          await supabase.from('compras').update({
            'estado': 'Completado',
            'fecha_validacion': DateTime.now().toIso8601String(),
          }).eq('id', compra['id']);

          await supabase.rpc('registrar_comision', params: {
            'p_compra_id': compra['id'],
            'p_porcentaje': 5.0,
          });
        }
      } catch (e) {
        debugPrint('Error sincronizando QR $qrToken: $e');
      }
    }
    await LocalStorageService.clearPendingQrs();
    debugPrint('✅ Sincronización completada.');
  }
}
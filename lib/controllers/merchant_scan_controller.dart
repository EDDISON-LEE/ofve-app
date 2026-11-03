import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MerchantScanController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = false;
  String? errorMessage;
  Map<String, dynamic>? purchaseData;
  bool isSuccess = false;

  // Porcentaje de comisión de la plataforma (5%)
  final double commissionRate = 5.0; 

  Future<void> processScan(String qrToken) async {
    isLoading = true;
    errorMessage = null;
    isSuccess = false;
    purchaseData = null;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;

      // 1. Obtener el ID del comercio
      final comercio = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      final comercioId = comercio['id'];

      // 2. Buscar la compra por el token del QR
      final compra = await _supabase
          .from('compras')
          .select('*, usuarios(nombre)')
          .eq('qr_token', qrToken)
          .maybeSingle();

      if (compra == null) {
        throw Exception('Código QR no válido o compra no encontrada.');
      }

      // 3. Validar que la compra sea de este comercio
      if (compra['comercio_id'] != comercioId) {
        throw Exception('Esta compra pertenece a otro comercio.');
      }

      // 4. Validar que no esté ya completada
      if (compra['estado'] == 'Completado') {
        throw Exception('Esta compra ya fue escaneada y completada.');
      }

      // 5. Actualizar el estado de la compra
      await _supabase.from('compras').update({
        'estado': 'Completado',
        'fecha_validacion': DateTime.now().toIso8601String(),
      }).eq('id', compra['id']);

      // 6. Registrar la comisión para el Owner
      try {
        await _supabase.rpc('registrar_comision', params: {
          'p_compra_id': compra['id'],
          'p_porcentaje': commissionRate,
        });
      } catch (e) {
        // Si falla la comisión, no bloqueamos la venta
        debugPrint('⚠️ Error registrando comisión: $e');
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
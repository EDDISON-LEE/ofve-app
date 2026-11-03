import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class PurchaseController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;
  
  bool isLoading = false;
  String? errorMessage;
  Map<String, dynamic>? purchaseData;

  // Validar y aplicar el cupón (Llama a la función SQL)
  Future<int?> validarCupon(String codigo, String comercioId) async {
    try {
      final response = await _supabase.rpc('validate_and_apply_coupon', params: {
        'p_codigo': codigo,
        'p_comercio_id': comercioId,
      });
      
      return (response as num).toInt(); 
    } catch (e) {
      debugPrint('Error validando cupón: $e');
      errorMessage = e is PostgrestException ? e.message : e.toString();
      return null;
    }
  }

  Future<bool> createPurchase({
    required String comercioId,
    required String ofertaId,
    required double montoFinal,
    bool requiereDelivery = false,
    double costoDelivery = 0.0,
  }) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      final qrToken = const Uuid().v4();

      final response = await _supabase.from('compras').insert({
        'usuario_id': userId,
        'comercio_id': comercioId,
        'total_pagado': montoFinal,
        'estado': 'Pendiente',
        'qr_token': qrToken,
        'datos_pago': {'metodo': 'Efectivo/Pago Móvil'},
        'requiere_delivery': requiereDelivery,
        'costo_delivery': costoDelivery,
        'estado_delivery': requiereDelivery ? 'Pendiente' : 'N/A',
      }).select().single();

      // OTORGAR PUNTOS AL USUARIO
      await _supabase.rpc('otorgar_puntos_compra', params: {
        'p_compra_id': response['id'],
      });

      // --- NUEVA LÓGICA DE NOTIFICACIÓN PUSH AL COMERCIO ---
      try {
        // 1. Obtener el email del dueño del comercio
        final comercioData = await _supabase
            .from('comercios')
            .select('usuarios(email)')
            .eq('id', comercioId)
            .single();
        
        final emailComercio = comercioData['usuarios']?['email'];

        // 2. Invocar la Edge Function (Si el email existe)
        if (emailComercio != null) {
          await _supabase.functions.invoke('send-push', body: {
            'target_email': emailComercio,
            'title': '¡Nueva Venta en OfVe! 💸',
            'body': 'Has recibido un nuevo pedido por \$${montoFinal.toStringAsFixed(2)}.',
            'data': {'ruta': '/merchant_dashboard'}
          });
        }
      } catch (e) {
        // No bloqueamos la compra si falla la notificación
        debugPrint('⚠️ Error enviando notificación al comercio: $e');
      }
      // -----------------------------------------------------

      purchaseData = response;
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
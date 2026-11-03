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
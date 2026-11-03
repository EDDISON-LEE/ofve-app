import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DeliveryController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> availableOrders = [];
  List<dynamic> myDeliveries = [];
  String? errorMessage;

  DeliveryController() {
    loadOrders();
  }

  Future<void> loadOrders() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;

      // 1. Pedidos disponibles (Pendientes que nadie ha tomado)
      final availableRes = await _supabase
          .from('compras')
          .select('*, comercios(nombre_comercial, direccion_texto), usuarios(nombre, telefono)')
          .eq('requiere_delivery', true)
          .eq('estado_delivery', 'Pendiente')
          .order('fecha_compra', ascending: true);

      // 2. Mis entregas activas (Asignadas a mí y no entregadas)
      final myRes = await _supabase
          .from('compras')
          .select('*, comercios(nombre_comercial, direccion_texto), usuarios(nombre, telefono)')
          .eq('delivery_id', userId)
          .eq('estado_delivery', 'Asignado')
          .order('fecha_compra', ascending: true);

      availableOrders = availableRes;
      myDeliveries = myRes;
    } catch (e) {
      debugPrint('Error cargando pedidos de delivery: $e');
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> acceptOrder(String orderId) async {
    try {
      final userId = _supabase.auth.currentUser!.id;
      await _supabase.from('compras').update({
        'delivery_id': userId,
        'estado_delivery': 'Asignado',
      }).eq('id', orderId);
      
      await loadOrders();
      return true;
    } catch (e) {
      debugPrint('Error aceptando pedido: $e');
      return false;
    }
  }

  Future<bool> completeDelivery(String orderId) async {
    try {
      await _supabase.from('compras').update({
        'estado_delivery': 'Entregado',
        // Opcional: También podrías marcar 'estado': 'Completado' aquí
      }).eq('id', orderId);
      
      await loadOrders();
      return true;
    } catch (e) {
      debugPrint('Error completando pedido: $e');
      return false;
    }
  }
}
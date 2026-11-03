import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientOrdersController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> orders = [];

  ClientOrdersController() {
    loadOrders();
  }

  Future<void> loadOrders() async {
    isLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;

      // Buscamos las compras del usuario y hacemos un JOIN con la tabla comercios para traer el nombre del local
      final response = await _supabase
          .from('compras')
          .select('*, comercios(nombre_comercial)')
          .eq('usuario_id', userId)
          .order('fecha_compra', ascending: false);

      orders = response;
    } catch (e) {
      debugPrint('Error cargando historial de compras: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
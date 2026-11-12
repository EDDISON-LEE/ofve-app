import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MerchantSalesController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;
  
  bool isLoading = true;
  List<dynamic> sales = [];

  MerchantSalesController() {
    loadSales();
  }

  Future<void> loadSales() async {
    isLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      
      // Obtenemos el ID del comercio
      final comercio = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      
      // Buscamos las ventas de este comercio
      final response = await _supabase
          .from('compras')
          .select('*, usuarios!compras_usuario_id_fkey(nombre), ofertas(producto_nombre)')
          .eq('comercio_id', comercio['id'])
          .order('fecha_compra', ascending: false);

      sales = response;
    } catch (e) {
      debugPrint('Error cargando ventas: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
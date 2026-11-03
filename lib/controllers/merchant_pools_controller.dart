import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MerchantPoolsController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  bool isCreating = false;
  List<dynamic> myPools = [];
  String? errorMessage;

  MerchantPoolsController() {
    loadMyPools();
  }

  Future<void> loadMyPools() async {
    isLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      final comercio = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      final comercioId = comercio['id'];

      // Nota: La tabla pools_comunitarios en tu esquema actual no tiene comercio_id.
      // Si no lo tiene, simplemente traemos todos los pools.
      final response = await _supabase
          .from('pools_comunitarios')
          .select('*, pools_participantes(count)')
          .order('fecha_creacion', ascending: false);

      myPools = response;
    } catch (e) {
      debugPrint('Error cargando pools: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> createPool({
    required String productName,
    required int targetUsers,
    required double wholesalePrice,
  }) async {
    isCreating = true;
    errorMessage = null;
    notifyListeners();

    try {
      await _supabase.from('pools_comunitarios').insert({
        'producto_nombre': productName.trim(),
        'meta_usuarios': targetUsers,
        'precio_mayorista_sugerido': wholesalePrice,
        'estado': 'Recaudando',
      });

      await loadMyPools();
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isCreating = false;
      notifyListeners();
    }
  }
}
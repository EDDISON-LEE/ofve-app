import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientPoolsController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> activePools = [];

  ClientPoolsController() {
    loadPools();
  }

  Future<void> loadPools() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _supabase
          .from('pools_comunitarios')
          .select('*, pools_participantes(count)')
          .eq('estado', 'Recaudando')
          .order('fecha_creacion', ascending: false);

      activePools = response;
    } catch (e) {
      debugPrint('Error cargando pools: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> joinPool(String poolId, int cantidad) async {
    try {
      final userId = _supabase.auth.currentUser!.id;

      // 1. Unirse al pool
      await _supabase.from('pools_participantes').insert({
        'pool_id': poolId,
        'usuario_id': userId,
        'cantidad_comprometida': cantidad,
      });

      // 2. Incrementar contador en el pool (RPC en producción, aquí lo hacemos directo)
      final pool = await _supabase.from('pools_comunitarios').select('usuarios_comprometidos').eq('id', poolId).single();
      final currentCount = pool['usuarios_comprometidos'] ?? 0;
      
      await _supabase.from('pools_comunitarios').update({
        'usuarios_comprometidos': currentCount + 1
      }).eq('id', poolId);

      await loadPools(); // Recargar
      return true;
    } catch (e) {
      debugPrint('Error uniéndose al pool: $e');
      return false;
    }
  }
}
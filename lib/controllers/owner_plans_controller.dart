import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OwnerPlansController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> planes = [];
  bool iaGlobalActiva = true;

  OwnerPlansController() {
    loadData();
  }

  Future<void> loadData() async {
    isLoading = true;
    notifyListeners();

    try {
      // 1. Obtener planes con sus características
      final planesRes = await _supabase
          .from('planes_suscripcion')
          .select('*, plan_caracteristicas(*)')
          .order('precio', ascending: true);
      
      // 2. Obtener configuración global de la IA
      final configRes = await _supabase
          .from('configuracion_global')
          .select('ia_global_activa')
          .eq('id', 1)
          .single();
      
      planes = planesRes;
      iaGlobalActiva = configRes['ia_global_activa'] ?? true;
    } catch (e) {
      debugPrint('Error cargando planes en Owner: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleGlobalIA(bool value) async {
    try {
      await _supabase
          .from('configuracion_global')
          .update({'ia_global_activa': value})
          .eq('id', 1);
      iaGlobalActiva = value;
      notifyListeners();
    } catch (e) {
      debugPrint('Error al cambiar IA global: $e');
    }
  }

  Future<void> updatePlanAI(String planId, bool enabled, int quota) async {
    try {
      await _supabase.from('planes_suscripcion').update({
        'ia_habilitada': enabled,
        'ia_cuota_mensual': quota,
      }).eq('id', planId);
      
      await loadData(); // Recargar para reflejar cambios
    } catch (e) {
      debugPrint('Error al actualizar IA del plan: $e');
    }
  }
  
  Future<void> editarPrecio(String planId, double nuevoPrecio) async {
    try {
      await _supabase
          .from('planes_suscripcion')
          .update({'precio': nuevoPrecio})
          .eq('id', planId);
      await loadData();
    } catch (e) {
      debugPrint('Error al actualizar precio: $e');
    }
  }
}
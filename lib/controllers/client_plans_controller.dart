import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientPlansController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> plans = [];
  String currentPlanName = 'Básico'; // Por defecto

  ClientPlansController() {
    loadPlans();
  }

  Future<void> loadPlans() async {
    isLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;

      // 1. Obtener el plan actual del usuario
      final userRes = await _supabase
          .from('usuarios')
          .select('tipo_plan')
          .eq('id', userId)
          .maybeSingle();
      
      if (userRes != null && userRes['tipo_plan'] != null) {
        currentPlanName = userRes['tipo_plan'];
      }

      // 2. Obtener todos los planes disponibles
      final response = await _supabase
          .from('planes_suscripcion')
          .select('*')
          .eq('activo', true)
          .order('precio', ascending: true);

      plans = response;
    } catch (e) {
      debugPrint('Error cargando planes de cliente: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> requestPlanUpgrade(String planName) async {
    try {
      final userId = _supabase.auth.currentUser!.id;
      
      // En un sistema real, aquí se procesaría el pago. 
      // Para esta demostración, actualizamos el plan directamente.
      await _supabase
          .from('usuarios')
          .update({'tipo_plan': planName})
          .eq('id', userId);

      currentPlanName = planName;
      notifyListeners();
    } catch (e) {
      debugPrint('Error al actualizar plan: $e');
    }
  }
}
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  int comerciosPendientes = 0;
  int reportesPendientes = 0;
  int ticketsSoporte = 5; // Placeholder

  AdminController() {
    loadAdminStats();
  }

  Future<void> loadAdminStats() async {
    isLoading = true;
    notifyListeners();
    try {
      final comercios = await _supabase.from('comercios').select('id').eq('estatus_verificacion', 'En Revision').count();
      final reportes = await _supabase.from('reportes_moderacion').select('id').eq('estado', 'Pendiente').count();
      
      comerciosPendientes = comercios.count;
      reportesPendientes = reportes.count;
    } catch (e) {
      debugPrint('Error cargando métricas admin: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminStatsController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;
  bool isLoading = true;
  Map<String, dynamic> stats = {};

  AdminStatsController() {
    loadStats();
  }

  Future<void> loadStats() async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await _supabase.rpc('get_admin_dashboard_stats');
      stats = response;
    } catch (e) {
      debugPrint('Error cargando estadísticas admin: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
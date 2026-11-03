import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OwnerFinancialController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  
  double totalSuscripciones = 0.0;
  double totalPublicidad = 0.0;
  double totalVentasApp = 0.0;
  double totalComisiones = 0.0; // <-- NUEVA VARIABLE

  OwnerFinancialController() {
    loadStats();
  }

  Future<void> loadStats() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _supabase.rpc('get_owner_financial_stats');
      
      final data = response as Map<String, dynamic>;
      totalSuscripciones = (data['suscripciones'] as num?)?.toDouble() ?? 0.0;
      totalPublicidad = (data['publicidad'] as num?)?.toDouble() ?? 0.0;
      totalVentasApp = (data['ventas_app'] as num?)?.toDouble() ?? 0.0;
      totalComisiones = (data['comisiones'] as num?)?.toDouble() ?? 0.0; // <-- PARSEAMOS LA COMISIÓN
      
    } catch (e) {
      debugPrint('Error cargando finanzas: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
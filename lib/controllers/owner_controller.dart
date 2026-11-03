import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OwnerController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  int totalUsuarios = 0;
  int totalComercios = 0;
  int totalOfertas = 0;

  OwnerController() {
    loadGlobalStats();
  }

  Future<void> loadGlobalStats() async {
    isLoading = true;
    notifyListeners();
    try {
      final users = await _supabase.from('usuarios').select('id').count();
      final merchants = await _supabase.from('comercios').select('id').count();
      final offers = await _supabase.from('ofertas').select('id').count();

      totalUsuarios = users.count;
      totalComercios = merchants.count;
      totalOfertas = offers.count;
    } catch (e) {
      debugPrint('Error cargando métricas owner: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
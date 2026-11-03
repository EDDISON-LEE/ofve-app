import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientPointsController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  int currentPoints = 0;
  List<dynamic> history = [];
  String? errorMessage;
  String? successMessage;

  ClientPointsController() {
    loadPoints();
  }

  Future<void> loadPoints() async {
    isLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;

      // 1. Obtener puntos actuales
      final userRes = await _supabase
          .from('usuarios')
          .select('puntos_acumulados')
          .eq('id', userId)
          .single();
      currentPoints = userRes['puntos_acumulados'] ?? 0;

      // 2. Obtener historial
      final historyRes = await _supabase
          .from('historial_puntos')
          .select('*')
          .eq('usuario_id', userId)
          .order('fecha', ascending: false)
          .limit(20);
      history = historyRes;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> redeemPoints(int points) async {
    try {
      final userId = _supabase.auth.currentUser!.id;
      await _supabase.rpc('canjear_puntos', params: {
        'p_usuario_id': userId,
        'p_cantidad': points,
      });
      await loadPoints();
      successMessage = '¡Has canjeado $points puntos! Se aplicarán como descuento en tu próxima compra.';
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    }
  }
}
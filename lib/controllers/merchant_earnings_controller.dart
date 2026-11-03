import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MerchantEarningsController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> transactions = [];
  
  double totalHoy = 0.0;
  double totalSemana = 0.0;
  double totalMes = 0.0;
  double totalHistorico = 0.0;

  MerchantEarningsController() {
    loadEarnings();
  }

  Future<void> loadEarnings() async {
    isLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      final comercio = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      final comercioId = comercio['id'];

      // Buscamos las compras completadas
      final response = await _supabase
          .from('compras')
          .select('*, usuarios(nombre)')
          .eq('comercio_id', comercioId)
          .eq('estado', 'Completado')
          .order('fecha_compra', ascending: false);

      transactions = response;

      // Calculamos los totales
      final now = DateTime.now();
      final startOfDay = DateTime(now.year, now.month, now.day);
      final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
      final startOfMonth = DateTime(now.year, now.month, 1);

      double tHoy = 0, tSemana = 0, tMes = 0, tHist = 0;

      for (var t in transactions) {
        final amount = (t['total_pagado'] as num).toDouble();
        final date = DateTime.parse(t['fecha_compra']).toLocal();
        
        tHist += amount;

        if (date.isAfter(startOfMonth)) tMes += amount;
        if (date.isAfter(startOfWeek)) tSemana += amount;
        if (date.isAfter(startOfDay)) tHoy += amount;
      }

      totalHoy = tHoy;
      totalSemana = tSemana;
      totalMes = tMes;
      totalHistorico = tHist;

    } catch (e) {
      debugPrint('Error cargando ganancias: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
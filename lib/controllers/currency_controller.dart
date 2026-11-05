import 'package:flutter/material.dart';
import '../services/bcv_service.dart';

class CurrencyController extends ChangeNotifier {
  double bcvRate = 0.0;
  bool isLoading = true;
  String? errorMessage;

  CurrencyController() {
    fetchRate();
  }

  Future<void> fetchRate() async {
    isLoading = true;
    notifyListeners();

    try {
      bcvRate = await BcvService.getDollarRate();
      errorMessage = null;
    } catch (e) {
      debugPrint('Error obteniendo tasa BCV: $e');
      // FALLBACK: Si la API falla en Web por CORS, usamos una tasa de prueba
      // para que el diseño se vea. En Android tomará la real.
      bcvRate = 36.50; 
      errorMessage = 'Tasa referencial';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  String formatBs(double usd) {
    if (bcvRate == 0.0) return '... Bs';
    final bs = usd * bcvRate;
    final formatter = bs.toStringAsFixed(2).replaceAll('.', ',');
    final parts = formatter.split(',');
    final integerPart = parts[0].replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');
    return '$integerPart,${parts[1]} Bs';
  }
}
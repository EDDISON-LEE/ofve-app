import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/currency_controller.dart';

class CurrencyTicker extends StatefulWidget {
  const CurrencyTicker({super.key});

  @override
  State<CurrencyTicker> createState() => _CurrencyTickerState();
}

class _CurrencyTickerState extends State<CurrencyTicker> {
  final _controller = CurrencyController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        if (_controller.isLoading) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(12)),
            child: const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primaryPurple)),
          );
        }

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Padding ajustado
          decoration: BoxDecoration(
            color: AppColors.success.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.success.withValues(alpha: 0.5)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.attach_money, color: AppColors.success, size: 14),
              const SizedBox(width: 2),
              // --- TEXTO ACTUALIZADO AQUÍ ---
              Text(
                'TASA DEL DÍA: \$1 = ${_controller.bcvRate.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: AppColors.success, 
                  fontWeight: FontWeight.bold, 
                  fontSize: 11, // Letra un poco más pequeña para que quepa bien
                ),
              ),
              // ------------------------------
              const SizedBox(width: 4),
              GestureDetector(
                onTap: _controller.fetchRate,
                child: const Icon(Icons.refresh, color: AppColors.success, size: 12),
              )
            ],
          ),
        );
      },
    );
  }
}
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
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        if (_controller.isLoading) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const SizedBox(
              width: 12, height: 12,
              child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primaryPurple),
            ),
          );
        }

        if (_controller.errorMessage != null) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.error.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text('Tasa no disponible', style: TextStyle(color: AppColors.error, fontSize: 11)),
          );
        }

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.success.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.success.withValues(alpha: 0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.attach_money, color: AppColors.success, size: 16),
              const SizedBox(width: 4),
              Text(
                'Tasa BCV: ${_controller.bcvRate.toStringAsFixed(2)} Bs',
                style: const TextStyle(color: AppColors.success, fontWeight: FontWeight.bold, fontSize: 12),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: _controller.fetchRate,
                child: const Icon(Icons.refresh, color: AppColors.success, size: 14),
              )
            ],
          ),
        );
      },
    );
  }
}
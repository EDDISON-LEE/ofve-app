import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/owner_financial_controller.dart';

class OwnerFinancialScreen extends StatefulWidget {
  const OwnerFinancialScreen({super.key});

  @override
  State<OwnerFinancialScreen> createState() => _OwnerFinancialScreenState();
}

class _OwnerFinancialScreenState extends State<OwnerFinancialScreen> {
  final _financialController = OwnerFinancialController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _financialController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(
            title: const Text('Reportes Financieros'),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh, color: AppColors.textDark),
                onPressed: _financialController.loadStats,
              )
            ],
          ),
          body: _financialController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TARJETA DE INGRESOS TOTALES
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [AppColors.darkCardColor, const Color(0xFF3D3785)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [BoxShadow(color: AppColors.darkCardColor.withValues(alpha: 0.3), blurRadius: 15, offset: const Offset(0, 8))],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Ingresos Totales de la Plataforma', style: TextStyle(color: Colors.white70, fontSize: 14)),
                            const SizedBox(height: 8),
                            Text(
                              '\$${(_financialController.totalSuscripciones + _financialController.totalPublicidad + _financialController.totalComisiones).toStringAsFixed(2)}',
                              style: const TextStyle(color: AppColors.white, fontSize: 36, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            const Text('Suscripciones + Publicidad + Comisiones', style: TextStyle(color: Colors.white54, fontSize: 11)),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),
                      const Text('Desglose de Ingresos de la App', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),

                      // DESGLOSE
                      _buildIncomeItem(
                        title: 'Suscripciones (Planes)',
                        amount: _financialController.totalSuscripciones,
                        icon: Icons.workspace_premium,
                        color: AppColors.primaryPurple,
                      ),
                      const SizedBox(height: 12),
                      _buildIncomeItem(
                        title: 'Publicidad (Ads)',
                        amount: _financialController.totalPublicidad,
                        icon: Icons.campaign,
                        color: Colors.amber,
                      ),
                      const SizedBox(height: 12),
                      _buildIncomeItem(
                        title: 'Comisiones por Ventas',
                        amount: _financialController.totalComisiones,
                        icon: Icons.percent,
                        color: AppColors.info,
                      ),
                      
                      const Divider(height: 40),

                      const Text('Métricas del Ecosistema', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      
                      // MÉTRICA DE VOLUMEN DE VENTAS
                      _buildIncomeItem(
                        title: 'Volumen de Ventas (Comercios)',
                        amount: _financialController.totalVentasApp,
                        icon: Icons.shopping_cart_checkout,
                        color: AppColors.success,
                        isVolume: true, 
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget _buildIncomeItem({
    required String title,
    required double amount,
    required IconData icon,
    required Color color,
    bool isVolume = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withValues(alpha: 0.1),
            radius: 24,
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                if (isVolume)
                  const Text('Transacciones completadas en la app', style: TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
          ),
          Text(
            '\$${amount.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isVolume ? AppColors.textDark : color),
          ),
        ],
      ),
    );
  }
}
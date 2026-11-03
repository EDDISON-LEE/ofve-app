import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import '../controllers/merchant_earnings_controller.dart';

class MerchantEarningsScreen extends StatefulWidget {
  const MerchantEarningsScreen({super.key});

  @override
  State<MerchantEarningsScreen> createState() => _MerchantEarningsScreenState();
}

class _MerchantEarningsScreenState extends State<MerchantEarningsScreen> {
  final _earningsController = MerchantEarningsController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _earningsController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(
            title: const Text('Mis Ganancias'),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh, color: AppColors.textDark),
                onPressed: _earningsController.loadEarnings,
              )
            ],
          ),
          body: _earningsController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TARJETA DE BALANCE HISTÓRICO
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
                          boxShadow: [BoxShadow(color: AppColors.darkCardColor.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Balance Total Histórico', style: TextStyle(color: Colors.white70, fontSize: 14)),
                            const SizedBox(height: 8),
                            Text(
                              '\$${_earningsController.totalHistorico.toStringAsFixed(2)}',
                              style: const TextStyle(color: AppColors.white, fontSize: 36, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // TARJETAS DE RESUMEN
                      Row(
                        children: [
                          _buildSummaryCard('Hoy', _earningsController.totalHoy, AppColors.info),
                          const SizedBox(width: 12),
                          _buildSummaryCard('Esta Semana', _earningsController.totalSemana, AppColors.success),
                          const SizedBox(width: 12),
                          _buildSummaryCard('Este Mes', _earningsController.totalMes, AppColors.warning),
                        ],
                      ),

                      const SizedBox(height: 30),
                      
                      const Text('Historial de Transacciones', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),

                      if (_earningsController.transactions.isEmpty)
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(32.0),
                            child: Text('Aún no tienes ventas completadas.', style: TextStyle(color: Colors.grey)),
                          ),
                        )
                      else
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _earningsController.transactions.length,
                          itemBuilder: (context, index) {
                            final t = _earningsController.transactions[index];
                            final date = DateTime.parse(t['fecha_compra']).toLocal();
                            final formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(date);
                            final clientName = t['usuarios']?['nombre'] ?? 'Cliente';

                            return Card(
                              margin: const EdgeInsets.only(bottom: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                leading: CircleAvatar(
                                  backgroundColor: AppColors.success.withOpacity(0.1),
                                  child: const Icon(Icons.attach_money, color: AppColors.success),
                                ),
                                title: Text('Venta a $clientName', style: const TextStyle(fontWeight: FontWeight.bold)),
                                subtitle: Text(formattedDate, style: const TextStyle(fontSize: 12)),
                                trailing: Text(
                                  '+\$${(t['total_pagado'] as num).toStringAsFixed(2)}',
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.success),
                                ),
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget _buildSummaryCard(String title, double amount, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
              '\$${amount.toStringAsFixed(0)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
            ),
          ],
        ),
      ),
    );
  }
}
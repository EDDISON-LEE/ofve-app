import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import '../controllers/merchant_sales_controller.dart';

class MerchantSalesScreen extends StatefulWidget {
  const MerchantSalesScreen({super.key});

  @override
  State<MerchantSalesScreen> createState() => _MerchantSalesScreenState();
}

class _MerchantSalesScreenState extends State<MerchantSalesScreen> {
  final _salesController = MerchantSalesController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _salesController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Mis Ventas')),
          body: _salesController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : _salesController.sales.isEmpty
                  ? const Center(child: Text('Aún no tienes ventas registradas.', style: TextStyle(color: Colors.grey)))
                  : RefreshIndicator(
                      onRefresh: _salesController.loadSales,
                      color: AppColors.primaryPurple,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: _salesController.sales.length,
                        itemBuilder: (context, index) {
                          final sale = _salesController.sales[index];
                          final fecha = DateTime.parse(sale['fecha_compra']).toLocal();
                          final fechaStr = DateFormat('dd/MM/yyyy HH:mm').format(fecha);
                          final total = (sale['total_pagado'] as num).toDouble();
                          final cliente = sale['usuarios']?['nombre'] ?? 'Cliente';
                          
                          final bool validado = sale['validado_por_cliente'] ?? false;
                          final bool completado = sale['estado'] == 'Completado';
                          final bool pendiente = sale['estado'] == 'Pendiente';

                          // Lógica de colores para el comercio
                          Color statusColor = AppColors.warning;
                          String statusText = 'Por Escanear';
                          IconData statusIcon = Icons.qr_code;

                          if (validado) {
                            statusColor = AppColors.success;
                            statusText = 'Completado';
                            statusIcon = Icons.check_circle;
                          } else if (completado) {
                            statusColor = AppColors.info; // Azul
                            statusText = 'Esperando Validación';
                            statusIcon = Icons.hourglass_empty;
                          }

                          return Card(
                            margin: const EdgeInsets.only(bottom: 12),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(cliente, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                        decoration: BoxDecoration(color: statusColor.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
                                        child: Row(
                                          children: [
                                            Icon(statusIcon, size: 12, color: statusColor),
                                            const SizedBox(width: 4),
                                            Text(statusText, style: TextStyle(color: statusColor, fontSize: 10, fontWeight: FontWeight.bold)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(fechaStr, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text('Total de la venta', style: TextStyle(fontSize: 11, color: Colors.grey)),
                                          Text('\$${total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primaryPurple)),
                                        ],
                                      ),
                                      if (pendiente)
                                        OutlinedButton(
                                          onPressed: () {
                                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ve al escáner para validar esta compra.')));
                                          },
                                          child: const Text('Escanear QR', style: TextStyle(fontSize: 12)),
                                        )
                                      else if (completado && !validado)
                                        const Text('El cliente debe calificar', style: TextStyle(fontSize: 11, color: Colors.grey, fontStyle: FontStyle.italic))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
        );
      },
    );
  }
}
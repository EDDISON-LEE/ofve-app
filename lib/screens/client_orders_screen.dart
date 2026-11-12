import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../core/theme/app_theme.dart';
import '../controllers/client_orders_controller.dart';
import 'client_validation_screen.dart'; // <-- NUEVO IMPORT

class ClientOrdersScreen extends StatefulWidget {
  const ClientOrdersScreen({super.key});

  @override
  State<ClientOrdersScreen> createState() => _ClientOrdersScreenState();
}

class _ClientOrdersScreenState extends State<ClientOrdersScreen> {
  final _ordersController = ClientOrdersController();

  void _mostrarQR(String qrToken, String nombreComercio, double total) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Tu Código de Compra', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(nombreComercio, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(16),
              ),
              child: QrImageView(
                data: qrToken,
                version: QrVersions.auto,
                size: 200.0,
                backgroundColor: Colors.white,
                eyeStyle: const QrEyeStyle(eyeShape: QrEyeShape.square, color: AppColors.darkCardColor),
                dataModuleStyle: const QrDataModuleStyle(dataModuleShape: QrDataModuleShape.square, color: AppColors.darkCardColor),
              ),
            ),
            const SizedBox(height: 16),
            Text('Total: \$${total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryPurple)),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Cerrar'),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ordersController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Mis Compras')),
          body: _ordersController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : _ordersController.orders.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_bag_outlined, size: 80, color: Colors.grey),
                          SizedBox(height: 16),
                          Text('Aún no tienes compras.', style: TextStyle(fontSize: 18, color: AppColors.textLight)),
                          Text('¡Explora las ofertas y empieza a ahorrar!', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: _ordersController.loadOrders,
                      color: AppColors.primaryPurple,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: _ordersController.orders.length,
                        itemBuilder: (context, index) {
                          final order = _ordersController.orders[index];
                          final comercio = order['comercios']?['nombre_comercial'] ?? 'Comercio';
                          final fecha = DateTime.parse(order['fecha_compra']).toLocal();
                          final formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(fecha);
                          final total = (order['total_pagado'] as num).toDouble();
                          
                          final bool validado = order['validado_por_cliente'] ?? false;
                          final bool completado = order['estado'] == 'Completado';
                          final bool pendiente = order['estado'] == 'Pendiente';

                          Color statusColor = AppColors.warning;
                          String statusText = 'Pendiente';
                          if (validado) {
                            statusColor = AppColors.success;
                            statusText = 'Validado';
                          } else if (completado) {
                            statusColor = Colors.orange; // Naranja llama a la acción
                            statusText = '¡Por Validar!';
                          }

                          return Card(
                            margin: const EdgeInsets.only(bottom: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              // Borde naranja si está pendiente por validar
                              side: (completado && !validado) 
                                  ? BorderSide(color: Colors.orange.withValues(alpha: 0.5), width: 2) 
                                  : BorderSide.none,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(comercio, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textDark)),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                        decoration: BoxDecoration(color: statusColor.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
                                        child: Text(statusText, style: TextStyle(color: statusColor, fontSize: 10, fontWeight: FontWeight.bold)),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(formattedDate, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                                  const SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Total: \$${total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primaryPurple)),
                                      
                                      // BOTÓN DE ACCIÓN SEGÚN ESTADO
                                      if (pendiente)
                                        ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(backgroundColor: AppColors.darkCardColor),
                                          onPressed: () => _mostrarQR(order['qr_token'], comercio, total),
                                          icon: const Icon(Icons.qr_code, size: 16, color: AppColors.white),
                                          label: const Text('Ver QR', style: TextStyle(color: AppColors.white, fontSize: 12)),
                                        )
                                      else if (completado && !validado)
                                        ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.orange,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                          ),
                                          onPressed: () async {
                                            // FIX: Navegamos a la pantalla de validación
                                            await Navigator.push(
                                              context, 
                                              MaterialPageRoute(builder: (_) => const ClientValidationScreen())
                                            );
                                            // Al volver, recargamos la lista para actualizar el estado
                                            if (mounted) _ordersController.loadOrders();
                                          },
                                          icon: const Icon(Icons.star, size: 16, color: Colors.white),
                                          label: const Text('Validar y Ganar Pts', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                                        )
                                      else
                                        const Row(
                                          children: [
                                            Icon(Icons.check_circle, color: AppColors.success, size: 20),
                                            SizedBox(width: 4),
                                            Text('Completado', style: TextStyle(color: AppColors.success, fontSize: 12, fontWeight: FontWeight.bold)),
                                          ],
                                        ),
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
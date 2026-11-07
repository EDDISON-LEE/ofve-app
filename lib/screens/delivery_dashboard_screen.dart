import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart'; // <-- NUEVO IMPORT
import '../core/theme/app_theme.dart';
import '../controllers/delivery_controller.dart';

class DeliveryDashboardScreen extends StatefulWidget {
  const DeliveryDashboardScreen({super.key});

  @override
  State<DeliveryDashboardScreen> createState() => _DeliveryDashboardScreenState();
}

class _DeliveryDashboardScreenState extends State<DeliveryDashboardScreen> {
  final _controller = DeliveryController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.bgTop,
        appBar: AppBar(
          title: const Text('Panel de Repartidor'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout, color: AppColors.error),
              onPressed: () => Supabase.instance.client.auth.signOut(),
            )
          ],
          bottom: const TabBar(
            indicatorColor: AppColors.primaryPurple,
            labelColor: AppColors.primaryPurple,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Disponibles', icon: Icon(Icons.map)),
              Tab(text: 'Mis Entregas', icon: Icon(Icons.delivery_dining)),
            ],
          ),
        ),
        body: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            if (_controller.isLoading) {
              return const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple));
            }
            if (_controller.errorMessage != null) {
              return Center(child: Text(_controller.errorMessage!, style: const TextStyle(color: Colors.red)));
            }
            return TabBarView(
              children: [
                _buildOrderList(_controller.availableOrders, isAvailable: true),
                _buildOrderList(_controller.myDeliveries, isAvailable: false),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildOrderList(List<dynamic> orders, {required bool isAvailable}) {
    if (orders.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(isAvailable ? Icons.check_circle_outline : Icons.inbox, size: 80, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              isAvailable ? 'No hay pedidos pendientes en tu zona.' : 'Aún no has aceptado ningún pedido.',
              style: const TextStyle(fontSize: 16, color: AppColors.textLight),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        final comercio = order['comercios'];
        final cliente = order['usuarios'];

        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Pedido #${order['id'].toString().substring(0, 6).toUpperCase()}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text('+\$${order['costo_delivery']}', style: const TextStyle(color: AppColors.success, fontWeight: FontWeight.bold, fontSize: 18)),
                  ],
                ),
                const Divider(),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.store, color: AppColors.primaryPurple),
                  title: Text('Recoger en: ${comercio?['nombre_comercial'] ?? 'Comercio'}', style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text(comercio?['direccion_texto'] ?? 'Sin dirección'),
                  // --- NUEVO: BOTÓN DE MAPA ---
                  trailing: IconButton(
                    icon: const Icon(Icons.map, color: AppColors.primaryPurple),
                    onPressed: () async {
                      final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=${comercio?['latitud']},${comercio?['longitud']}');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url, mode: LaunchMode.externalApplication);
                      }
                    },
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.person_pin_circle, color: AppColors.warning),
                  title: Text('Entregar a: ${cliente?['nombre'] ?? 'Cliente'}'),
                  subtitle: Text('Telf: ${cliente?['telefono'] ?? 'No registrado'}'),
                  // --- NUEVO: BOTÓN DE LLAMADA ---
                  trailing: IconButton(
                    icon: const Icon(Icons.phone, color: AppColors.success),
                    onPressed: () async {
                      final tel = cliente?['telefono'];
                      if (tel != null && tel.toString().isNotEmpty) {
                        final url = Uri.parse('tel:$tel');
                        if (await canLaunchUrl(url)) await launchUrl(url);
                      }
                    },
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isAvailable ? AppColors.primaryPurple : AppColors.success,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () async {
                      if (isAvailable) {
                        await _controller.acceptOrder(order['id']);
                      } else {
                        await _controller.completeDelivery(order['id']);
                      }
                    },
                    child: Text(
                      isAvailable ? 'Aceptar Pedido' : 'Marcar como Entregado',
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
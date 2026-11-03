import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import '../controllers/client_points_controller.dart';

class ClientPointsScreen extends StatefulWidget {
  const ClientPointsScreen({super.key});

  @override
  State<ClientPointsScreen> createState() => _ClientPointsScreenState();
}

class _ClientPointsScreenState extends State<ClientPointsScreen> {
  final _pointsController = ClientPointsController();

  void _mostrarCanje() {
    final ctrl = TextEditingController(text: '100');
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Canjear Puntos'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('100 puntos = \$1 de descuento'),
            const SizedBox(height: 12),
            TextField(
              controller: ctrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Puntos a canjear', prefixIcon: Icon(Icons.star)),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () async {
              final points = int.tryParse(ctrl.text) ?? 0;
              Navigator.pop(ctx);
              final success = await _pointsController.redeemPoints(points);
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(success ? _pointsController.successMessage! : _pointsController.errorMessage!),
                  backgroundColor: success ? AppColors.success : AppColors.error,
                ));
              }
            },
            child: const Text('Canjear'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pointsController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Mis Puntos')),
          body: _pointsController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // TARJETA DE PUNTOS
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [AppColors.primaryPurple, AppColors.primaryPurple.withOpacity(0.7)]),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [BoxShadow(color: AppColors.primaryPurple.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))],
                        ),
                        child: Column(
                          children: [
                            const Icon(Icons.stars, color: Colors.amber, size: 60),
                            const SizedBox(height: 12),
                            Text(
                              '${_pointsController.currentPoints}',
                              style: const TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold),
                            ),
                            const Text('Puntos Disponibles', style: TextStyle(color: Colors.white70, fontSize: 16)),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: AppColors.primaryPurple,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                ),
                                onPressed: _mostrarCanje,
                                child: const Text('Canjear Puntos', style: TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            )
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),
                      const Text('Historial de Puntos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),

                      if (_pointsController.history.isEmpty)
                        const Center(child: Text('No tienes movimientos aún.', style: TextStyle(color: Colors.grey)))
                      else
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _pointsController.history.length,
                          itemBuilder: (context, index) {
                            final item = _pointsController.history[index];
                            final fecha = DateTime.parse(item['fecha']).toLocal();
                            final formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(fecha);
                            final isPositive = item['cantidad'] > 0;

                            return Card(
                              margin: const EdgeInsets.only(bottom: 8),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: isPositive ? AppColors.success.withOpacity(0.1) : AppColors.error.withOpacity(0.1),
                                  child: Icon(isPositive ? Icons.add : Icons.remove, color: isPositive ? AppColors.success : AppColors.error),
                                ),
                                title: Text(item['motivo'], style: const TextStyle(fontWeight: FontWeight.w500)),
                                subtitle: Text(formattedDate, style: const TextStyle(fontSize: 11)),
                                trailing: Text(
                                  '${isPositive ? '+' : ''}${item['cantidad']}',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isPositive ? AppColors.success : AppColors.error),
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
}
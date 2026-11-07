import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../core/theme/app_theme.dart';
import '../controllers/admin_stats_controller.dart';

class AdminAnalyticsScreen extends StatefulWidget {
  const AdminAnalyticsScreen({super.key});

  @override
  State<AdminAnalyticsScreen> createState() => _AdminAnalyticsScreenState();
}

class _AdminAnalyticsScreenState extends State<AdminAnalyticsScreen> {
  final _controller = AdminStatsController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(
            title: const Text('Métricas Globales'),
            actions: [IconButton(icon: const Icon(Icons.refresh), onPressed: _controller.loadStats)],
          ),
          body: _controller.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- TARJETAS DE RESUMEN ---
                      Row(
                        children: [
                          _buildStatCard('Usuarios Totales', _controller.stats['usuarios']?.toString() ?? '0', Icons.people, AppColors.info),
                          const SizedBox(width: 12),
                          _buildStatCard('Comercios', _controller.stats['comercios']?.toString() ?? '0', Icons.store, AppColors.primaryPurple),
                          const SizedBox(width: 12),
                          _buildStatCard('Suspendidos', _controller.stats['suspendidos']?.toString() ?? '0', Icons.block, AppColors.error),
                        ],
                      ),
                      
                      const SizedBox(height: 24),
                      const Text('Estado de las Compras', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),

                      // --- GRÁFICO DE PASTEL (Compras) ---
                      Container(
                        height: 200,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          children: [
                            Expanded(
                              child: PieChart(
                                PieChartData(
                                  sectionsSpace: 2,
                                  centerSpaceRadius: 40,
                                  sections: [
                                    PieChartSectionData(
                                      value: 100, // Esto es un placeholder visual, puedes calcularlo con las compras completadas
                                      color: AppColors.success,
                                      title: 'Completadas',
                                      radius: 50,
                                      titleStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
                                    ),
                                    PieChartSectionData(
                                      value: (_controller.stats['compras_pendientes'] as num?)?.toDouble() ?? 10.0,
                                      color: AppColors.warning,
                                      title: 'Pendientes',
                                      radius: 50,
                                      titleStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildLegend(AppColors.success, 'Completadas'),
                                const SizedBox(height: 8),
                                _buildLegend(AppColors.warning, 'Pendientes (${_controller.stats['compras_pendientes'] ?? 0})'),
                              ],
                            )
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),
                      const Text('Top 5 Mejores Clientes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),

                      // --- LISTA DE TOP CLIENTES ---
                      if (_controller.stats['top_clientes'] != null)
                        ...(_controller.stats['top_clientes'] as List).map((c) => Card(
                          child: ListTile(
                            leading: const CircleAvatar(backgroundColor: Colors.amber, child: Icon(Icons.star, color: Colors.white)),
                            title: Text(c['nombre'] ?? 'Cliente', style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(c['email'] ?? ''),
                            trailing: Text('\$${(c['total_gastado'] as num).toStringAsFixed(2)}', style: const TextStyle(color: AppColors.success, fontWeight: FontWeight.bold, fontSize: 16)),
                          ),
                        )),

                      const SizedBox(height: 24),
                      const Text('Uso de Funcionalidades IA', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      
                      // --- USO DE FUNCIONALIDADES ---
                      Row(
                        children: [
                          _buildStatCard('Compras Planificadas', _controller.stats['usos_planificada']?.toString() ?? '0', Icons.calendar_today, AppColors.primaryPurple),
                          const SizedBox(width: 12),
                          _buildStatCard('Compras Guiadas', _controller.stats['usos_guiada']?.toString() ?? '0', Icons.auto_awesome, AppColors.info),
                        ],
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))]),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildLegend(Color color, String text) {
    return Row(
      children: [
        Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
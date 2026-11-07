import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import 'merchant_plans_screen.dart';

class MerchantMetricsScreen extends StatefulWidget {
  const MerchantMetricsScreen({super.key});

  @override
  State<MerchantMetricsScreen> createState() => _MerchantMetricsScreenState();
}

class _MerchantMetricsScreenState extends State<MerchantMetricsScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;

  double _totalIngresos = 0.0;
  int _totalVentas = 0;
  int _ofertasActivas = 0;
  List<dynamic> _ventasRecientes = [];
  
  List<double> _weeklySales = List.filled(7, 0.0);
  final List<String> _weekDays = ['L', 'M', 'M', 'J', 'V', 'S', 'D'];

  @override
  void initState() {
    super.initState();
    _loadMetrics();
  }

  Future<void> _loadMetrics() async {
    setState(() => _isLoading = true);
    try {
      final userId = _supabase.auth.currentUser!.id;
      final comercio = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      final comercioId = comercio['id'];

      final compras = await _supabase.from('compras').select('*').eq('comercio_id', comercioId).eq('estado', 'Completado').order('fecha_compra', ascending: false);
      final countOfertas = await _supabase.from('ofertas').select('id').eq('comercio_id', comercioId).eq('estado', 'Activa').count();

      double ingresos = 0;
      List<double> tempWeekly = List.filled(7, 0.0);
      final now = DateTime.now();
      final startOfWeek = now.subtract(Duration(days: now.weekday - 1));

      for (var compra in compras) {
        ingresos += (compra['total_pagado'] as num).toDouble();
        final fechaCompra = DateTime.parse(compra['fecha_compra']).toLocal();
        if (fechaCompra.isAfter(startOfWeek)) {
          int dayIndex = fechaCompra.weekday - 1;
          tempWeekly[dayIndex] += (compra['total_pagado'] as num).toDouble();
        }
      }

      setState(() {
        _totalIngresos = ingresos;
        _totalVentas = compras.length;
        _ofertasActivas = countOfertas.count;
        _ventasRecientes = compras.take(5).toList();
        _weeklySales = tempWeekly;
      });
    } catch (e) {
      debugPrint('Error cargando métricas: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    double maxSale = _weeklySales.reduce((a, b) => a > b ? a : b);
    if (maxSale == 0) maxSale = 100;

    return Scaffold(
      backgroundColor: AppColors.bgTop,
      appBar: AppBar(
        title: const Text('Tus Métricas', style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.refresh, color: AppColors.textDark), onPressed: _loadMetrics)
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Resumen de Impacto', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text('Así está rindiendo tu negocio en OfVe hoy.', style: TextStyle(fontSize: 14, color: AppColors.textLight)),
                  const SizedBox(height: 24),

                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [AppColors.darkCardColor, Color(0xFF3D3785)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [BoxShadow(color: AppColors.darkCardColor.withValues(alpha: 0.3), blurRadius: 15, offset: const Offset(0, 8))],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Ganancias Totales', style: TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500)),
                                  Icon(Icons.account_balance_wallet, color: Colors.white54, size: 20),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text('\$${_totalIngresos.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(color: AppColors.success.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(8)),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.trending_up, color: Colors.greenAccent, size: 14),
                                    SizedBox(width: 4),
                                    Text('+12% este mes', style: TextStyle(color: Colors.greenAccent, fontSize: 11, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 4))]),
                              child: Column(
                                children: [
                                  const Icon(Icons.shopping_bag, color: AppColors.info, size: 24),
                                  const SizedBox(height: 8),
                                  Text('$_totalVentas', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                                  const Text('Ventas', style: TextStyle(fontSize: 11, color: Colors.grey)),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 4))]),
                              child: Column(
                                children: [
                                  const Icon(Icons.local_offer, color: AppColors.warning, size: 24),
                                  const SizedBox(height: 8),
                                  Text('$_ofertasActivas', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                                  const Text('Ofertas', style: TextStyle(fontSize: 11, color: Colors.grey)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 15, offset: const Offset(0, 5))]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Ventas de la Semana', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: List.generate(7, (index) {
                            double heightFactor = _weeklySales[index] / maxSale;
                            if (heightFactor < 0.05) heightFactor = 0.05;
                            return Column(
                              children: [
                                Text(_weeklySales[index] > 0 ? '\$${_weeklySales[index].toStringAsFixed(0)}' : '', style: const TextStyle(fontSize: 9, color: Colors.grey, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 4),
                                Container(width: 24, height: 80 * heightFactor, decoration: BoxDecoration(color: _weeklySales[index] > 0 ? AppColors.primaryPurple : Colors.grey.shade200, borderRadius: BorderRadius.circular(8))),
                                const SizedBox(height: 8),
                                Text(_weekDays[index], style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold)),
                              ],
                            );
                          }),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  const Text('Últimas Ventas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  if (_ventasRecientes.isEmpty)
                    Container(
                      padding: const EdgeInsets.all(30),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
                      child: const Text('Aún no tienes ventas completadas.\n¡Comparte tus ofertas!', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
                    )
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _ventasRecientes.length,
                      itemBuilder: (context, index) {
                        final venta = _ventasRecientes[index];
                        final fecha = DateTime.parse(venta['fecha_compra']).toLocal();
                        final fechaFormateada = DateFormat('dd/MM HH:mm').format(fecha);

                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 8, offset: const Offset(0, 2))]),
                          child: ListTile(
                            leading: CircleAvatar(backgroundColor: AppColors.success.withValues(alpha: 0.1), child: const Icon(Icons.check, color: AppColors.success)),
                            title: Text('Orden #${venta['id'].toString().substring(0, 6).toUpperCase()}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                            subtitle: Text('$fechaFormateada • Pago Móvil/Cash', style: const TextStyle(fontSize: 11)),
                            trailing: Text('\$${(venta['total_pagado'] as num).toStringAsFixed(2)}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.success)),
                          ),
                        );
                      },
                    ),

                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(color: const Color(0xFFFFF3E0), borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColors.warning.withValues(alpha: 0.3))),
                    child: Row(
                      children: [
                        const Icon(Icons.rocket_launch, color: Colors.deepOrange, size: 40),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('¿Quieres multiplicar estas ventas?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.deepOrange)),
                              const SizedBox(height: 4),
                              const Text('Con el Plan Élite aparecerás primero en las búsquedas cercanas. ¡Haz que te encuentren primero!', style: TextStyle(fontSize: 12, color: AppColors.textDark)),
                              const SizedBox(height: 12),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange, padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
                                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MerchantPlansScreen())),
                                child: const Text('Ver Planes', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
    );
  }
}
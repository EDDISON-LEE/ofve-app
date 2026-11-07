import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';

class ClientPlannedPurchasesScreen extends StatefulWidget {
  const ClientPlannedPurchasesScreen({super.key});

  @override
  State<ClientPlannedPurchasesScreen> createState() => _ClientPlannedPurchasesScreenState();
}

class _ClientPlannedPurchasesScreenState extends State<ClientPlannedPurchasesScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _plans = [];

  @override
  void initState() {
    super.initState();
    _loadPlans();
  }

  Future<void> _loadPlans() async {
    setState(() => _isLoading = true);
    try {
      final userId = _supabase.auth.currentUser!.id;
      final response = await _supabase
          .from('planes_compra')
          .select('*')
          .eq('usuario_id', userId)
          .order('fecha_creacion', ascending: false);
      setState(() => _plans = response);
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgTop,
      appBar: AppBar(title: const Text('Mis Compras Planificadas')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
          : _plans.isEmpty
              ? const Center(child: Text('No tienes compras planificadas.', style: TextStyle(color: Colors.grey)))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _plans.length,
                  itemBuilder: (context, index) {
                    final plan = _plans[index];
                    final fecha = DateTime.parse(plan['fecha_planificada']).toLocal();
                    final fechaStr = DateFormat('dd/MM/yyyy').format(fecha);
                    final items = plan['items_solicitados'] as List<dynamic>? ?? [];

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
                                Text('Plan del: $fechaStr', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(color: AppColors.info.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
                                  child: Text(plan['estado'], style: const TextStyle(color: AppColors.info, fontSize: 10, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text('Zona: ${plan['sector_busqueda'] ?? 'No especificada'}', style: const TextStyle(color: Colors.grey, fontSize: 13)),
                            const Divider(),
                            ...items.map((item) => Text('• ${item['cantidad']}x ${item['nombre']}')).toList(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
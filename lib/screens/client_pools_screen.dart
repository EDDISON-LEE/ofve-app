import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';

class ClientPoolsScreen extends StatefulWidget {
  const ClientPoolsScreen({super.key});

  @override
  State<ClientPoolsScreen> createState() => _ClientPoolsScreenState();
}

class _ClientPoolsScreenState extends State<ClientPoolsScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _demandas = [];

  @override
  void initState() {
    super.initState();
    _loadDemandas();
  }

  Future<void> _loadDemandas() async {
    setState(() => _isLoading = true);
    try {
      final userId = _supabase.auth.currentUser!.id;
      final response = await _supabase
          .from('demanda_participantes')
          .select('demanda_id, demandas_agrupadas(*)')
          .eq('usuario_id', userId)
          .order('demandas_agrupadas(fecha_creacion)', ascending: false);
      
      _demandas = response.map((p) => p['demandas_agrupadas']).toList();
    } catch (e) {
      debugPrint('Error cargando pools: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgTop,
      appBar: AppBar(
        title: const Text('Pools Comunitarios'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _loadDemandas)
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
          : _demandas.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.groups, size: 80, color: Colors.grey),
                      SizedBox(height: 16),
                      Text('No estás participando en ningún Pool.', style: TextStyle(fontSize: 18, color: AppColors.textLight)),
                      Text('Busca un producto para iniciar uno.', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _demandas.length,
                  itemBuilder: (context, index) {
                    final demanda = _demandas[index];
                    final actual = demanda['unidades_actuales'] ?? 0;
                    final meta = demanda['meta_unidades'] ?? 1;
                    final progress = actual / meta;
                    final isMetaAlcanzada = demanda['estado'] == 'Meta Alcanzada';

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
                                Text(
                                  demanda['termino_original'].toString().toUpperCase(), 
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: isMetaAlcanzada ? AppColors.success.withOpacity(0.1) : AppColors.warning.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Text(
                                    demanda['estado'].toString().toUpperCase(),
                                    style: TextStyle(
                                      color: isMetaAlcanzada ? AppColors.success : AppColors.warning,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            LinearProgressIndicator(
                              value: progress > 1.0 ? 1.0 : progress,
                              backgroundColor: Colors.grey[200],
                              color: isMetaAlcanzada ? AppColors.success : AppColors.primaryPurple,
                              minHeight: 10,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            const SizedBox(height: 8),
                            Text('$actual de $meta personas buscando este producto.', style: const TextStyle(color: Colors.grey, fontSize: 13)),
                            
                            if (isMetaAlcanzada) ...[
                              const SizedBox(height: 16),
                              const Text('¡Meta alcanzada! Esperando oferta del comercio...', style: TextStyle(color: AppColors.success, fontWeight: FontWeight.bold, fontSize: 12)),
                            ]
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
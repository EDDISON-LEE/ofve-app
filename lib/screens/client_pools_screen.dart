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
      
      final participaciones = await _supabase
          .from('demanda_participantes')
          .select('demanda_id')
          .eq('usuario_id', userId);

      final ids = participaciones.map((p) => p['demanda_id']).toSet().toList();

      if (ids.isNotEmpty) {
        final response = await _supabase
            .from('demandas_agrupadas')
            .select('*')
            .inFilter('id', ids)
            .order('fecha_creacion', ascending: false);
        
        _demandas = response;
      } else {
        _demandas = [];
      }
    } catch (e) {
      debugPrint('Error cargando pools: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  // --- NUEVO MÉTODO DE RESERVA ---
  void _mostrarDialogoReserva(dynamic demanda) {
    final qtyCtrl = TextEditingController(text: '1');
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Reservar ${demanda['termino_original']}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('¿Cuántas unidades necesitas al por mayor?'),
            const SizedBox(height: 16),
            TextField(
              controller: qtyCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Cantidad', border: OutlineInputBorder()),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () async {
              final qty = int.tryParse(qtyCtrl.text) ?? 1;
              try {
                // Buscamos la oferta activa asociada a esta demanda
                final poolData = await _supabase
                    .from('pools_comunitarios')
                    .select('id')
                    .eq('demanda_id', demanda['id'])
                    .maybeSingle();

                if (poolData == null) throw Exception('La oferta aún no está lista.');

                // Insertamos la reserva
                await _supabase.from('pools_participantes').insert({
                  'pool_id': poolData['id'],
                  'usuario_id': _supabase.auth.currentUser!.id,
                  'cantidad_comprometida': qty,
                });

                if (ctx.mounted) {
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('¡Reserva confirmada! El comercio preparará tu pedido.'), backgroundColor: AppColors.success));
                }
              } catch (e) {
                if (ctx.mounted) {
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error al reservar: $e'), backgroundColor: AppColors.error));
                }
              }
            },
            child: const Text('Confirmar Reserva'),
          ),
        ],
      ),
    );
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
                    final estado = demanda['estado'].toString();
                    final isMetaAlcanzada = estado == 'Meta Alcanzada';
                    final isOfertaCreada = estado == 'Oferta Creada';

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
                                    color: isOfertaCreada ? AppColors.primaryPurple.withOpacity(0.1) : (isMetaAlcanzada ? AppColors.success.withOpacity(0.1) : AppColors.warning.withOpacity(0.1)),
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Text(
                                    estado.toUpperCase(),
                                    style: TextStyle(
                                      color: isOfertaCreada ? AppColors.primaryPurple : (isMetaAlcanzada ? AppColors.success : AppColors.warning),
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
                              color: isOfertaCreada ? AppColors.primaryPurple : (isMetaAlcanzada ? AppColors.success : AppColors.primaryPurple),
                              minHeight: 10,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            const SizedBox(height: 8),
                            Text('$actual de $meta personas buscando este producto.', style: const TextStyle(color: Colors.grey, fontSize: 13)),
                            
                            // --- LÓGICA DE ESTADOS VISUALES ---
                            if (isOfertaCreada) ...[
                              const SizedBox(height: 16),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryPurple),
                                  onPressed: () => _mostrarDialogoReserva(demanda),
                                  icon: const Icon(Icons.shopping_cart_checkout, color: Colors.white),
                                  label: const Text('Reservar mi cantidad', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ] else if (isMetaAlcanzada) ...[
                              const SizedBox(height: 16),
                              const Text('¡Meta alcanzada! Esperando que el comercio active la oferta...', style: TextStyle(color: AppColors.success, fontWeight: FontWeight.bold, fontSize: 12)),
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
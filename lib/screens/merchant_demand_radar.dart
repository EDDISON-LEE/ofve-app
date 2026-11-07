import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';
import 'merchant_wholesale_offers_screen.dart'; 

class MerchantDemandRadar extends StatefulWidget {
  final String categoriaComercio;
  const MerchantDemandRadar({super.key, required this.categoriaComercio});

  @override
  State<MerchantDemandRadar> createState() => _MerchantDemandRadarState();
}

class _MerchantDemandRadarState extends State<MerchantDemandRadar> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  
  List<dynamic> _demandasPools = [];
  List<dynamic> _busquedasFallidas = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      // 1. Cargar Pools (Demandas agrupadas)
      final responsePools = await _supabase
          .from('demandas_agrupadas')
          .select('*')
          .inFilter('estado', ['Buscando', 'Meta Alcanzada'])
          .order('fecha_creacion', ascending: false);
      
      // 2. Cargar Búsquedas Fallidas (Inteligencia de Mercado por Categoría)
      final responseBusquedas = await _supabase
          .from('busquedas_fallidas')
          .select('termino_busqueda, categoria_ia')
          .eq('categoria_ia', widget.categoriaComercio);

      // Agrupar las búsquedas fallidas por término y contar
      final Map<String, int> conteo = {};
      for (var item in responseBusquedas) {
        final term = item['termino_busqueda'].toString().toLowerCase();
        conteo[term] = (conteo[term] ?? 0) + 1;
      }
      
      final sortedList = conteo.entries.toList()..sort((a, b) => b.value.compareTo(a.value));

      if (mounted) {
        setState(() {
          _demandasPools = responsePools;
          _busquedasFallidas = sortedList.take(5).map((e) => {'termino': e.key, 'cantidad': e.value}).toList();
        });
      }
    } catch (e) {
      debugPrint('Error cargando radar: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _mostrarFormularioPrecio(dynamic demanda) {
    final priceCtrl = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('Activar Oferta al Mayor: ${demanda['termino_original']}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hay ${demanda['unidades_actuales']} clientes esperando este producto.', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Define el precio por unidad para el pool comunitario:', style: TextStyle(fontSize: 13, color: Colors.grey)),
            const SizedBox(height: 16),
            TextField(
              controller: priceCtrl,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Precio al Mayor por Unidad (\$)',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.success),
            onPressed: () async {
              final precio = double.tryParse(priceCtrl.text.replaceAll(',', '.'));
              if (precio == null || precio <= 0) return;

              // Mostramos un indicador de carga
              showDialog(context: context, barrierDismissible: false, builder: (_) => const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple)));

              try {
                final userId = _supabase.auth.currentUser!.id;
                final comercioData = await _supabase.from('comercios').select('id, nombre_comercial').eq('usuario_id', userId).single();

                // 1. Crear el Pool Comunitario
                await _supabase.from('pools_comunitarios').insert({
                  'producto_nombre': demanda['termino_original'],
                  'meta_usuarios': demanda['meta_unidades'],
                  'usuarios_comprometidos': demanda['unidades_actuales'],
                  'precio_mayorista_sugerido': precio,
                  'estado': 'Activo',
                  'creado_por_comercio': comercioData['id'],
                  'demanda_id': demanda['id'],
                  'latitud': demanda['latitud_centro'],
                  'longitud': demanda['longitud_centro'],
                });

                // 2. Actualizar la demanda para que desaparezca del radar
                await _supabase.from('demandas_agrupadas').update({'estado': 'Oferta Creada'}).eq('id', demanda['id']);

                // 3. Enviar Notificación Push a los clientes participantes
                final participantes = await _supabase
                    .from('demanda_participantes')
                    .select('usuarios(email)')
                    .eq('demanda_id', demanda['id']);
                
                for (var p in participantes) {
                  final email = p['usuarios']?['email'];
                  if (email != null) {
                    await _supabase.functions.invoke('send-push', body: {
                      'target_email': email,
                      'title': '🚨 ¡Tu búsqueda dio frutos! ${demanda['termino_original']} al Mayor',
                      'body': 'El comercio ${comercioData['nombre_comercial']} activó un precio de fábrica. Únete a los otros buscadores de tu zona y reserva tu cantidad. ¡Stock exclusivo limitado!',
                      'data': {'ruta': '/pools'}
                    });
                  }
                }

                if (ctx.mounted) {
                  Navigator.pop(ctx); // Cierra el formulario
                  Navigator.pop(context); // Cierra el loader
                  
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('¡Oferta publicada y clientes notificados!'), backgroundColor: AppColors.success));
                  
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const MerchantWholesaleOffersScreen()),
                  );
                }
              } catch (e) {
                debugPrint('Error creando pool: $e');
                if (ctx.mounted) {
                  Navigator.pop(ctx);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error al publicar: $e'), backgroundColor: AppColors.error));
                }
              }
            },
            child: const Text('Publicar Oferta'),
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
        title: const Text('Radar de Demanda'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _loadData)
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- SECCIÓN 1: BÚSQUEDAS FALLIDAS (Inteligencia de Mercado) ---
                  const Text('🔥 Búsquedas insatisfechas en tu ramo', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                  const SizedBox(height: 4),
                  const Text('Si agregas estos productos a tu inventario, captarás ventas inmediatas.', style: TextStyle(color: Colors.grey, fontSize: 13)),
                  const SizedBox(height: 12),

                  if (_busquedasFallidas.isEmpty)
                    const Card(
                      color: AppColors.white,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Aún no hay búsquedas insatisfechas registradas en tu categoría.', style: TextStyle(color: Colors.grey)),
                      ),
                    )
                  else
                    ..._busquedasFallidas.map((item) => Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      color: AppColors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        leading: const Icon(Icons.search_off, color: AppColors.warning),
                        title: Text(item['termino'].toString().toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold)),
                        trailing: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                          child: Text('${item['cantidad']} búsquedas', style: const TextStyle(color: AppColors.warning, fontWeight: FontWeight.bold, fontSize: 12)),
                        ),
                      ),
                    )),

                  const Divider(height: 40, thickness: 1),

                  // --- SECCIÓN 2: ALTA DEMANDA (Pools Comunitarios) ---
                  const Text('📦 Alta Demanda: Clientes esperando Bultos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                  const SizedBox(height: 12),

                  if (_demandasPools.isEmpty)
                    const Text('No hay demandas agrupadas en tu zona.', style: TextStyle(color: Colors.grey))
                  else
                    ..._demandasPools.map((demanda) {
                      final isMeta = demanda['estado'] == 'Meta Alcanzada';
                      final clientes = demanda['unidades_actuales'];

                      if (!isMeta) {
                        return Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          color: AppColors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                const Icon(Icons.radar, color: AppColors.primaryPurple),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    '${demanda['termino_original'].toString().toUpperCase()}: $clientes personas buscando.',
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text('${demanda['unidades_actuales']}/${demanda['meta_unidades']}', style: const TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                        );
                      }

                      // Tarjeta verde de oportunidad (Meta Alcanzada)
                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.success, width: 2),
                          boxShadow: [BoxShadow(color: AppColors.success.withOpacity(0.1), blurRadius: 15, offset: const Offset(0, 5))],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              decoration: const BoxDecoration(
                                color: AppColors.success,
                                borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.trending_up, color: Colors.white, size: 24),
                                  const SizedBox(width: 8),
                                  Text(
                                    '¡OPORTUNIDAD: ${demanda['termino_original'].toString().toUpperCase()}!',
                                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Un total de $clientes clientes cerca de ti están buscando este producto.',
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.textDark),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    '¡Aprovecha la oportunidad! Si activas una oferta al por mayor, podrías vender 1 o más bultos de una sola vez.',
                                    style: TextStyle(fontSize: 13, color: AppColors.textLight, height: 1.4),
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child: ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.success,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                      ),
                                      onPressed: () => _mostrarFormularioPrecio(demanda),
                                      icon: const Icon(Icons.local_offer, color: Colors.white),
                                      label: const Text('Activar Oferta al Mayor', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                ],
              ),
            ),
    );
  }
}
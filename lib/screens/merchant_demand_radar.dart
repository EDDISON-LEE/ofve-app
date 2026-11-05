import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';

class MerchantDemandRadar extends StatefulWidget {
  final String categoriaComercio;
  const MerchantDemandRadar({super.key, required this.categoriaComercio});

  @override
  State<MerchantDemandRadar> createState() => _MerchantDemandRadarState();
}

class _MerchantDemandRadarState extends State<MerchantDemandRadar> {
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
      final response = await _supabase
          .from('demandas_agrupadas')
          .select('*')
          .inFilter('estado', ['Buscando', 'Meta Alcanzada'])
          .order('fecha_creacion', ascending: false);
      setState(() => _demandas = response);
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
        title: Text('Crear Pool: ${demanda['termino_original']}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Hay ${demanda['unidades_actuales']} clientes esperando.'),
            const SizedBox(height: 16),
            TextField(
              controller: priceCtrl,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Precio al Mayor por Unidad (\$)',
                prefixIcon: Icon(Icons.attach_money),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () async {
              final precio = double.tryParse(priceCtrl.text.replaceAll(',', '.'));
              if (precio == null || precio <= 0) return;

              try {
                final userId = _supabase.auth.currentUser!.id;
                final comercioData = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();

                await _supabase.from('pools_comunitarios').insert({
                  'producto_nombre': demanda['termino_original'],
                  'meta_usuarios': demanda['meta_unidades'],
                  'usuarios_comprometidos': demanda['unidades_actuales'],
                  'precio_mayorista_sugerido': precio,
                  'estado': 'Activo',
                  'creado_por_comercio': comercioData['id'],
                  'latitud': demanda['latitud_centro'],
                  'longitud': demanda['longitud_centro'],
                });

                await _supabase.from('demandas_agrupadas').update({'estado': 'Oferta Creada'}).eq('id', demanda['id']);

                if (ctx.mounted) {
                  Navigator.pop(ctx);
                  _loadDemandas();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('¡Pool creado exitosamente!'), backgroundColor: AppColors.success));
                }
              } catch (e) {
                debugPrint('Error creando pool: $e');
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
      appBar: AppBar(title: const Text('Radar de Demanda')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _demandas.length,
              itemBuilder: (context, index) {
                final demanda = _demandas[index];
                final isMeta = demanda['estado'] == 'Meta Alcanzada';

                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  color: isMeta ? AppColors.success.withOpacity(0.05) : AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: isMeta ? const BorderSide(color: AppColors.success, width: 2) : BorderSide.none,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(demanda['termino_original'].toString().toUpperCase(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text('${demanda['unidades_actuales']} de ${demanda['meta_unidades']} clientes buscan este producto.', style: const TextStyle(color: Colors.grey)),
                        const SizedBox(height: 16),
                        if (isMeta)
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(backgroundColor: AppColors.success),
                              onPressed: () => _mostrarFormularioPrecio(demanda),
                              icon: const Icon(Icons.local_offer, color: Colors.white),
                              label: const Text('¡Meta Alcanzada! Crear Venta al Mayor', style: TextStyle(color: Colors.white)),
                            ),
                          )
                        else
                          const Text('Esperando más clientes...', style: TextStyle(color: AppColors.warning, fontStyle: FontStyle.italic)),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
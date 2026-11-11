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
      final responsePools = await _supabase
          .from('demandas_agrupadas')
          .select('*')
          .inFilter('estado', ['Buscando', 'Meta Alcanzada'])
          .order('fecha_creacion', ascending: false);

      final responseBusquedas = await _supabase
          .from('busquedas_fallidas')
          .select('termino_busqueda, categoria_ia')
          .eq('categoria_ia', widget.categoriaComercio);

      final Map<String, int> conteo = {};
      for (var item in responseBusquedas) {
        final term = item['termino_busqueda'].toString().toLowerCase();
        conteo[term] = (conteo[term] ?? 0) + 1;
      }
      final sortedList = conteo.entries.toList()..sort((a, b) => b.value.compareTo(a.value));

      if (mounted) {
        setState(() {
          _demandasPools = responsePools;
          _busquedasFallidas =
              sortedList.take(5).map((e) => {'termino': e.key, 'cantidad': e.value}).toList();
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
            Text('Hay ${demanda['unidades_actuales']} clientes esperando este producto.',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Define el precio por unidad para el pool comunitario:',
                style: TextStyle(fontSize: 13, color: Colors.grey)),
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

              // FIX: capturamos navigator y messenger ANTES del await
              final navigator = Navigator.of(context);
              final messenger = ScaffoldMessenger.of(context);

              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => const Center(
                      child: CircularProgressIndicator(color: AppColors.primaryPurple)));

              try {
                final userId = _supabase.auth.currentUser!.id;
                final comercioData = await _supabase
                    .from('comercios')
                    .select('id, nombre_comercial')
                    .eq('usuario_id', userId)
                    .single();

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

                await _supabase
                    .from('demandas_agrupadas')
                    .update({'estado': 'Oferta Creada'}).eq('id', demanda['id']);

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
                      'body':
                          'El comercio ${comercioData['nombre_comercial']} activó un precio de fábrica. Únete a los otros buscadores de tu zona y reserva tu cantidad. ¡Stock exclusivo limitado!',
                      'data': {'ruta': '/pools'}
                    });
                  }
                }

                if (!mounted) return;
                navigator.pop(); // cierra loader
                if (ctx.mounted) navigator.pop(); // cierra formulario
                messenger.showSnackBar(const SnackBar(
                    content: Text('¡Oferta publicada y clientes notificados!'),
                    backgroundColor: AppColors.success));
                navigator.pushReplacement(
                  MaterialPageRoute(builder: (_) => const MerchantWholesaleOffersScreen()),
                );
              } catch (e) {
                debugPrint('Error creando pool: $e');
                if (!mounted) return;
                navigator.pop();
                if (ctx.mounted) navigator.pop();
                messenger.showSnackBar(SnackBar(
                    content: Text('Error al publicar: $e'),
                    backgroundColor: AppColors.error));
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
      backgroundColor: const Color(0xFFF7F8FA), // Fondo premium claro
      appBar: AppBar(
        title: const Text('Radar de Ganancias', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: -0.5)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        actions: [IconButton(icon: const Icon(Icons.refresh), onPressed: _loadData)],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- SECCIÓN 1: DINERO SOBRE LA MESA ---
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.amber.withValues(alpha: 0.2), shape: BoxShape.circle),
                        child: const Icon(Icons.savings, color: Colors.amber, size: 24),
                      ),
                      const SizedBox(width: 12),
                      const Text('Dinero sobre la mesa', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: AppColors.textDark, letterSpacing: -0.5)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const Text('Tus clientes buscan esto y no lo encuentran. Añádelo a tu inventario y captura ventas inmediatas.', style: TextStyle(color: Colors.grey, fontSize: 13, height: 1.4)),
                  const SizedBox(height: 16),

                  if (_busquedasFallidas.isEmpty)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(color: Colors.green.withValues(alpha: 0.1), blurRadius: 20, offset: const Offset(0, 10))],
                        border: Border.all(color: Colors.green.withValues(alpha: 0.3)),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.check_circle, color: Colors.green, size: 32),
                          SizedBox(width: 16),
                          Expanded(child: Text('Tu inventario está al día. No hay búsquedas insatisfechas en tu ramo.', style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.w500, height: 1.3))),
                        ],
                      ),
                    )
                  else
                    ..._busquedasFallidas.map((item) => Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 15, offset: const Offset(0, 5))],
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(color: Colors.amber.withValues(alpha: 0.15), shape: BoxShape.circle),
                            child: const Icon(Icons.trending_up, color: Colors.amber),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(item['termino'].toString().toUpperCase(), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                            decoration: BoxDecoration(color: Colors.redAccent.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
                            child: Text('${item['cantidad']} buscando', style: const TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w900, fontSize: 13)),
                          ),
                        ],
                      ),
                    )),

                  const SizedBox(height: 32),

                  // --- SECCIÓN 2: VENTAS EN ESPERA ---
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.redAccent.withValues(alpha: 0.15), shape: BoxShape.circle),
                        child: const Icon(Icons.local_fire_department, color: Colors.redAccent, size: 24),
                      ),
                      const SizedBox(width: 12),
                      const Text('Ventas en espera', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: AppColors.textDark, letterSpacing: -0.5)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const Text('Clientes listos para comprar en bloque. Publica tu oferta al mayor y asegura el ingreso hoy.', style: TextStyle(color: Colors.grey, fontSize: 13, height: 1.4)),
                  const SizedBox(height: 16),

                  if (_demandasPools.isEmpty)
                    const Text('No hay demandas agrupadas en tu zona.', style: TextStyle(color: Colors.grey))
                  else
                    ..._demandasPools.map((demanda) {
                      final isMeta = demanda['estado'] == 'Meta Alcanzada';
                      
                      // FIX CRÍTICO: Evitar crasheo por datos nulos o meta 0.
                      final clientes = (demanda['unidades_actuales'] as num?)?.toInt() ?? 0;
                      final meta = (demanda['meta_unidades'] as num?)?.toInt() ?? 1;
                      final faltan = meta > clientes ? meta - clientes : 0;
                      
                      // FIX CRÍTICO: Clampear el valor entre 0.0 y 1.0 para evitar "Value must be between 0.0 and 1.0"
                      final progreso = (clientes / meta).clamp(0.0, 1.0);

                      // TARJETA PARA DEMANDA EN PROGRESO (Gamificada)
                      if (!isMeta) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [BoxShadow(color: AppColors.primaryPurple.withValues(alpha: 0.08), blurRadius: 20, offset: const Offset(0, 8))],
                            border: Border.all(color: AppColors.primaryPurple.withValues(alpha: 0.3), width: 2),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text('${demanda['termino_original'].toString().toUpperCase()}: $clientes buscando', style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(color: AppColors.primaryPurple.withValues(alpha: 0.1), shape: BoxShape.circle),
                                    child: const Icon(Icons.radar, color: AppColors.primaryPurple, size: 20),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              // FIX: Barra de progreso con gradiente y clampeada
                              Stack(
                                children: [
                                  Container(
                                    height: 12,
                                    decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
                                  ),
                                  FractionallySizedBox(
                                    widthFactor: progreso, // Ahora es seguro
                                    child: Container(
                                      height: 12,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(colors: [Color(0xFF7C5DFE), Color(0xFFB39DDB)]),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [BoxShadow(color: AppColors.primaryPurple.withValues(alpha: 0.5), blurRadius: 5)],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  const Icon(Icons.bolt, color: Colors.orange, size: 16),
                                  const SizedBox(width: 4),
                                  Text(
                                    faltan > 0 
                                      ? '¡Solo faltan $faltan clientes para que el bulto sea rentable!'
                                      : '¡Casi listo para armar el bulto!',
                                    style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.w700, fontSize: 13),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }

                      // TARJETA DE OPORTUNIDAD (Meta Alcanzada) - EL DISEÑO ESTRELLA
                      return Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF11998e), Color(0xFF38ef7d)], // Verde Dinero
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: [BoxShadow(color: const Color(0xFF11998e).withValues(alpha: 0.5), blurRadius: 30, offset: const Offset(0, 12))],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Cinta de urgencia
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.15),
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.notifications_active, color: Colors.white, size: 18),
                                  SizedBox(width: 8),
                                  Text(
                                    'CIERRE DE VENTA INMINENTE',
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 12, letterSpacing: 1.5),
                                  ),
                                ],
                              ),
                            ),
                            
                            Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '¡OPORTUNIDAD: ${demanda['termino_original'].toString().toUpperCase()}!',
                                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 22, letterSpacing: -0.5),
                                  ),
                                  const SizedBox(height: 20),
                                  
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '$clientes',
                                        style: const TextStyle(fontSize: 72, fontWeight: FontWeight.w900, color: Colors.white, height: 0.85, letterSpacing: -2),
                                      ),
                                      const SizedBox(width: 16),
                                      const Expanded(
                                        child: Text(
                                          'clientes YA quieren comprarte este producto.',
                                          style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w800, height: 1.2),
                                        ),
                                      ),
                                    ],
                                  ),
                                  
                                  const SizedBox(height: 20),
                                  const Text(
                                    'No dejes escapar este dinero. Si no publicas la oferta, otro comercio lo hará y te quitará a estos clientes.',
                                    style: TextStyle(fontSize: 14, color: Colors.white, height: 1.5, fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 28),
                                  
                                  // CTA de alto impacto
                                  SizedBox(
                                    width: double.infinity,
                                    height: 60,
                                    child: ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: const Color(0xFF11998e),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                        elevation: 8,
                                        shadowColor: Colors.black.withValues(alpha: 0.3),
                                      ),
                                      onPressed: () => _mostrarFormularioPrecio(demanda),
                                      icon: const Icon(Icons.monetization_on, size: 28),
                                      label: const Text(
                                        'RECLAMAR VENTA AHORA',
                                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16, letterSpacing: 0.5),
                                      ),
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
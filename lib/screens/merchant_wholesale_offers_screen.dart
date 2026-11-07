import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';

class MerchantWholesaleOffersScreen extends StatefulWidget {
  const MerchantWholesaleOffersScreen({super.key});

  @override
  State<MerchantWholesaleOffersScreen> createState() => _MerchantWholesaleOffersScreenState();
}

class _MerchantWholesaleOffersScreenState extends State<MerchantWholesaleOffersScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _offers = [];

  @override
  void initState() {
    super.initState();
    _loadOffers();
  }

  Future<void> _loadOffers() async {
    setState(() => _isLoading = true);
    try {
      final userId = _supabase.auth.currentUser!.id;
      final comercioData = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      
      final response = await _supabase
          .from('pools_comunitarios')
          .select('*, pools_participantes(count)')
          .eq('creado_por_comercio', comercioData['id'])
          .order('estado', ascending: true) // Activos primero
          .order('producto_nombre', ascending: true);
          
      setState(() => _offers = response);
    } catch (e) {
      debugPrint('Error cargando ofertas al mayor: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgTop,
      appBar: AppBar(
        title: const Text('Mis Ofertas al Mayor'),
        actions: [IconButton(icon: const Icon(Icons.refresh), onPressed: _loadOffers)],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
          : _offers.isEmpty
              ? const Center(child: Text('No has creado ofertas al mayor aún.', style: TextStyle(color: Colors.grey)))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _offers.length,
                  itemBuilder: (context, index) {
                    final offer = _offers[index];
                    final reservas = offer['pools_participantes'] != null && offer['pools_participantes'].isNotEmpty 
                        ? offer['pools_participantes'][0]['count'] 
                        : 0;
                    final isActivo = offer['estado'] == 'Activo';

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
                                Text(offer['producto_nombre'].toString().toUpperCase(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(color: isActivo ? AppColors.success.withValues(alpha: 0.1) : Colors.grey.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
                                  child: Text(offer['estado'], style: TextStyle(color: isActivo ? AppColors.success : Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text('Precio Mayorista: \$${offer['precio_mayorista_sugerido']}', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold, fontSize: 16)),
                            const Divider(),
                            Row(
                              children: [
                                const Icon(Icons.people, color: AppColors.info, size: 20),
                                const SizedBox(width: 8),
                                Text('$reservas clientes han reservado su producto.', style: const TextStyle(fontWeight: FontWeight.w500)),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
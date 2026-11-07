import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';
import '../controllers/merchant_offers_controller.dart';
import 'create_offer_screen.dart';
import 'offer_flyer_screen.dart';

class MerchantOffersListScreen extends StatefulWidget {
  const MerchantOffersListScreen({super.key});

  @override
  State<MerchantOffersListScreen> createState() =>
      _MerchantOffersListScreenState();
}

class _MerchantOffersListScreenState extends State<MerchantOffersListScreen> {
  final _controller = MerchantOffersController();

  @override
  void dispose() {
    _controller.dispose(); // <-- FIX: faltaba liberar el controller (Parte 9)
    super.dispose();
  }

  /// Obtiene el nombre del comercio del usuario autenticado.
  /// Con fallback para no romper si falla Supabase.
  Future<String> _obtenerNombreComercio() async {
    try {
      final userId = Supabase.instance.client.auth.currentUser?.id;
      if (userId == null) return 'Mi Comercio';
      final data = await Supabase.instance.client
          .from('comercios')
          .select('nombre_comercial')
          .eq('usuario_id', userId)
          .maybeSingle();
      return (data?['nombre_comercial'] as String?) ?? 'Mi Comercio';
    } catch (e) {
      debugPrint('⚠️ Error obteniendo nombre de comercio: $e');
      return 'Mi Comercio';
    }
  }

  void _mostrarDetalle(dynamic oferta) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Detalle de la Oferta',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.grey),
                  onPressed: () => Navigator.pop(ctx),
                ),
              ],
            ),
            const SizedBox(height: 16),

            if (oferta['imagen_url'] != null &&
                oferta['imagen_url'].toString().isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  oferta['imagen_url'],
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 200,
                    color: Colors.grey[200],
                    child: const Icon(Icons.broken_image, color: Colors.grey),
                  ),
                ),
              ),
            const SizedBox(height: 20),

            Text(
              oferta['producto_nombre'] ?? 'Sin nombre',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              oferta['categoria'] ?? 'Sin categoría',
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.primaryPurple,
                fontWeight: FontWeight.w600,
              ),
            ),

            const Divider(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoColumn(
                  'Precio Regular',
                  '\$${oferta['precio_regular']}',
                ),
                _buildInfoColumn(
                  'Precio Oferta',
                  '\$${oferta['precio_oferta']}',
                  color: AppColors.success,
                ),
                _buildInfoColumn('Stock', '${oferta['stock']} uds'),
              ],
            ),

            const SizedBox(height: 24),
            const Text(
              'Descripción:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              oferta['descripcion'] ?? 'Sin descripción',
              style: const TextStyle(color: AppColors.textLight),
            ),
            const SizedBox(height: 20),

            // <-- NUEVO: Botón para generar flyer
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () async {
                  Navigator.pop(ctx); // Cerrar el modal primero
                  final nombre = await _obtenerNombreComercio();
                  if (!mounted) return;
                  final ofertaMap = Map<String, dynamic>.from(oferta as Map);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OfferFlyerScreen(
                        oferta: ofertaMap,
                        nombreComercio: nombre,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.share, color: Colors.white),
                label: const Text(
                  'Generar Flyer para Redes',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(
    String label,
    String value, {
    Color color = AppColors.textDark,
  }) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Mis Ofertas Activas')),
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: AppColors.primaryPurple,
            icon: const Icon(Icons.add, color: AppColors.white),
            label: const Text(
              'Crear Oferta',
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CreateOfferScreen()),
              );
              if (result == true) _controller.loadOffers();
            },
          ),
          body: _controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryPurple,
                  ),
                )
              : _controller.activeOffers.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_offer_outlined,
                              size: 80, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            'No tienes ofertas activas.',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.textLight,
                            ),
                          ),
                          Text(
                            '¡Crea una nueva para empezar a vender!',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _controller.activeOffers.length,
                      itemBuilder: (context, index) {
                        final oferta = _controller.activeOffers[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () => _mostrarDetalle(oferta),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: (oferta['imagen_url'] != null &&
                                            oferta['imagen_url']
                                                .toString()
                                                .isNotEmpty)
                                        ? Image.network(
                                            oferta['imagen_url'],
                                            width: 80,
                                            height: 80,
                                            fit: BoxFit.cover,
                                          )
                                        : Container(
                                            width: 80,
                                            height: 80,
                                            color: Colors.grey[200],
                                            child: const Icon(
                                              Icons.image,
                                              color: Colors.grey,
                                            ),
                                          ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          oferta['producto_nombre'] ??
                                              'Producto',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '\$${oferta['precio_oferta'] ?? oferta['precio_regular']}',
                                          style: const TextStyle(
                                            color: AppColors.primaryPurple,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          'Stock: ${oferta['stock']}',
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(Icons.chevron_right,
                                      color: Colors.grey),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
        );
      },
    );
  }
}
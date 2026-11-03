import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import '../controllers/admin_offers_controller.dart';

class AdminOffersScreen extends StatefulWidget {
  const AdminOffersScreen({super.key});

  @override
  State<AdminOffersScreen> createState() => _AdminOffersScreenState();
}

class _AdminOffersScreenState extends State<AdminOffersScreen> {
  final _offersController = AdminOffersController();

  void _confirmarEliminar(String offerId, String nombre) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Eliminar Oferta'),
        content: Text('¿Estás seguro que deseas eliminar la oferta "$nombre"? Esta acción no se puede deshacer.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            onPressed: () {
              Navigator.pop(ctx);
              _offersController.deleteOffer(offerId);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Oferta eliminada'), backgroundColor: AppColors.success));
            },
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _offersController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(
            title: const Text('Moderación de Ofertas'),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh, color: AppColors.textDark),
                onPressed: _offersController.loadOffers,
              )
            ],
          ),
          body: _offersController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : _offersController.offers.isEmpty
                  ? const Center(child: Text('No hay ofertas registradas.', style: TextStyle(color: Colors.grey)))
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _offersController.offers.length,
                      itemBuilder: (context, index) {
                        final offer = _offersController.offers[index];
                        final comercio = offer['comercios']?['nombre_comercial'] ?? 'Comercio Desconocido';
                        final isActive = offer['estado'] == 'Activa';
                        final fecha = DateTime.parse(offer['fecha_creacion']).toLocal();
                        final fechaStr = DateFormat('dd/MM/yyyy HH:mm').format(fecha);

                        return Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: (offer['imagen_url'] != null && offer['imagen_url'].toString().isNotEmpty)
                                          ? Image.network(offer['imagen_url'], width: 70, height: 70, fit: BoxFit.cover)
                                          : Container(width: 70, height: 70, color: Colors.grey[200], child: const Icon(Icons.image, color: Colors.grey)),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(child: Text(offer['producto_nombre'] ?? 'Producto', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16), maxLines: 1, overflow: TextOverflow.ellipsis)),
                                              Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                                decoration: BoxDecoration(
                                                  color: isActive ? AppColors.success.withOpacity(0.1) : AppColors.error.withOpacity(0.1),
                                                  borderRadius: BorderRadius.circular(4),
                                                ),
                                                child: Text(
                                                  isActive ? 'ACTIVA' : 'SUSPENDIDA',
                                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: isActive ? AppColors.success : AppColors.error),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          Text('Tienda: $comercio', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.w600, fontSize: 12)),
                                          Text(fechaStr, style: const TextStyle(color: Colors.grey, fontSize: 11)),
                                          Text('\$${offer['precio_oferta'] ?? offer['precio_regular']}', style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textDark, fontSize: 16)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(height: 24),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton.icon(
                                      onPressed: () => _offersController.toggleOfferStatus(offer['id'], offer['estado']),
                                      icon: Icon(isActive ? Icons.pause_circle_outline : Icons.play_circle_outline, color: isActive ? AppColors.warning : AppColors.success),
                                      label: Text(isActive ? 'Suspender' : 'Reactivar', style: TextStyle(color: isActive ? AppColors.warning : AppColors.success)),
                                    ),
                                    const SizedBox(width: 8),
                                    TextButton.icon(
                                      onPressed: () => _confirmarEliminar(offer['id'], offer['producto_nombre']),
                                      icon: const Icon(Icons.delete, color: AppColors.error),
                                      label: const Text('Eliminar', style: TextStyle(color: AppColors.error)),
                                    ),
                                  ],
                                )
                              ],
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
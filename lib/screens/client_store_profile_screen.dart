import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/client_store_controller.dart';
import 'client_checkout_screen.dart';
import 'report_modal_screen.dart'; // <-- NUEVA IMPORTACIÓN

class ClientStoreProfileScreen extends StatefulWidget {
  final String comercioId;
  const ClientStoreProfileScreen({super.key, required this.comercioId});

  @override
  State<ClientStoreProfileScreen> createState() => _ClientStoreProfileScreenState();
}

class _ClientStoreProfileScreenState extends State<ClientStoreProfileScreen> {
  final _storeController = ClientStoreController();

  @override
  void initState() {
    super.initState();
    _storeController.loadStoreProfile(widget.comercioId);
  }

  void _irAlCheckout(Map<String, dynamic> oferta) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ClientCheckoutScreen(oferta: oferta)),
    );
  }

  void _abrirModalReporte(String nombreComercio) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => ReportModalScreen(
        comercioId: widget.comercioId,
        nombreComercio: nombreComercio,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _storeController,
      builder: (context, child) {
        if (_storeController.isLoading) {
          return const Scaffold(body: Center(child: CircularProgressIndicator(color: AppColors.primaryPurple)));
        }
        if (_storeController.storeData == null) {
          return const Scaffold(body: Center(child: Text('Tienda no encontrada.')));
        }

        final store = _storeController.storeData!;
        final nombreComercio = store['nombre_comercial'] ?? 'Tienda';

        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(
            title: Text(nombreComercio),
            actions: [
              // BOTÓN DE REPORTAR TIENDA
              IconButton(
                icon: const Icon(Icons.flag, color: AppColors.error),
                tooltip: 'Reportar esta tienda',
                onPressed: () => _abrirModalReporte(nombreComercio),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // CABECERA DE LA TIENDA
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColors.bgTop,
                        backgroundImage: (store['logo_url'] != null && store['logo_url'].toString().isNotEmpty) ? NetworkImage(store['logo_url']) : null,
                        child: (store['logo_url'] == null || store['logo_url'].toString().isEmpty) ? const Icon(Icons.store, size: 40, color: AppColors.primaryPurple) : null,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(nombreComercio, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            Text(store['categoria'] ?? 'Categoría', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.w600)),
                            const SizedBox(height: 4),
                            Text(store['direccion_texto'] ?? 'Sin dirección', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _storeController.isFollowing ? AppColors.white : AppColors.primaryPurple,
                          foregroundColor: _storeController.isFollowing ? AppColors.primaryPurple : AppColors.white,
                          side: _storeController.isFollowing ? const BorderSide(color: AppColors.primaryPurple) : BorderSide.none,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        onPressed: _storeController.isActionLoading ? null : () => _storeController.toggleFollow(widget.comercioId),
                        child: _storeController.isActionLoading 
                            ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                            : Text(_storeController.isFollowing ? 'Siguiendo' : 'Seguir'),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 30),
                const Text('Catálogo de Ofertas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),

                // LISTA DE OFERTAS DE LA TIENDA
                if (_storeController.storeOffers.isEmpty)
                  const Center(child: Text('Esta tienda no tiene ofertas activas.', style: TextStyle(color: Colors.grey)))
                else
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: _storeController.storeOffers.length,
                    itemBuilder: (context, index) {
                      final oferta = _storeController.storeOffers[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 4))],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () => _irAlCheckout(oferta),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                                    child: (oferta['imagen_url'] != null && oferta['imagen_url'].toString().isNotEmpty)
                                        ? Image.network(oferta['imagen_url'], width: double.infinity, fit: BoxFit.cover)
                                        : Container(color: Colors.grey[200], child: const Icon(Icons.image, color: Colors.grey)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(oferta['producto_nombre'] ?? 'Producto', maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold)),
                                      const SizedBox(height: 4),
                                      Text('\$${oferta['precio_oferta'] ?? oferta['precio_regular']}', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold, fontSize: 16)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
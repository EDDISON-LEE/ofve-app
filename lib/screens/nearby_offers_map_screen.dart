import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../core/theme/app_theme.dart';
import '../controllers/nearby_offers_controller.dart';
import 'client_checkout_screen.dart';

class NearbyOffersMapScreen extends StatefulWidget {
  const NearbyOffersMapScreen({super.key});

  @override
  State<NearbyOffersMapScreen> createState() => _NearbyOffersMapScreenState();
}

class _NearbyOffersMapScreenState extends State<NearbyOffersMapScreen> {
  final _mapController = MapController();
  final _nearbyController = NearbyOffersController();
  dynamic _selectedOffer;

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _nearbyController,
      builder: (context, child) {
        if (_nearbyController.isLoading) {
          return const Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: AppColors.primaryPurple),
                  SizedBox(height: 16),
                  Text('Buscando ofertas cerca de ti...', style: TextStyle(color: AppColors.textLight)),
                ],
              ),
            ),
          );
        }

        if (_nearbyController.errorMessage != null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Ofertas Cercanas')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.location_off, size: 80, color: AppColors.error),
                  const SizedBox(height: 16),
                  Text(_nearbyController.errorMessage!, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.textDark)),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _nearbyController.loadNearbyOffers,
                    child: const Text('Reintentar'),
                  )
                ],
              ),
            ),
          );
        }

        final userLat = _nearbyController.currentPosition!.latitude;
        final userLng = _nearbyController.currentPosition!.longitude;

        return Scaffold(
          appBar: AppBar(title: const Text('Ofertas Cercanas')),
          body: Stack(
            children: [
              FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  initialCenter: LatLng(userLat, userLng),
                  initialZoom: 14.0,
                  onTap: (_, __) => setState(() => _selectedOffer = null),
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.ofve.app',
                  ),
                  MarkerLayer(
                    markers: _nearbyController.nearbyOffers.map((oferta) {
                      return Marker(
                        point: LatLng(oferta['latitud'], oferta['longitud']),
                        width: 50,
                        height: 50,
                        child: GestureDetector(
                          onTap: () {
                            setState(() => _selectedOffer = oferta);
                            _mapController.move(LatLng(oferta['latitud'], oferta['longitud']), 15.0);
                          },
                          child: const Icon(Icons.location_on, color: AppColors.primaryPurple, size: 45),
                        ),
                      );
                    }).toList(),
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(userLat, userLng),
                        width: 40,
                        height: 40,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.info.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.my_location, color: AppColors.info, size: 24),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 16,
                right: 16,
                child: FloatingActionButton.small(
                  backgroundColor: AppColors.white,
                  onPressed: _nearbyController.loadNearbyOffers,
                  child: const Icon(Icons.refresh, color: AppColors.primaryPurple),
                ),
              ),
              if (_selectedOffer != null)
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 20, offset: const Offset(0, 10))],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_selectedOffer['nombre_comercio'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.textDark)),
                        const SizedBox(height: 4),
                        Text(_selectedOffer['direccion'], style: const TextStyle(color: Colors.grey, fontSize: 13)),
                        const Divider(height: 24),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: (_selectedOffer['fachada_url'] != null && _selectedOffer['fachada_url'].toString().isNotEmpty)
                                  ? Image.network(_selectedOffer['fachada_url'], width: 60, height: 60, fit: BoxFit.cover)
                                  : Container(width: 60, height: 60, color: Colors.grey[200], child: const Icon(Icons.store, color: Colors.grey)),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_selectedOffer['nombre_oferta'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                  Text('A ${(_selectedOffer['distancia_metros'] as num).toStringAsFixed(0)} metros de ti', style: const TextStyle(color: AppColors.success, fontSize: 12, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Text('\$${_selectedOffer['precio']}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryPurple)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryPurple,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (_) => ClientCheckoutScreen(
                                  oferta: {
                                    'id': _selectedOffer['oferta_id'],
                                    'comercio_id': _selectedOffer['comercio_id'],
                                    'producto_nombre': _selectedOffer['nombre_oferta'],
                                    'precio_oferta': _selectedOffer['precio'],
                                    'precio_regular': _selectedOffer['precio'],
                                    'imagen_url': _selectedOffer['fachada_url'],
                                  },
                                ),
                              ));
                            },
                            child: const Text('Ver y Comprar', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
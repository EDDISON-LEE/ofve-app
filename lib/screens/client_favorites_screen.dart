import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/client_favorites_controller.dart';
import 'client_checkout_screen.dart';

class ClientFavoritesScreen extends StatefulWidget {
  const ClientFavoritesScreen({super.key});

  @override
  State<ClientFavoritesScreen> createState() => _ClientFavoritesScreenState();
}

class _ClientFavoritesScreenState extends State<ClientFavoritesScreen> {
  final _favoritesController = ClientFavoritesController();

  void _irAlCheckout(Map<String, dynamic> oferta) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ClientCheckoutScreen(oferta: oferta)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _favoritesController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Mis Favoritos')),
          body: _favoritesController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : _favoritesController.favorites.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.favorite_border, size: 80, color: Colors.grey),
                          SizedBox(height: 16),
                          Text('No tienes favoritos aún.', style: TextStyle(fontSize: 18, color: AppColors.textLight)),
                          Text('¡Explora las ofertas y guarda las que te gusten!', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _favoritesController.favorites.length,
                      itemBuilder: (context, index) {
                        final oferta = _favoritesController.favorites[index];
                        
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(12),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: (oferta['imagen_url'] != null && oferta['imagen_url'].toString().isNotEmpty)
                                  ? Image.network(oferta['imagen_url'], width: 70, height: 70, fit: BoxFit.cover)
                                  : Container(width: 70, height: 70, color: Colors.grey[200], child: const Icon(Icons.image, color: Colors.grey)),
                            ),
                            title: Text(
                              oferta['producto_nombre'] ?? 'Producto',
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                Text(
                                  '\$${oferta['precio_oferta'] ?? oferta['precio_regular']}',
                                  style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ],
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.favorite, color: AppColors.error),
                                  onPressed: () => _favoritesController.toggleFavorite(oferta['id']),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.shopping_cart, color: AppColors.primaryPurple),
                                  onPressed: () => _irAlCheckout(oferta),
                                ),
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
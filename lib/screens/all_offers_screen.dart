import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';
import '../controllers/client_favorites_controller.dart';
import '../controllers/currency_controller.dart'; // <-- NUEVA IMPORTACIÓN
import 'client_checkout_screen.dart';

class AllOffersController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;
  bool isLoading = true;
  List<dynamic> offers = [];
  List<dynamic> filteredOffers = [];
  String? selectedCategory;

  final List<String> categories = [
    'Todas', 'Alimentos y Bebidas', 'Tecnología', 'Ropa y Calzado', 
    'Salud y Belleza', 'Hogar y Ferretería', 'Supermercado', 
    'Farmacia', 'Servicios', 'Otros'
  ];

  AllOffersController() { loadAllOffers(); }

  Future<void> loadAllOffers() async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await _supabase
          .from('ofertas')
          .select('*')
          .eq('estado', 'Activa')
          .order('es_patrocinada', ascending: false) 
          .order('fecha_inicio', ascending: false);
      offers = response;
      _applyFilter();
    } catch (e) {
      debugPrint('Error cargando ofertas: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void filterByCategory(String? category) {
    selectedCategory = category;
    _applyFilter();
    notifyListeners();
  }

  void _applyFilter() {
    if (selectedCategory == null || selectedCategory == 'Todas') {
      filteredOffers = offers;
    } else {
      filteredOffers = offers.where((o) => o['categoria'] == selectedCategory).toList();
    }
  }
}

class AllOffersScreen extends StatefulWidget {
  const AllOffersScreen({super.key});

  @override
  State<AllOffersScreen> createState() => _AllOffersScreenState();
}

class _AllOffersScreenState extends State<AllOffersScreen> {
  final _offersController = AllOffersController();
  final _favoritesController = ClientFavoritesController();
  final _currencyController = CurrencyController(); // <-- INSTANCIA

  @override
  void dispose() {
    _favoritesController.dispose();
    _currencyController.dispose(); // <-- DISPOSE
    super.dispose();
  }

  void _irAlCheckout(Map<String, dynamic> oferta) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => ClientCheckoutScreen(oferta: oferta)));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_offersController, _favoritesController, _currencyController]),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Todas las Ofertas')),
          body: Column(
            children: [
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: _offersController.categories.length,
                  itemBuilder: (context, index) {
                    final category = _offersController.categories[index];
                    final isSelected = (_offersController.selectedCategory == null && category == 'Todas') || _offersController.selectedCategory == category;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0, top: 8, bottom: 8),
                      child: FilterChip(
                        label: Text(category),
                        selected: isSelected,
                        onSelected: (val) => _offersController.filterByCategory(category == 'Todas' ? null : category),
                        selectedColor: AppColors.primaryPurple,
                        labelStyle: TextStyle(color: isSelected ? Colors.white : AppColors.textDark, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
                        checkmarkColor: Colors.white,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide.none),
                      ),
                    );
                  },
                ),
              ),

              Expanded(
                child: _offersController.isLoading
                    ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
                    : _offersController.filteredOffers.isEmpty
                        ? const Center(child: Text('No hay ofertas en esta categoría.', style: TextStyle(color: Colors.grey)))
                        : GridView.builder(
                            padding: const EdgeInsets.all(16),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.7, // Ajustado para dar espacio al texto en Bs
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemCount: _offersController.filteredOffers.length,
                            itemBuilder: (context, index) {
                              final oferta = _offersController.filteredOffers[index];
                              return _buildOfferCard(oferta);
                            },
                          ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOfferCard(Map<String, dynamic> oferta) {
    final isFav = _favoritesController.isFavorite(oferta['id'].toString());
    final isSponsored = oferta['es_patrocinada'] ?? false; 
    final precioUsd = (oferta['precio_oferta'] ?? oferta['precio_regular'] as num).toDouble();

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: isSponsored ? Border.all(color: Colors.amber, width: 2) : null, 
        boxShadow: [BoxShadow(color: isSponsored ? Colors.amber.withOpacity(0.2) : Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => _irAlCheckout(oferta), 
          child: Stack(
            children: [
              Column(
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
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(color: AppColors.primaryPurple.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                          child: Text(oferta['categoria'] ?? 'General', style: const TextStyle(color: AppColors.primaryPurple, fontSize: 10, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          oferta['producto_nombre'] ?? 'Producto',
                          maxLines: 2, overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, height: 1.2),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            if (oferta['precio_oferta'] != null) ...[
                              Text('\$${oferta['precio_oferta']}', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold, fontSize: 18)),
                              const SizedBox(width: 6),
                              Text('\$${oferta['precio_regular']}', style: const TextStyle(color: Colors.grey, fontSize: 12, decoration: TextDecoration.lineThrough)),
                            ] else ...[
                              Text('\$${oferta['precio_regular']}', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold, fontSize: 18)),
                            ],
                          ],
                        ),
                        // --- PRECIO EN BS ---
                        Text(
                          _currencyController.formatBs(precioUsd),
                          style: const TextStyle(color: AppColors.success, fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              if (isSponsored)
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(16), bottomRight: Radius.circular(12)),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.star, color: Colors.white, size: 14),
                        SizedBox(width: 4),
                        Text('DESTACADO', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () => _favoritesController.toggleFavorite(oferta['id'].toString()),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.9),
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4)],
                    ),
                    child: Icon(isFav ? Icons.favorite : Icons.favorite_border, color: isFav ? AppColors.error : Colors.grey, size: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
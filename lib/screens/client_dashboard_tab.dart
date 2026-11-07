import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../controllers/client_controller.dart';
import '../controllers/client_announcements_controller.dart';
import '../controllers/client_favorites_controller.dart';
import '../core/theme/app_theme.dart';
import '../widgets/notification_bell.dart'; 
import '../widgets/currency_ticker.dart'; 
import 'client_validation_screen.dart';
import 'client_checkout_screen.dart'; 
import 'client_plan_purchase_screen.dart'; 
import 'nearby_offers_map_screen.dart'; 
import 'all_offers_screen.dart'; 
import 'client_guided_purchase_screen.dart'; 
import 'client_ai_assistant_screen.dart'; 
import 'client_announcements_screen.dart';
import 'client_points_screen.dart';

class ClientDashboardTab extends StatefulWidget {
  final String userName;
  final int puntos;

  const ClientDashboardTab({
    super.key,
    required this.userName,
    required this.puntos,
  });

  @override
  State<ClientDashboardTab> createState() => _ClientDashboardTabState();
}

class _ClientDashboardTabState extends State<ClientDashboardTab> {
  final _clientController = ClientController();
  final _announcementsController = ClientAnnouncementsController();
  final _favoritesController = ClientFavoritesController(); 
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    _announcementsController.dispose();
    _favoritesController.dispose();
    super.dispose();
  }

  void _irAlCheckout(Map<String, dynamic> oferta) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ClientCheckoutScreen(oferta: oferta)),
    );
  }

  Future<void> _ejecutarBusquedaSemantica(String query) async {
    if (query.trim().isEmpty) return;

    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
    );

    try {
      // 1. REGISTRAR DEMANDA PARA POOLS
      final userId = Supabase.instance.client.auth.currentUser?.id;
      if (userId != null) {
        await Supabase.instance.client.rpc('procesar_busqueda_demanda', params: {
          'p_usuario_id': userId,
          'p_termino': query,
          'p_lat': 10.4806, 
          'p_lng': -66.9036,
        });
      }

      // 2. BUSCAR OFERTAS CON IA
      final response = await Supabase.instance.client.functions.invoke(
        'search-semantic',
        body: {'query': query},
      );

      if (mounted) Navigator.pop(context);

      if (response.status == 200) {
        final results = response.data['ofertas'];
        if (results.isEmpty) {
          if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No encontramos ofertas individuales, pero sumamos tu búsqueda al Pool Comunitario.'), backgroundColor: AppColors.warning));
        } else {
          if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('¡Encontramos ${results.length} ofertas con IA!'), backgroundColor: AppColors.success));
        }
      } else {
        throw Exception('Error en el servidor');
      }
    } catch (e) {
      if (mounted) Navigator.pop(context);
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error al buscar: $e'), backgroundColor: AppColors.error));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_clientController, _announcementsController, _favoritesController]),
      builder: (context, child) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.bgTop, AppColors.bgBottom],
                  stops: const [0.0, 0.4],
                ),
              ),
            ),
            Positioned(
              top: -150,
              left: -100,
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.curveColor.withValues(alpha: 0.8),
                ),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context),
                    const SizedBox(height: 20),
                    _buildUserInfo(),
                    const SizedBox(height: 20),
                    _buildSearchBar(),
                    const SizedBox(height: 24),
                    _buildClientGrid(),
                    const SizedBox(height: 30),
                    _buildOfferSection(),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, size: 28, color: AppColors.textDark),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        Row(
          children: [
            const NotificationBell(),
            Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.campaign, size: 28, color: AppColors.primaryPurple),
                  tooltip: 'Anuncios de OfVe',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const ClientAnnouncementsScreen()));
                    _announcementsController.markAsRead();
                  },
                ),
                if (_announcementsController.unreadCount > 0)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(color: AppColors.error, shape: BoxShape.circle),
                      constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                      child: Text(
                        '${_announcementsController.unreadCount}',
                        style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.notifications_active, size: 28, color: AppColors.primaryPurple),
              tooltip: 'Validar Compras Pendientes',
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ClientValidationScreen())),
            ),
            const Icon(Icons.settings, size: 28, color: AppColors.textDark),
          ],
        )
      ],
    );
  }

  Widget _buildUserInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.white,
              child: Icon(Icons.person, color: Colors.grey, size: 28),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 18),
                    Icon(Icons.star, color: Colors.orange, size: 18),
                    Icon(Icons.star, color: Colors.orange, size: 18),
                    Icon(Icons.star, color: Colors.orange, size: 18),
                    Icon(Icons.star_half, color: Colors.orange, size: 18),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  '${widget.puntos} Puntos',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.textDark),
                ),
              ],
            ),
          ],
        ),
        const CurrencyTicker(),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: TextField(
        controller: _searchController,
        onSubmitted: _ejecutarBusquedaSemantica,
        decoration: InputDecoration(
          hintText: '¿Qué buscas hoy, ${widget.userName}',
          hintStyle: TextStyle(color: Colors.grey[500], fontSize: 13),
          prefixIcon: const Icon(Icons.mic, color: AppColors.primaryPurple, size: 22),
          suffixIcon: const Icon(Icons.search, color: AppColors.primaryPurple, size: 24),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

  Widget _buildClientGrid() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 0.8,
      children: [
        _buildCard(imagePath: 'assets/icons/robot.webp', title: 'Asistente IA', subtitle: 'Todo a mano', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ClientAiAssistantScreen()))),
        _buildCard(imagePath: 'assets/icons/bolsa.webp', title: 'Compra Guiada', subtitle: 'Optimiza presupuesto', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ClientGuidedPurchaseScreen()))),
        _buildCard(imagePath: 'assets/icons/planifica.webp', title: 'Planifica Compra', subtitle: 'Ahorra tiempo', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ClientPlanPurchaseScreen()))),
        _buildCard(imagePath: 'assets/icons/brujula.webp', title: 'Ofertas Cercanas', subtitle: 'Ver mapa', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NearbyOffersMapScreen()))),
        _buildCard(
          imagePath: 'assets/icons/corona.webp', 
          title: 'Mis Puntos', 
          subtitle: '${widget.puntos} pts', 
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ClientPointsScreen()))
        ),
        _buildCard(imagePath: 'assets/icons/regalo.webp', title: 'Todas las Ofertas', subtitle: 'Ilimitado', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AllOffersScreen()))),
      ],
    );
  }

  Widget _buildCard({required String imagePath, required String title, required String subtitle, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.darkCardColor.withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.white.withValues(alpha: 0.15), width: 1),
              boxShadow: [BoxShadow(color: AppColors.darkCardColor.withValues(alpha: 0.2), blurRadius: 8, offset: const Offset(0, 4))],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(imagePath, width: 40, height: 40, fit: BoxFit.contain, errorBuilder: (context, error, stackTrace) => const Icon(Icons.shopping_bag, color: AppColors.white, size: 32)),
                const SizedBox(height: 8),
                Text(title, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.white, fontSize: 11, fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(subtitle, textAlign: TextAlign.center, style: TextStyle(color: AppColors.white.withValues(alpha: 0.6), fontSize: 9)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOfferSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Oferta del Día', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark)),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AllOffersScreen())),
              child: Text('Ver todas', style: TextStyle(color: AppColors.textMagenta, fontWeight: FontWeight.bold, fontSize: 14)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        
        if (_clientController.isLoadingOffers)
          const Center(child: Padding(padding: EdgeInsets.all(20.0), child: CircularProgressIndicator(color: AppColors.primaryPurple)))
        else if (_clientController.offers.isEmpty)
          const Text('No hay ofertas disponibles hoy.', style: TextStyle(color: AppColors.textLight))
        else
          SizedBox(
            height: 190,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _clientController.offers.length,
              itemBuilder: (context, index) {
                final oferta = _clientController.offers[index];
                final isFav = _favoritesController.isFavorite(oferta['id'].toString());
                
                return Container(
                  width: 150, 
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8, offset: const Offset(0, 4))],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () => _irAlCheckout(oferta),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                child: (oferta['imagen_url'] != null && oferta['imagen_url'].toString().isNotEmpty)
                                    ? Image.network(oferta['imagen_url'], height: 90, width: double.infinity, fit: BoxFit.cover)
                                    : Container(height: 90, width: double.infinity, color: Colors.grey[200], child: const Icon(Icons.image, color: Colors.grey)),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        oferta['producto_nombre'] ?? 'Producto',
                                        maxLines: 1, overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                      ),
                                      Row(
                                        children: [
                                          if (oferta['precio_oferta'] != null) ...[
                                            Text('\$${oferta['precio_oferta']}', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold, fontSize: 14)),
                                            const SizedBox(width: 4),
                                            Text('\$${oferta['precio_regular']}', style: const TextStyle(color: Colors.grey, fontSize: 10, decoration: TextDecoration.lineThrough)),
                                          ] else ...[
                                            Text('\$${oferta['precio_regular']}', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold, fontSize: 14)),
                                          ],
                                        ],
                                      ),
                                      Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.symmetric(vertical: 4),
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryPurple.withValues(alpha: 0.1),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: const Text('Comprar', textAlign: TextAlign.center, style: TextStyle(color: AppColors.primaryPurple, fontSize: 10, fontWeight: FontWeight.bold)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                          Positioned(
                            top: 8,
                            right: 8,
                            child: GestureDetector(
                              onTap: () => _favoritesController.toggleFavorite(oferta['id'].toString()),
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: AppColors.white.withValues(alpha: 0.9),
                                  shape: BoxShape.circle,
                                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 4)],
                                ),
                                child: Icon(
                                  isFav ? Icons.favorite : Icons.favorite_border,
                                  color: isFav ? AppColors.error : Colors.grey,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
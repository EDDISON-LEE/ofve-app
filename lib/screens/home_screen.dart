import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../controllers/user_controller.dart';
import '../controllers/location_alert_controller.dart'; // <-- NUEVO: Controlador de Geocercas
import '../core/theme/app_theme.dart';
import 'admin_dashboard_screen.dart';
import 'owner_dashboard_screen.dart';
import 'client_dashboard_tab.dart';
import 'merchant_dashboard_tab.dart';
import 'account_settings_screen.dart';
import 'client_orders_screen.dart';
import 'client_favorites_screen.dart';
import 'client_followed_stores_screen.dart';
import 'delivery_dashboard_screen.dart'; 
import 'client_payment_history_screen.dart'; 
import 'client_planned_purchases_screen.dart'; 
import 'merchant_branches_screen.dart';
import 'client_pools_screen.dart'; 
import 'banned_screen.dart'; 

import 'support_screen.dart';
import 'merchant_edit_store_screen.dart';
import 'merchant_metrics_screen.dart';
import 'merchant_earnings_screen.dart';
import 'add_product_screen.dart';
import 'merchant_animal_requests_screen.dart';
import 'client_preferences_screen.dart'; 

// --- NUEVO: Añadimos WidgetsBindingObserver para escuchar el ciclo de vida ---
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  final _userController = UserController();
  final _locationController = LocationAlertController(); // <-- INSTANCIA DE GEOCERCAS

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // <-- Registrar observer de ciclo de vida
    
    // Hacemos el primer chequeo de ubicación después de que la UI cargue
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkLocationAlerts();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // <-- Importante: Limpiar observer
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Si el usuario regresa a la app, chequeamos de nuevo su ubicación
    if (state == AppLifecycleState.resumed) {
      _checkLocationAlerts();
    }
  }

  void _checkLocationAlerts() {
    // Solo chequeamos si es cliente, no está baneado y el controlador tiene contexto
    if ((_userController.role == 'user' || _userController.role == 'client') && 
        !_userController.estadoBaneado) {
      _locationController.checkProximityAlerts(context);
    }
  }
  // -----------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _userController,
      builder: (context, child) {
        if (_userController.isLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: AppColors.primaryPurple),
            ),
          );
        }

        // --- VALIDACIÓN DE BANEO ---
        if (_userController.estadoBaneado) {
          return const BannedScreen();
        }

        // REDIRECCIÓN POR ROL
        if (_userController.role == 'admin') return const AdminDashboardScreen();
        if (_userController.role == 'owner') return const OwnerDashboardScreen();
        if (_userController.role == 'delivery') return const DeliveryDashboardScreen(); 

        // CLIENTES Y COMERCIOS
        return Scaffold(
          drawer: _buildDrawer(),
          body: _userController.role == 'merchant'
              ? MerchantDashboardTab(
                  storeName: _userController.storeName,
                  planName: _userController.planName,
                  category: _userController.category,
                )
              : ClientDashboardTab(
                  userName: _userController.userName,
                  puntos: _userController.puntos,
                ),
          floatingActionButton: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryPurple.withOpacity(0.4),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: AppColors.primaryPurple,
              elevation: 0,
              child: const Icon(Icons.directions_car,
                  color: AppColors.white, size: 28),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 8.0,
            color: AppColors.white,
            elevation: 10,
            child: SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const IconButton(
                      icon: Icon(Icons.home,
                          color: AppColors.primaryPurple, size: 28),
                      onPressed: null),
                  const IconButton(
                      icon: Icon(Icons.search, color: Colors.grey, size: 28),
                      onPressed: null),
                  const SizedBox(width: 40),
                  const IconButton(
                      icon: Icon(Icons.local_offer,
                          color: Colors.grey, size: 28),
                      onPressed: null),
                  const IconButton(
                      icon: Icon(Icons.person, color: Colors.grey, size: 28),
                      onPressed: null),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: AppColors.white,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
                top: 50, bottom: 20, left: 20, right: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                AppColors.primaryPurple,
                AppColors.primaryPurple.withOpacity(0.8)
              ]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.white,
                  child: Icon(Icons.person, size: 35, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                Text(
                  _userController.role == 'merchant'
                      ? _userController.storeName
                      : _userController.userName,
                  style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  _userController.userEmail,
                  style: TextStyle(
                      color: AppColors.white.withOpacity(0.8), fontSize: 13),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                if (_userController.role == 'merchant') ...[
                  _buildDrawerItem(
                    Icons.storefront,
                    'Mi Tienda',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const MerchantEditStoreScreen()),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    Icons.bar_chart,
                    'Mis Métricas',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const MerchantMetricsScreen()),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    Icons.account_balance_wallet,
                    'Mis Ganancias',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const MerchantEarningsScreen()),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    Icons.inventory_2,
                    'Inventario',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const AddProductScreen()),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    Icons.pets,
                    'Solicitudes Animales',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                const MerchantAnimalRequestsScreen()),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    Icons.business,
                    'Mis Sucursales',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const MerchantBranchesScreen()),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    Icons.receipt_long,
                    'Mis Pagos',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ClientPaymentHistoryScreen()),
                      );
                    },
                  ),
                  const Divider(),
                ],
                if (_userController.role == 'user' || _userController.role == 'client') ...[
                  _buildDrawerItem(
                    Icons.shopping_bag_outlined,
                    'Mis compras',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ClientOrdersScreen()),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    Icons.tune, 
                    'Mis Preferencias',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ClientPreferencesScreen()),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    Icons.groups,
                    'Pools Comunitarios',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ClientPoolsScreen()),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    Icons.favorite_border,
                    'Favoritos',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ClientFavoritesScreen()),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    Icons.storefront_outlined,
                    'Tiendas que sigo',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                const ClientFollowedStoresScreen()),
                      );
                    },
                  ),
                   _buildDrawerItem(
                    Icons.help_outline,
                    'Soporte Técnico',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SupportScreen()),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    Icons.history,
                    'Historial',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ClientOrdersScreen()),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    Icons.calendar_today,
                    'Compras Planificadas',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ClientPlannedPurchasesScreen()),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    Icons.receipt_long,
                    'Mis Pagos',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ClientPaymentHistoryScreen()),
                      );
                    },
                  ),
                  const Divider(),
                ],
                _buildDrawerItem(
                  Icons.person_outline,
                  'Administrar mi Usuario',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const AccountSettingsScreen()),
                    );
                  },
                ),
                _buildDrawerItem(Icons.notifications_none, 'Notificaciones'),
                const Divider(),
                _buildDrawerItem(
                  Icons.logout,
                  'Cerrar sesión',
                  color: AppColors.warning,
                  onTap: () async {
                    Navigator.pop(context);
                    await Supabase.instance.client.auth.signOut();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title,
      {Color color = AppColors.textDark, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: color, size: 24),
      title: Text(title,
          style: TextStyle(
              color: color, fontSize: 15, fontWeight: FontWeight.w500)),
      trailing: Icon(Icons.chevron_right, color: Colors.grey[400], size: 20),
      onTap: onTap ?? () => Navigator.pop(context),
    );
  }
}
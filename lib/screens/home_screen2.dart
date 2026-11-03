import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'admin_dashboard_screen.dart';
import 'owner_dashboard_screen.dart';
import 'client_dashboard_tab.dart';
import 'merchant_dashboard_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  String _role = 'user';
  String _userName = 'Usuario';
  String _userEmail = '';
  String _storeName = 'Mi Comercio';
  String _planName = 'Básico';
  String _category = 'Sin categoría';

  int _puntos = 5000;

  final Color bgTop = const Color(0xFFECE2FC); 
  final Color bgBottom = const Color(0xFFFDFBFF);
  final Color curveColor = const Color(0xFFE2D2FC); 
  final Color darkCardColor = const Color(0xFF252152);
  final Color primaryPurple = const Color(0xFF7C5DFE);
  final Color textMagenta = const Color(0xFFD018A4);
  final Color orangeColor = const Color(0xFFFF9800);

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = _supabase.auth.currentUser;
    if (user != null) {
      String detectedRole = 'user';

      try {
        await _supabase.auth.refreshSession();
        final dbUser = await _supabase.from('usuarios').select('rol').eq('id', user.id).single();
        detectedRole = dbUser['rol'] ?? 'user';
      } catch (e) {
        debugPrint('Error consultando tabla usuarios: $e');
        detectedRole = user.appMetadata['rol'] ?? user.userMetadata?['rol'] ?? 'user';
      }

      // NOTA SENIOR: Hemos eliminado la verificación automática que convertía
      // a un 'user' en 'merchant' si encontraba un registro en la tabla comercios.
      // Ahora la app obedece estrictamente el rol de la base de datos.

      setState(() {
        _role = detectedRole;
        _userName = user.userMetadata?['nombre']?.toString().toUpperCase() ?? 'USUARIO';
        _userEmail = user.email ?? '';
      });

      if (_role == 'merchant') {
        try {
          var comercio = await _supabase
              .from('comercios')
              .select('nombre_comercial, categoria, planes_suscripcion(nombre)')
              .eq('usuario_id', user.id)
              .maybeSingle();

          if (comercio != null) {
            _storeName = comercio['nombre_comercial'] ?? 'Mi Comercio';
            _planName = comercio['planes_suscripcion']?['nombre'] ?? 'Básico';
            _category = comercio['categoria'] ?? 'Sin categoría';
          }
        } catch (e) {
          debugPrint('Error al cargar comercio: $e');
        }
      }
      
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(body: Center(child: CircularProgressIndicator(color: primaryPurple)));
    }

    // REDIRECCIÓN SEGÚN EL ROL
    if (_role == 'admin') return const AdminDashboardScreen();
    if (_role == 'owner') return const OwnerDashboardScreen();

    return Scaffold(
      drawer: _buildDrawer(),
      body: _buildBody(),
      
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: primaryPurple.withOpacity(0.4), blurRadius: 15, offset: const Offset(0, 5))],
        ),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: primaryPurple,
          elevation: 0,
          child: const Icon(Icons.directions_car, color: Colors.white, size: 28),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Colors.white,
        elevation: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(icon: Icon(Icons.home, color: primaryPurple, size: 28), onPressed: () {}),
              IconButton(icon: const Icon(Icons.search, color: Colors.grey, size: 28), onPressed: () {}),
              const SizedBox(width: 40),
              IconButton(icon: const Icon(Icons.local_offer, color: Colors.grey, size: 28), onPressed: () {}),
              IconButton(icon: const Icon(Icons.person, color: Colors.grey, size: 28), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (_role == 'merchant') {
      return MerchantDashboardTab(
        storeName: _storeName,
        planName: _planName,
        category: _category,
        bgTop: bgTop,
        bgBottom: bgBottom,
        curveColor: curveColor,
        darkCardColor: darkCardColor,
        primaryPurple: primaryPurple,
      );
    }
    return ClientDashboardTab(
      userName: _userName,
      puntos: _puntos,
      bgTop: bgTop,
      bgBottom: bgBottom,
      curveColor: curveColor,
      darkCardColor: darkCardColor,
      primaryPurple: primaryPurple,
      textMagenta: textMagenta,
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [primaryPurple, primaryPurple.withOpacity(0.8)]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(radius: 30, backgroundColor: Colors.white, child: Icon(Icons.person, size: 35, color: Colors.grey)),
                const SizedBox(height: 10),
                Text(_role == 'merchant' ? _storeName : _userName, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                Text(_userEmail, style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 13)),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                if (_role == 'merchant') ...[
                  _buildDrawerItem(Icons.storefront, 'Mi Tienda'),
                  _buildDrawerItem(Icons.bar_chart, 'Mis Métricas'),
                  _buildDrawerItem(Icons.account_balance_wallet, 'Mis Ganancias'),
                  _buildDrawerItem(Icons.inventory_2, 'Inventario'),
                  const Divider(),
                ],
                if (_role == 'user') ...[
                  _buildDrawerItem(Icons.shopping_bag_outlined, 'Mis compras'),
                  _buildDrawerItem(Icons.favorite_border, 'Favoritos'),
                  _buildDrawerItem(Icons.storefront_outlined, 'Tiendas que sigo'),
                  _buildDrawerItem(Icons.history, 'Historial'),
                  const Divider(),
                ],
                _buildDrawerItem(Icons.person_outline, 'Administrar mi Usuario'),
                _buildDrawerItem(Icons.notifications_none, 'Notificaciones'),
                const Divider(),
                _buildDrawerItem(Icons.logout, 'Cerrar sesión', color: orangeColor, onTap: () async {
                  Navigator.pop(context);
                  await _supabase.auth.signOut();
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, {Color color = Colors.black87, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: color, size: 24),
      title: Text(title, style: TextStyle(color: color, fontSize: 15, fontWeight: FontWeight.w500)),
      trailing: Icon(Icons.chevron_right, color: Colors.grey[400], size: 20),
      onTap: onTap ?? () => Navigator.pop(context),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'admin_validation_screen.dart';
import 'owner_user_management_screen.dart';
import 'owner_settings_screen.dart';
import 'owner_plans_management_screen.dart'; // <-- IMPORTACIÓN AGREGADA

class OwnerDashboardScreen extends StatefulWidget {
  const OwnerDashboardScreen({super.key});

  @override
  State<OwnerDashboardScreen> createState() => _OwnerDashboardScreenState();
}

class _OwnerDashboardScreenState extends State<OwnerDashboardScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;

  int _totalUsuarios = 0;
  int _totalComercios = 0;
  int _totalOfertas = 0;

  final Color primaryPurple = const Color(0xFF7C5DFE);
  final Color bgTop = const Color(0xFFECE2FC);
  final Color darkCardColor = const Color(0xFF252152);

  @override
  void initState() {
    super.initState();
    _loadGlobalStats();
  }

  Future<void> _loadGlobalStats() async {
    setState(() => _isLoading = true);
    try {
      final users = await _supabase.from('usuarios').select('id').count();
      final merchants = await _supabase.from('comercios').select('id').count();
      final offers = await _supabase.from('ofertas').select('id').count();

      setState(() {
        _totalUsuarios = users.count;
        _totalComercios = merchants.count;
        _totalOfertas = offers.count;
      });
    } catch (e) {
      debugPrint('Error cargando métricas: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Super Admin Panel', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.red),
            tooltip: 'Cerrar Sesión',
            onPressed: () => _supabase.auth.signOut(),
          )
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: primaryPurple))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Resumen Global', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildStatCard('Usuarios', _totalUsuarios.toString(), Icons.people, Colors.blue),
                      const SizedBox(width: 12),
                      _buildStatCard('Comercios', _totalComercios.toString(), Icons.store, Colors.green),
                      const SizedBox(width: 12),
                      _buildStatCard('Ofertas', _totalOfertas.toString(), Icons.local_offer, Colors.orange),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text('Módulos del Sistema', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.85,
                    children: [
                      _buildModuleCard(
                        icon: Icons.manage_accounts,
                        title: 'Roles',
                        subtitle: 'Gestionar Usuarios',
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OwnerUserManagementScreen())).then((_) => _loadGlobalStats()),
                      ),
                      _buildModuleCard(
                        icon: Icons.verified_user,
                        title: 'Validar',
                        subtitle: 'Comercios',
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminValidationScreen())).then((_) => _loadGlobalStats()),
                      ),
                      _buildModuleCard(
                        icon: Icons.settings,
                        title: 'Config',
                        subtitle: 'App & Features',
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OwnerSettingsScreen())),
                      ),
                      // --- TARJETA DE PLANES AGREGADA AQUÍ ---
                      _buildModuleCard(
                        icon: Icons.workspace_premium,
                        title: 'Planes',
                        subtitle: 'Suscripciones',
                        onTap: () {
                          // CORRECCIÓN: Se quitó el 'const' de OwnerPlansManagementScreen
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const OwnerPlansManagementScreen()));
                        },
                      ),
                      _buildModuleCard(
                        icon: Icons.attach_money,
                        title: 'Ingresos',
                        subtitle: 'Finanzas',
                        onTap: () {}, 
                      ),
                      _buildModuleCard(
                        icon: Icons.bar_chart,
                        title: 'Métricas',
                        subtitle: 'Analytics',
                        onTap: () {}, 
                      ),
                      _buildModuleCard(
                        icon: Icons.campaign,
                        title: 'Push',
                        subtitle: 'Notificaciones',
                        onTap: () {}, 
                      ),
                      _buildModuleCard(
                        icon: Icons.gavel,
                        title: 'Moderación',
                        subtitle: 'Reportes',
                        onTap: () {}, 
                      ),
                      _buildModuleCard(
                        icon: Icons.support_agent,
                        title: 'Soporte',
                        subtitle: 'Tickets',
                        onTap: () {}, 
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildModuleCard({required IconData icon, required String title, required String subtitle, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: darkCardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: darkCardColor.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 32),
            const SizedBox(height: 12),
            Text(title, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle, textAlign: TextAlign.center, style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 9)),
          ],
        ),
      ),
    );
  }
}
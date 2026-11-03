import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';
import '../widgets/notification_bell.dart'; // <-- NUEVA IMPORTACIÓN
import '../controllers/admin_controller.dart';
import 'admin_validation_screen.dart';
import 'admin_moderation_screen.dart';
import 'admin_support_screen.dart';
import 'admin_market_intelligence.dart';
import 'admin_users_screen.dart'; 
import 'admin_broadcast_screen.dart'; 
import 'admin_categories_screen.dart'; 
import 'admin_zones_screen.dart';
import 'admin_offers_screen.dart'; 
import 'admin_animal_requests_screen.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  final _adminController = AdminController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _adminController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(
            title: const Text('Panel de Administración', style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold)),
            actions: [
              // CAMPANITA DE NOTIFICACIONES EN TIEMPO REAL
              const NotificationBell(),
              
              IconButton(icon: const Icon(Icons.logout, color: AppColors.error), tooltip: 'Cerrar Sesión', onPressed: () => Supabase.instance.client.auth.signOut())
            ],
          ),
          body: _adminController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Tareas Pendientes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          _buildStatCard('Validaciones', _adminController.comerciosPendientes.toString(), Icons.verified_user, AppColors.warning),
                          const SizedBox(width: 12),
                          _buildStatCard('Reportes', _adminController.reportesPendientes.toString(), Icons.report_problem, AppColors.error),
                          const SizedBox(width: 12),
                          _buildStatCard('Soporte', _adminController.ticketsSoporte.toString(), Icons.support_agent, AppColors.info),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const Text('Herramientas de Operación', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.85,
                        children: [
                          _buildModuleCard(icon: Icons.verified_user, title: 'Validar', subtitle: 'Comercios', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminValidationScreen())).then((_) => _adminController.loadAdminStats())),
                          _buildModuleCard(icon: Icons.gavel, title: 'Moderación', subtitle: 'Reportes', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminModerationScreen())).then((_) => _adminController.loadAdminStats())),
                          _buildModuleCard(icon: Icons.support_agent, title: 'Soporte', subtitle: 'Tickets', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminSupportScreen()))),
                          _buildModuleCard(icon: Icons.insights, title: 'Mercado', subtitle: 'Demanda Global', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminMarketIntelligence()))),
                          _buildModuleCard(icon: Icons.people, title: 'Usuarios', subtitle: 'Consultar', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminUsersScreen()))),
                          _buildModuleCard(
                            icon: Icons.campaign, 
                            title: 'Mensajes', 
                            subtitle: 'Masivos', 
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminBroadcastScreen()))
                          ),
                          _buildModuleCard(
                            icon: Icons.local_offer, 
                            title: 'Ofertas', 
                            subtitle: 'Revisar', 
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminOffersScreen()))
                          ),
                          _buildModuleCard(
                            icon: Icons.pets, 
                            title: 'Animales', 
                            subtitle: 'Solicitudes', 
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminAnimalRequestsScreen()))
                          ),
                          _buildModuleCard(
                            icon: Icons.category, 
                            title: 'Categorías', 
                            subtitle: 'Gestionar', 
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminCategoriesScreen()))
                          ),
                          _buildModuleCard(
                            icon: Icons.map, 
                            title: 'Zonas', 
                            subtitle: 'Geografía', 
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminZonesScreen()))
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))]),
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
        decoration: BoxDecoration(color: AppColors.darkCardColor, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: AppColors.darkCardColor.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.white, size: 32),
            const SizedBox(height: 12),
            Text(title, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.white, fontSize: 12, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle, textAlign: TextAlign.center, style: TextStyle(color: AppColors.white.withOpacity(0.5), fontSize: 9)),
          ],
        ),
      ),
    );
  }
}
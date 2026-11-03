import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';
import '../controllers/owner_controller.dart';
import 'admin_validation_screen.dart';
import 'admin_moderation_screen.dart'; // <-- NUEVA IMPORTACIÓN
import 'admin_support_screen.dart'; // <-- NUEVA IMPORTACIÓN
import 'owner_user_management_screen.dart';
import 'owner_settings_screen.dart';
import 'owner_plans_management_screen.dart';
import 'owner_audit_screen.dart'; 
import 'owner_financial_screen.dart'; // <-- NUEVA IMPORTACIÓN

class OwnerDashboardScreen extends StatefulWidget {
  const OwnerDashboardScreen({super.key});

  @override
  State<OwnerDashboardScreen> createState() => _OwnerDashboardScreenState();
}

class _OwnerDashboardScreenState extends State<OwnerDashboardScreen> {
  final _ownerController = OwnerController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ownerController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(
            title: const Text('Super Admin Panel', style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold)),
            actions: [
              IconButton(icon: const Icon(Icons.logout, color: AppColors.error), tooltip: 'Cerrar Sesión', onPressed: () => Supabase.instance.client.auth.signOut())
            ],
          ),
          body: _ownerController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Resumen Global', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          _buildStatCard('Usuarios', _ownerController.totalUsuarios.toString(), Icons.people, AppColors.info),
                          const SizedBox(width: 12),
                          _buildStatCard('Comercios', _ownerController.totalComercios.toString(), Icons.store, AppColors.success),
                          const SizedBox(width: 12),
                          _buildStatCard('Ofertas', _ownerController.totalOfertas.toString(), Icons.local_offer, AppColors.warning),
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
                          _buildModuleCard(icon: Icons.manage_accounts, title: 'Roles', subtitle: 'Gestionar', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OwnerUserManagementScreen())).then((_) => _ownerController.loadGlobalStats())),
                          _buildModuleCard(icon: Icons.verified_user, title: 'Validar', subtitle: 'Comercios', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminValidationScreen())).then((_) => _ownerController.loadGlobalStats())),
                          _buildModuleCard(icon: Icons.workspace_premium, title: 'Planes', subtitle: 'Suscripciones', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OwnerPlansManagementScreen()))),
                          _buildModuleCard(icon: Icons.settings, title: 'Config', subtitle: 'App & Features', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OwnerSettingsScreen()))),
                          
                          // TARJETA DE AUDITORÍA CONECTADA
                          _buildModuleCard(
                            icon: Icons.security, 
                            title: 'Auditoría', 
                            subtitle: 'Logs Globales', 
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OwnerAuditScreen()))
                          ),
                          
                          // TARJETA DE INGRESOS CONECTADA
                          _buildModuleCard(
                            icon: Icons.attach_money, 
                            title: 'Ingresos', 
                            subtitle: 'Finanzas', 
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OwnerFinancialScreen()))
                          ),
                          
                          _buildModuleCard(icon: Icons.bar_chart, title: 'Métricas', subtitle: 'Analytics', onTap: () {}),
                          _buildModuleCard(icon: Icons.campaign, title: 'Push', subtitle: 'Notificaciones', onTap: () {}),
                          
                          // TARJETA DE MODERACIÓN CONECTADA
                          _buildModuleCard(
                            icon: Icons.gavel, 
                            title: 'Moderación', 
                            subtitle: 'Reportes', 
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminModerationScreen()))
                          ),
                          
                          // TARJETA DE SOPORTE CONECTADA
                          _buildModuleCard(
                            icon: Icons.support_agent, 
                            title: 'Soporte', 
                            subtitle: 'Tickets', 
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminSupportScreen()))
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
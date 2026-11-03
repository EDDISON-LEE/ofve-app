import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'admin_validation_screen.dart';
import 'admin_moderation_screen.dart';
import 'admin_support_screen.dart';
import 'admin_market_intelligence.dart'; // <-- NUEVA IMPORTACIÓN

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;

  int _comerciosPendientes = 0;
  int _reportesPendientes = 0;

  final Color primaryPurple = const Color(0xFF7C5DFE);
  final Color bgTop = const Color(0xFFECE2FC);
  final Color darkCardColor = const Color(0xFF252152);

  @override
  void initState() {
    super.initState();
    _loadAdminStats();
  }

  Future<void> _loadAdminStats() async {
    setState(() => _isLoading = true);
    try {
      final comercios = await _supabase.from('comercios').select('id').eq('estatus_verificacion', 'En Revision').count();
      final reportes = await _supabase.from('reportes_moderacion').select('id').eq('estado', 'Pendiente').count();
      
      setState(() {
        _comerciosPendientes = comercios.count;
        _reportesPendientes = reportes.count;
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
        title: const Text('Panel de Administración', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
                  const Text('Tareas Pendientes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildStatCard('Validaciones', _comerciosPendientes.toString(), Icons.verified_user, Colors.orange),
                      const SizedBox(width: 12),
                      _buildStatCard('Reportes', _reportesPendientes.toString(), Icons.report_problem, Colors.red),
                      const SizedBox(width: 12),
                      _buildStatCard('Soporte', '5', Icons.support_agent, Colors.blue),
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
                      _buildModuleCard(
                        icon: Icons.verified_user,
                        title: 'Validar',
                        subtitle: 'Comercios',
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminValidationScreen())).then((_) => _loadAdminStats()),
                      ),
                      _buildModuleCard(
                        icon: Icons.gavel,
                        title: 'Moderación',
                        subtitle: 'Reportes',
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminModerationScreen())).then((_) => _loadAdminStats()),
                      ),
                      _buildModuleCard(
                        icon: Icons.support_agent,
                        title: 'Soporte',
                        subtitle: 'Tickets',
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminSupportScreen())),
                      ),
                      
                      // --- TARJETA DE INTELIGENCIA DE MERCADO CONECTADA ---
                      _buildModuleCard(
                        icon: Icons.insights,
                        title: 'Mercado',
                        subtitle: 'Demanda Global',
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminMarketIntelligence())),
                      ),
                      
                      _buildModuleCard(icon: Icons.local_offer, title: 'Ofertas', subtitle: 'Revisar', onTap: () {}),
                      _buildModuleCard(icon: Icons.category, title: 'Categorías', subtitle: 'Gestionar', onTap: () {}),
                      _buildModuleCard(icon: Icons.campaign, title: 'Mensajes', subtitle: 'Masivos', onTap: () {}),
                      _buildModuleCard(icon: Icons.people, title: 'Usuarios', subtitle: 'Consultar', onTap: () {}),
                      _buildModuleCard(icon: Icons.map, title: 'Zonas', subtitle: 'Geografía', onTap: () {}),
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
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))]),
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
        decoration: BoxDecoration(color: darkCardColor, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: darkCardColor.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))]),
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
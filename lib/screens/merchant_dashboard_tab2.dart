import 'package:flutter/material.dart';
import 'create_offer_screen.dart';
import 'merchant_plans_screen.dart';
import 'merchant_metrics_screen.dart';
import 'add_product_screen.dart';
import 'merchant_demand_radar.dart'; // <-- NUEVA IMPORTACIÓN

class MerchantDashboardTab extends StatefulWidget {
  final String storeName;
  final String planName;
  final String category;
  final Color bgTop;
  final Color bgBottom;
  final Color curveColor;
  final Color darkCardColor;
  final Color primaryPurple;

  const MerchantDashboardTab({
    super.key,
    required this.storeName,
    required this.planName,
    required this.category,
    required this.bgTop,
    required this.bgBottom,
    required this.curveColor,
    required this.darkCardColor,
    required this.primaryPurple,
  });

  @override
  State<MerchantDashboardTab> createState() => _MerchantDashboardTabState();
}

class _MerchantDashboardTabState extends State<MerchantDashboardTab> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [widget.bgTop, widget.bgBottom], stops: const [0.0, 0.4]),
          ),
        ),
        Positioned(
          top: -150, left: -100,
          child: Container(width: 400, height: 400, decoration: BoxDecoration(shape: BoxShape.circle, color: widget.curveColor.withOpacity(0.8))),
        ),
        SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 16),
                _buildStoreInfo(),
                const SizedBox(height: 24),
                _buildMerchantGrid(context),
                const SizedBox(height: 30),
                _buildSubscriptionBanner(context),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, size: 28, color: Colors.black87),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.amber.withOpacity(0.4), blurRadius: 8, offset: const Offset(0, 4))]),
          child: Row(
            children: [
              const Icon(Icons.workspace_premium, size: 16, color: Colors.white),
              const SizedBox(width: 4),
              Text(widget.planName.toUpperCase(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStoreInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.storeName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black87)),
        Row(
          children: [
            Icon(Icons.category, size: 14, color: widget.primaryPurple),
            const SizedBox(width: 4),
            Text(widget.category, style: TextStyle(fontSize: 14, color: widget.primaryPurple, fontWeight: FontWeight.w600)),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildMiniStat('Visitas', '1,240', Icons.remove_red_eye, Colors.blue),
            const SizedBox(width: 12),
            _buildMiniStat('Ofertas', '8', Icons.local_offer, Colors.green),
            const SizedBox(width: 12),
            _buildMiniStat('Ganancias', '\$ 320', Icons.attach_money, Colors.orange),
          ],
        ),
      ],
    );
  }

  Widget _buildMiniStat(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(title, style: const TextStyle(fontSize: 11, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildMerchantGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 0.8,
      children: [
        _buildCard(
          imagePath: 'assets/icons/oferta.webp',
          title: 'Crear Oferta', 
          subtitle: 'Manual', 
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const CreateOfferScreen()));
          }
        ),
        _buildCard(imagePath: 'assets/icons/robot-ia.webp', title: 'Asistente IA', subtitle: 'Generar Textos', onTap: () {}),
        _buildCard(imagePath: 'assets/icons/microfono.webp', title: 'Por Voz', subtitle: 'Dictar Oferta', onTap: () {}),
        
        _buildCard(
          imagePath: 'assets/icons/metricas.webp', 
          title: 'Métricas', 
          subtitle: 'Ver Impacto', 
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => MerchantMetricsScreen(
              primaryPurple: widget.primaryPurple,
              bgTop: widget.bgTop,
              darkCardColor: widget.darkCardColor,
            )));
          }
        ),
        
        _buildCard(imagePath: 'assets/icons/cupones.webp', title: 'Cupones', subtitle: 'Promociones', onTap: () {}),
        _buildCard(imagePath: 'assets/icons/ganancias.webp', title: 'Ganancias', subtitle: 'Flujo de Caja', onTap: () {}),
        
        _buildCard(
          imagePath: 'assets/icons/inventario.webp', 
          title: 'Inventario', 
          subtitle: 'Subir Productos', 
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const AddProductScreen()));
          }
        ),

        _buildCard(imagePath: 'assets/icons/pools.webp', title: 'Pools', subtitle: 'Compras Grupales', onTap: () {}),
        
        // --- TARJETA DE RADAR DE DEMANDA CONECTADA ---
        _buildCard(
          imagePath: 'assets/icons/reseña.webp', // Puedes cambiar la imagen luego
          title: 'Radar', 
          subtitle: 'Demanda de mercado', 
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (_) => MerchantDemandRadar(
                categoriaComercio: widget.category,
                primaryPurple: widget.primaryPurple,
                bgTop: widget.bgTop,
              )
            ));
          }
        ),
      ],
    );
  }

  Widget _buildCard({required String imagePath, required String title, required String subtitle, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(color: widget.darkCardColor, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: widget.darkCardColor.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 40, height: 40, fit: BoxFit.contain, errorBuilder: (context, error, stackTrace) => const Icon(Icons.store, color: Colors.white, size: 32)),
            const SizedBox(height: 8),
            Text(title, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
            const SizedBox(height: 2),
            Text(subtitle, textAlign: TextAlign.center, style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 9)),
          ],
        ),
      ),
    );
  }

  Widget _buildSubscriptionBanner(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MerchantPlansScreen())),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [widget.primaryPurple, widget.primaryPurple.withOpacity(0.7)]),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: widget.primaryPurple.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Row(
          children: [
            const Icon(Icons.workspace_premium, color: Colors.white, size: 40),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Plan ${widget.planName} Activo', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  const Text('Gestiona tu suscripción y beneficios', style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }
}
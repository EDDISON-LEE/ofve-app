import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../widgets/notification_bell.dart'; 
import '../widgets/currency_ticker.dart'; 
import 'create_offer_screen.dart';
import 'merchant_plans_screen.dart';
import 'merchant_metrics_screen.dart';
import 'add_product_screen.dart';
import 'merchant_demand_radar.dart';
import 'merchant_scanner_screen.dart'; 
import 'ai_assistant_screen.dart'; 
import 'voice_offer_screen.dart'; 
import 'merchant_coupons_screen.dart'; 
import 'merchant_earnings_screen.dart'; 
import 'merchant_reviews_screen.dart'; 
import 'merchant_pools_screen.dart';
import 'merchant_ads_screen.dart'; 
import 'merchant_offers_list_screen.dart'; 
import 'merchant_sales_screen.dart'; // <-- IMPORTANTE: Asegúrate de tener este archivo

class MerchantDashboardTab extends StatefulWidget {
  final String storeName;
  final String planName;
  final String category;

  const MerchantDashboardTab({
    super.key,
    required this.storeName,
    required this.planName,
    required this.category,
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
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter, 
              end: Alignment.bottomCenter, 
              colors: [AppColors.bgTop, AppColors.bgBottom], 
              stops: [0.0, 0.4]
            ),
          ),
        ),
        Positioned(
          top: -150, left: -100,
          child: Container(width: 400, height: 400, decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.curveColor.withValues(alpha: 0.8))),
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
                
                _buildSectionTitle('Vender Ahora'),
                _buildMainActionCard(),
                
                const SizedBox(height: 24),
                
                _buildSectionTitle('Aceleradores IA'),
                _buildAIGrid(),

                const SizedBox(height: 24),

                _buildSectionTitle('Gestión del Negocio'),
                _buildManagementGrid(),
                
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
            icon: const Icon(Icons.menu, size: 28, color: AppColors.textDark),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        Row(
          children: [
            const NotificationBell(),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.amber, 
                borderRadius: BorderRadius.circular(20), 
                boxShadow: [BoxShadow(color: Colors.amber.withValues(alpha: 0.4), blurRadius: 8, offset: const Offset(0, 4))]
              ),
              child: Row(
                children: [
                  const Icon(Icons.workspace_premium, size: 16, color: AppColors.white),
                  const SizedBox(width: 4),
                  Text(widget.planName.toUpperCase(), style: const TextStyle(color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStoreInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.storeName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: AppColors.textDark)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.category, size: 14, color: AppColors.primaryPurple),
                const SizedBox(width: 4),
                Text(widget.category, style: const TextStyle(fontSize: 14, color: AppColors.primaryPurple, fontWeight: FontWeight.w600)),
              ],
            ),
            const CurrencyTicker(),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildMiniStat('Visitas', '1,240', Icons.remove_red_eye, AppColors.info),
            const SizedBox(width: 12),
            _buildMiniStat('Reputación', '100 pts', Icons.verified, AppColors.success),
            const SizedBox(width: 12),
            _buildMiniStat('Ingresos', '\$ 320', Icons.account_balance_wallet, Colors.green, isHero: true),
          ],
        ),
        const SizedBox(height: 12),
        
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.primaryPurple.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const Icon(Icons.lightbulb_outline, color: AppColors.primaryPurple, size: 16),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Tip Pro: Valida los QR a tiempo para mantener tu reputación al 100% y vender más rápido.',
                  style: TextStyle(fontSize: 11, color: AppColors.primaryPurple.withValues(alpha: 0.8), fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMiniStat(String title, String value, IconData icon, Color color, {bool isHero = false}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isHero ? AppColors.darkCardColor : AppColors.white, 
          borderRadius: BorderRadius.circular(12), 
          boxShadow: [BoxShadow(color: isHero ? AppColors.darkCardColor.withValues(alpha: 0.3) : Colors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 4))]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: isHero ? Colors.white : color, size: 20),
            const SizedBox(height: 8),
            Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: isHero ? Colors.white : AppColors.textDark)),
            Text(title, style: TextStyle(fontSize: 11, color: isHero ? Colors.white70 : Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark)),
    );
  }

  Widget _buildMainActionCard() {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MerchantScannerScreen())),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF11998e), Color(0xFF38ef7d)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: const Color(0xFF11998e).withValues(alpha: 0.4), blurRadius: 15, offset: const Offset(0, 8))],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), shape: BoxShape.circle),
              child: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 40),
            ),
            const SizedBox(width: 20),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Cobrar / Escanear QR', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900)),
                  SizedBox(height: 4),
                  Text('Valida la compra y suma a tu reputación.', style: TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildAIGrid() {
    return Row(
      children: [
        Expanded(
          child: _buildSquareCard(
            imagePath: 'assets/icons/robot-ia.webp',
            title: 'Asistente IA',
            subtitle: 'Textos mágicos',
            color: Colors.purpleAccent,
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AiAssistantScreen()))
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildSquareCard(
            imagePath: 'assets/icons/microfono.webp',
            title: 'Dictar Oferta',
            subtitle: 'Habla y vende',
            color: Colors.pinkAccent,
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const VoiceOfferScreen()))
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildSquareCard(
            imagePath: 'assets/icons/reseña.webp',
            title: 'Radar',
            subtitle: 'Demanda en vivo',
            color: Colors.orangeAccent,
            onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (_) => MerchantDemandRadar(categoriaComercio: widget.category)
            ))
          ),
        ),
      ],
    );
  }

  Widget _buildManagementGrid() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 0.85,
      children: [
        _buildGridCard(
          imagePath: 'assets/icons/oferta.webp',
          title: 'Lanzar Oferta', 
          subtitle: 'Vender ya', 
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CreateOfferScreen()))
        ),
        _buildGridCard(
          imagePath: 'assets/icons/inventario.webp', 
          title: 'Mi Catálogo', 
          subtitle: 'Ofertas activas', 
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MerchantOffersListScreen()))
        ),
        // --- FIX: Botón de Mis Ventas agregado ---
        _buildGridCard(
          imagePath: 'assets/icons/ganancias.webp', 
          title: 'Mis Ventas', 
          subtitle: 'Ver estados', 
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MerchantSalesScreen()))
        ),
        // ----------------------------------------
        _buildGridCard(
          imagePath: 'assets/icons/metricas.webp', 
          title: 'Métricas', 
          subtitle: 'Ver impacto', 
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MerchantMetricsScreen()))
        ),
        _buildGridCard(
          imagePath: 'assets/icons/cupones.webp', 
          title: 'Cupones', 
          subtitle: 'Promociones', 
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MerchantCouponsScreen()))
        ),
        _buildGridCard(
          imagePath: 'assets/icons/inventario.webp', 
          title: 'Inventario', 
          subtitle: 'Subir productos', 
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AddProductScreen()))
        ),
        _buildGridCard(
          imagePath: 'assets/icons/pools.webp', 
          title: 'Pools', 
          subtitle: 'Compras grupales', 
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MerchantPoolsScreen()))
        ),
        _buildGridCard(
          imagePath: 'assets/icons/corona.webp', 
          title: 'Publicidad', 
          subtitle: 'Destacar ofertas', 
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MerchantAdsScreen()))
        ),
        _buildGridCard(
          imagePath: 'assets/icons/reseña.webp', 
          title: 'Reseñas', 
          subtitle: 'Reputación', 
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MerchantReviewsScreen()))
        ),
      ],
    );
  }

  Widget _buildSquareCard({required String imagePath, required String title, required String subtitle, required Color color, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: color.withValues(alpha: 0.15), blurRadius: 10, offset: const Offset(0, 5))],
          border: Border.all(color: color.withValues(alpha: 0.2)),
        ),
        child: Column(
          children: [
            Image.asset(imagePath, width: 36, height: 36, fit: BoxFit.contain, errorBuilder: (context, error, stackTrace) => Icon(Icons.auto_awesome, color: color, size: 32)),
            const SizedBox(height: 10),
            Text(title, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.textDark, fontSize: 12, fontWeight: FontWeight.bold)),
            const SizedBox(height: 2),
            Text(subtitle, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.textLight, fontSize: 9)),
          ],
        ),
      ),
    );
  }

  Widget _buildGridCard({required String imagePath, required String title, required String subtitle, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.darkCardColor, 
          borderRadius: BorderRadius.circular(16), 
          boxShadow: [BoxShadow(color: AppColors.darkCardColor.withValues(alpha: 0.2), blurRadius: 8, offset: const Offset(0, 4))]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 32, height: 32, fit: BoxFit.contain, errorBuilder: (context, error, stackTrace) => const Icon(Icons.store, color: AppColors.white, size: 28)),
            const SizedBox(height: 8),
            Text(title, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.white, fontSize: 11, fontWeight: FontWeight.w600)),
            const SizedBox(height: 2),
            Text(subtitle, textAlign: TextAlign.center, style: TextStyle(color: AppColors.white.withValues(alpha: 0.5), fontSize: 9)),
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
          gradient: LinearGradient(colors: [AppColors.primaryPurple, AppColors.primaryPurple.withValues(alpha: 0.7)]),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: AppColors.primaryPurple.withValues(alpha: 0.3), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Row(
          children: [
            const Icon(Icons.workspace_premium, color: AppColors.white, size: 40),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Plan ${widget.planName} Activo', style: const TextStyle(color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  const Text('Gestiona tu suscripción y beneficios', style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: AppColors.white, size: 20),
          ],
        ),
      ),
    );
  }
}
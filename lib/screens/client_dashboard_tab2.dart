import 'dart:ui'; // <-- IMPORTANTE: Necesario para el ImageFilter (blur)
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientDashboardTab extends StatefulWidget {
  final String userName;
  final int puntos;
  final Color bgTop;
  final Color bgBottom;
  final Color curveColor;
  final Color darkCardColor;
  final Color primaryPurple;
  final Color textMagenta;

  const ClientDashboardTab({
    super.key,
    required this.userName,
    required this.puntos,
    required this.bgTop,
    required this.bgBottom,
    required this.curveColor,
    required this.darkCardColor,
    required this.primaryPurple,
    required this.textMagenta,
  });

  @override
  State<ClientDashboardTab> createState() => _ClientDashboardTabState();
}

class _ClientDashboardTabState extends State<ClientDashboardTab> {
  final _supabase = Supabase.instance.client;
  List<dynamic> _ofertas = [];
  bool _isLoadingOfertas = true;

  @override
  void initState() {
    super.initState();
    _cargarOfertas();
  }

  Future<void> _cargarOfertas() async {
    try {
      final response = await _supabase
          .from('ofertas')
          .select('*')
          .eq('estado', 'Activa')
          .order('fecha_inicio', ascending: false)
          .limit(5);
      setState(() => _ofertas = response);
    } catch (e) {
      debugPrint('Error cargando ofertas: $e');
    } finally {
      if (mounted) setState(() => _isLoadingOfertas = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. FONDO DEGRADADO
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [widget.bgTop, widget.bgBottom],
              stops: const [0.0, 0.4],
            ),
          ),
        ),
        // 2. CURVA DIFUMINADA
        Positioned(
          top: -150,
          left: -100,
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.curveColor.withOpacity(0.8),
            ),
          ),
        ),
        // 3. CONTENIDO PRINCIPAL
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
        const Icon(Icons.settings, size: 28, color: Colors.black87),
      ],
    );
  }

  Widget _buildUserInfo() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white,
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
              'US. \$ ${widget.puntos},00',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black87),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: '¿Qué buscas hoy, ${widget.userName}',
          hintStyle: TextStyle(color: Colors.grey[500], fontSize: 13),
          prefixIcon: Icon(Icons.mic, color: widget.primaryPurple, size: 22),
          suffixIcon: Icon(Icons.search, color: widget.primaryPurple, size: 24),
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
        _buildCard(imagePath: 'assets/icons/robot.webp', title: 'Asistente IA', subtitle: 'Todo a mano', onTap: () {}),
        _buildCard(imagePath: 'assets/icons/bolsa.webp', title: 'Compra Guiada', subtitle: 'Optimiza presupuesto', onTap: () {}),
        _buildCard(imagePath: 'assets/icons/planifica.webp', title: 'Planifica Compra', subtitle: 'Ahorra tiempo', onTap: () {}),
        _buildCard(imagePath: 'assets/icons/brujula.webp', title: 'Ofertas Cercanas', subtitle: 'Ver mapa', onTap: () {}),
        _buildCard(imagePath: 'assets/icons/corona.webp', title: 'Planes VIP', subtitle: 'Descuentos', onTap: () {}),
        _buildCard(imagePath: 'assets/icons/regalo.webp', title: 'Todas las Ofertas', subtitle: 'Ilimitado', onTap: () {}),
      ],
    );
  }

  // --- TARJETA CON EFECTO DE CRISTAL DIFUMINADO (GLASSMORPHISM) ---
  Widget _buildCard({required String imagePath, required String title, required String subtitle, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          // Aplicamos el difuminado de fondo
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: BoxDecoration(
              // Color base semi-transparente para el efecto de cristal
              color: widget.darkCardColor.withOpacity(0.85),
              borderRadius: BorderRadius.circular(16),
              // Borde sutil para simular el reflejo del cristal
              border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
              // Sombra suave
              boxShadow: [BoxShadow(color: widget.darkCardColor.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.shopping_bag, color: Colors.white, size: 32),
                ),
                const SizedBox(height: 8),
                Text(
                  title, 
                  textAlign: TextAlign.center, 
                  style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle, 
                  textAlign: TextAlign.center, 
                  style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 9)
                ),
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
            const Text('Oferta del Día', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
            Text('Ver todas', style: TextStyle(color: widget.textMagenta, fontWeight: FontWeight.bold, fontSize: 14)),
          ],
        ),
        const SizedBox(height: 10),
        
        if (_isLoadingOfertas)
          Center(child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: CircularProgressIndicator(color: widget.primaryPurple),
          ))
        else if (_ofertas.isEmpty)
          const Text('No hay ofertas disponibles hoy.', style: TextStyle(color: Colors.black54))
        else
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _ofertas.length,
              itemBuilder: (context, index) {
                final oferta = _ofertas[index];
                return Container(
                  width: 140,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 4))],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                        child: (oferta['imagen_url'] != null && oferta['imagen_url'].toString().isNotEmpty)
                            ? Image.network(oferta['imagen_url'], height: 90, width: double.infinity, fit: BoxFit.cover)
                            : Container(height: 90, color: Colors.grey[200], child: const Icon(Icons.image, color: Colors.grey)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              oferta['producto_nombre'] ?? 'Producto',
                              maxLines: 1, overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                if (oferta['precio_oferta'] != null) ...[
                                  Text('\$${oferta['precio_oferta']}', style: TextStyle(color: widget.primaryPurple, fontWeight: FontWeight.bold, fontSize: 14)),
                                  const SizedBox(width: 4),
                                  Text('\$${oferta['precio_regular']}', style: const TextStyle(color: Colors.grey, fontSize: 10, decoration: TextDecoration.lineThrough)),
                                ] else ...[
                                  Text('\$${oferta['precio_regular']}', style: TextStyle(color: widget.primaryPurple, fontWeight: FontWeight.bold, fontSize: 14)),
                                ],
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}

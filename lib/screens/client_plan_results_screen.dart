import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/theme/app_theme.dart';
import '../controllers/client_plan_controller.dart';
import '../controllers/currency_controller.dart'; 
import '../controllers/purchase_controller.dart';
import 'purchase_qr_screen.dart';

class ClientPlanResultsScreen extends StatefulWidget {
  const ClientPlanResultsScreen({super.key});

  @override
  State<ClientPlanResultsScreen> createState() => _ClientPlanResultsScreenState();
}

class _ClientPlanResultsScreenState extends State<ClientPlanResultsScreen> {
  final _planController = ClientPlanController();
  final _currencyController = CurrencyController();
  final _purchaseController = PurchaseController();

  // Función para abrir Google Maps en modo ruta
  Future<void> _abrirRutaNavegacion(double lat, double lng) async {
    final url = Uri.parse('https://www.google.com/maps/dir/?api=1&destination=$lat,$lng&travelmode=driving');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No se pudo abrir Google Maps'), backgroundColor: AppColors.error));
      }
    }
  }

  void _abrirComercio(Map<String, dynamic> oferta) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Datos del Comercio', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.store, color: AppColors.primaryPurple),
              title: Text(oferta['nombre_comercio'] ?? 'Comercio'),
              subtitle: Text(oferta['direccion'] ?? 'Sin dirección'),
            ),
            ListTile(
              leading: const Icon(Icons.phone, color: AppColors.success),
              title: const Text('Llamar al comercio'),
              onTap: () async {
                final telefono = oferta['telefono'] ?? '';
                if (telefono.isNotEmpty) {
                  final url = Uri.parse('tel:$telefono');
                  if (await canLaunchUrl(url)) await launchUrl(url);
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.map, color: AppColors.info),
              title: const Text('Iniciar Ruta en Google Maps'),
              onTap: () => _abrirRutaNavegacion((oferta['latitud'] as num).toDouble(), (oferta['longitud'] as num).toDouble()),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _comprarItem(Map<String, dynamic> oferta) async {
    showDialog(context: context, barrierDismissible: false, builder: (_) => const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple)));
    
    final success = await _purchaseController.createPurchase(
      comercioId: oferta['comercio_id'],
      ofertaId: oferta['oferta_id'],
      montoFinal: (oferta['precio'] as num).toDouble(),
    );
    
    if (mounted) Navigator.pop(context);
    
    if (success && mounted) {
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => PurchaseQrScreen(
          qrToken: _purchaseController.purchaseData!['qr_token'],
          total: (oferta['precio'] as num).toDouble(),
          nombreComercio: oferta['nombre_comercio'],
        ),
      ));
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_purchaseController.errorMessage ?? 'Error'), backgroundColor: AppColors.error));
    }
  }

  @override
  Widget build(BuildContext context) {
    final resultados = _planController.resultados;
    
    final Map<String, List<Map<String, dynamic>>> agrupados = {};
    for (var res in resultados) {
      if (res['oferta'] != null) {
        final nombreComercio = res['oferta']['nombre_comercio'] ?? 'Comercio Desconocido';
        agrupados.putIfAbsent(nombreComercio, () => []).add(res);
      }
    }

    return Scaffold(
      backgroundColor: AppColors.bgTop,
      appBar: AppBar(
        title: const Text('Resultados de tu Plan'),
        actions: [
          // Botón rápido para ruta general (al primer comercio)
          if (agrupados.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.directions, color: AppColors.primaryPurple),
              tooltip: 'Iniciar ruta al primer comercio',
              onPressed: () {
                final primerComercio = agrupados.values.first.first['oferta'];
                _abrirRutaNavegacion((primerComercio['latitud'] as num).toDouble(), (primerComercio['longitud'] as num).toDouble());
              },
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.success, 
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: AppColors.success.withValues(alpha: 0.3), blurRadius: 10, offset: const Offset(0, 5))]
            ),
            child: Column(
              children: [
                const Icon(Icons.check_circle, color: AppColors.white, size: 40),
                const SizedBox(height: 8),
                const Text('¡Hemos optimizado tu compra!', textAlign: TextAlign.center, style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),
                Text('Total Estimado: \$${_planController.totalEstimado.toStringAsFixed(2)}', style: const TextStyle(color: AppColors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                Text('≈ ${_currencyController.formatBs(_planController.totalEstimado)}', style: const TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          
          if (agrupados.isEmpty)
            const Center(child: Text('No se encontraron ofertas para los productos de tu lista.'))
          else
            ...agrupados.entries.map((entry) {
              final tienda = entry.key;
              final items = entry.value;
              final ofertaBase = items.first['oferta'];

              return Card(
                margin: const EdgeInsets.only(bottom: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text(tienda, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                          IconButton(
                            icon: const Icon(Icons.storefront, color: AppColors.primaryPurple),
                            tooltip: 'Ver datos del comercio',
                            onPressed: () => _abrirComercio(ofertaBase),
                          ),
                        ],
                      ),
                      Text(ofertaBase['direccion'] ?? 'Sin dirección', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                      const Divider(),
                      
                      ...items.map((item) {
                        final oferta = item['oferta'];
                        final solicitado = item['item_solicitado'];
                        final precio = (oferta['precio'] as num).toDouble();
                        final cantidad = int.tryParse(solicitado['cantidad'].toString()) ?? 1;

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${cantidad}x ${solicitado['nombre']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                    Text('Precio unitario: \$${precio.toStringAsFixed(2)}', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('\$${(precio * cantidad).toStringAsFixed(2)}', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold, fontSize: 16)),
                                  Text('≈ ${_currencyController.formatBs(precio * cantidad)}', style: const TextStyle(color: AppColors.success, fontSize: 11)),
                                ],
                              ),
                              const SizedBox(width: 12),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryPurple,
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                                ),
                                onPressed: () => _comprarItem(oferta),
                                child: const Text('Comprar', style: TextStyle(color: Colors.white, fontSize: 12)),
                              ),
                            ],
                          ),
                        );
                      }),
                      
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(foregroundColor: AppColors.info),
                          onPressed: () => _abrirRutaNavegacion(
                            (ofertaBase['latitud'] as num).toDouble(), 
                            (ofertaBase['longitud'] as num).toDouble()
                          ),
                          icon: const Icon(Icons.directions),
                          label: const Text('Cómo llegar a esta tienda'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
        ],
      ),
    );
  }
}
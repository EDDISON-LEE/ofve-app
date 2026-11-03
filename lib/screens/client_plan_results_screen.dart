import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/theme/app_theme.dart';
import '../controllers/client_plan_controller.dart';
import '../controllers/purchase_controller.dart';
import 'purchase_qr_screen.dart';

class ClientPlanResultsScreen extends StatelessWidget {
  const ClientPlanResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Creamos una instancia temporal para leer los resultados (en producción usa un Provider o GetX)
    final planController = ClientPlanController();
    
    // Nota: Esto asume que el controlador anterior mantiene los datos en memoria.
    // En una app real, usarías un gestor de estado global. Por ahora lo simulamos accediendo a las variables.
    // (Para este código, asumiremos que el usuario puede volver atrás y los datos no se pierden en el árbol).

    return Scaffold(
      backgroundColor: AppColors.bgTop,
      appBar: AppBar(title: const Text('Resultados de tu Plan')),
      body: _buildResults(context, planController),
    );
  }

  Widget _buildResults(BuildContext context, ClientPlanController controller) {
    // Simulación de UI de resultados (en el código real usarías AnimatedBuilder o Provider)
    // Aquí mostramos la UI como si tuviéramos los datos.
    
    final resultados = controller.resultados;
    final total = controller.totalEstimado;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: AppColors.success, borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              const Icon(Icons.check_circle, color: AppColors.white, size: 40),
              const SizedBox(height: 8),
              const Text('¡Hemos optimizado tu compra!', textAlign: TextAlign.center, style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 8),
              Text('Total Estimado: \$${total.toStringAsFixed(2)}', style: const TextStyle(color: AppColors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        const SizedBox(height: 20),
        
        if (resultados.isEmpty)
          const Center(child: Text('No se encontraron ofertas para los productos de tu lista.'))
        else
          ...resultados.map((res) {
            final oferta = res['oferta'];
            final item = res['item_solicitado'];
            
            if (oferta == null) {
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: ListTile(
                  leading: const Icon(Icons.warning, color: AppColors.warning),
                  title: Text(item['nombre'], style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Text('No encontramos este producto en tu zona.'),
                ),
              );
            }

            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.primaryPurple.withOpacity(0.1),
                      child: const Icon(Icons.store, color: AppColors.primaryPurple),
                    ),
                    title: Text(oferta['nombre_comercio'], style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(oferta['direccion']),
                    trailing: Text('\$${oferta['precio']}', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${item['cantidad']}x ${item['nombre']}', style: const TextStyle(fontWeight: FontWeight.w500)),
                        TextButton.icon(
                          onPressed: () async {
                            final url = 'https://www.google.com/maps/search/?api=1&query=${oferta['latitud']},${oferta['longitud']}';
                            if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(Uri.parse(url));
                            }
                          },
                          icon: const Icon(Icons.map, size: 16),
                          label: const Text('Ver en Maps'),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryPurple),
                        onPressed: () {
                          // Generar compra directa para este producto
                          _comprarItem(context, oferta);
                        },
                        child: const Text('Comprar este producto', style: TextStyle(color: AppColors.white)),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
      ],
    );
  }

  Future<void> _comprarItem(BuildContext context, Map<String, dynamic> oferta) async {
    final purchaseController = PurchaseController();
    showDialog(context: context, barrierDismissible: false, builder: (_) => const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple)));
    
    final success = await purchaseController.createPurchase(
      comercioId: oferta['comercio_id'],
      ofertaId: oferta['oferta_id'],
      montoFinal: (oferta['precio'] as num).toDouble(), // CORRECCIÓN: monto -> montoFinal
    );
    
    if (context.mounted) Navigator.pop(context);
    
    if (success && context.mounted) {
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => PurchaseQrScreen(
          qrToken: purchaseController.purchaseData!['qr_token'],
          total: (oferta['precio'] as num).toDouble(),
          nombreComercio: oferta['nombre_comercio'],
        ),
      ));
    } else if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(purchaseController.errorMessage ?? 'Error'), backgroundColor: AppColors.error));
    }
  }
}
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import '../controllers/merchant_ads_controller.dart';

class MerchantAdsScreen extends StatefulWidget {
  const MerchantAdsScreen({super.key});

  @override
  State<MerchantAdsScreen> createState() => _MerchantAdsScreenState();
}

class _MerchantAdsScreenState extends State<MerchantAdsScreen> {
  final _adsController = MerchantAdsController();

  void _mostrarDialogoCompra(String offerId, String offerName) {
    int selectedDays = 7;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setState) {
          double total = _adsController.precioPorDia * selectedDays;
          return AlertDialog(
            title: const Text('Destacar Oferta'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Oferta: $offerName', style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                const Text('¿Cuántos días deseas destacarla?'),
                const SizedBox(height: 8),
                Slider(
                  value: selectedDays.toDouble(),
                  min: 3,
                  max: 30,
                  divisions: 9,
                  label: '$selectedDays días',
                  activeColor: AppColors.primaryPurple,
                  onChanged: (v) => setState(() => selectedDays = v.round()),
                ),
                Text('Total a pagar: \$${total.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 18, color: AppColors.primaryPurple, fontWeight: FontWeight.bold)),
              ],
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
              ElevatedButton(
                onPressed: () async {
                  // FIX: capturamos messenger antes del await
                  final messenger = ScaffoldMessenger.of(context);
                  final success = await _adsController.buyAd(offerId: offerId, days: selectedDays);
                  if (!mounted) return;
                  if (ctx.mounted) Navigator.pop(ctx);
                  if (success) {
                    messenger.showSnackBar(SnackBar(
                      content: Text(_adsController.successMessage ?? 'Campaña activada'),
                      backgroundColor: AppColors.success,
                    ));
                  } else {
                    messenger.showSnackBar(SnackBar(
                      content: Text(_adsController.errorMessage ?? 'Error'),
                      backgroundColor: AppColors.error,
                    ));
                  }
                },
                child: const Text('Pagar y Destacar'),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _adsController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Publicidad (Ads)')),
          body: _adsController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (_adsController.myCampaigns.isNotEmpty) ...[
                        const Text('Tus Campañas Activas',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _adsController.myCampaigns.length,
                          itemBuilder: (context, index) {
                            final camp = _adsController.myCampaigns[index];
                            final fechaFin = DateTime.parse(camp['fecha_fin']).toLocal();
                            final fechaStr = DateFormat('dd/MM/yyyy').format(fechaFin);

                            return Card(
                              margin: const EdgeInsets.only(bottom: 12),
                              color: Colors.amber.withValues(alpha: 0.1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: const BorderSide(color: Colors.amber)),
                              child: ListTile(
                                leading: const Icon(Icons.star, color: Colors.amber),
                                title: Text(camp['ofertas']?['producto_nombre'] ?? 'Oferta',
                                    style: const TextStyle(fontWeight: FontWeight.bold)),
                                subtitle: Text('Finaliza el: $fechaStr'),
                                trailing: Text('${camp['dias_duracion']} días',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold, color: Colors.amber)),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 30),
                      ],
                      const Text('Selecciona una oferta para promocionar',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      if (_adsController.myOffers.isEmpty)
                        const Center(
                            child: Text('No tienes ofertas activas para promocionar.',
                                style: TextStyle(color: Colors.grey)))
                      else
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _adsController.myOffers.length,
                          itemBuilder: (context, index) {
                            final offer = _adsController.myOffers[index];
                            final isAlreadySponsored = offer['es_patrocinada'] ?? false;

                            return Card(
                              margin: const EdgeInsets.only(bottom: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: AppColors.primaryPurple.withValues(alpha: 0.1),
                                  child: const Icon(Icons.local_offer, color: AppColors.primaryPurple),
                                ),
                                title: Text(offer['producto_nombre'],
                                    style: const TextStyle(fontWeight: FontWeight.bold)),
                                subtitle: Text('\$${offer['precio_oferta'] ?? offer['precio_regular']}'),
                                trailing: isAlreadySponsored
                                    ? const Text('Ya destacada',
                                        style: TextStyle(color: AppColors.success, fontWeight: FontWeight.bold))
                                    : ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.amber, foregroundColor: Colors.white),
                                        onPressed: () => _mostrarDialogoCompra(
                                            offer['id'], offer['producto_nombre']),
                                        child: const Text('Destacar'),
                                      ),
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
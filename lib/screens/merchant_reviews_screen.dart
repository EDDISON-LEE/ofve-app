import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import '../controllers/merchant_reviews_controller.dart';

class MerchantReviewsScreen extends StatefulWidget {
  const MerchantReviewsScreen({super.key});

  @override
  State<MerchantReviewsScreen> createState() => _MerchantReviewsScreenState();
}

class _MerchantReviewsScreenState extends State<MerchantReviewsScreen> {
  final _reviewsController = MerchantReviewsController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _reviewsController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(
            title: const Text('Mis Reseñas'),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh, color: AppColors.textDark),
                onPressed: _reviewsController.loadReviews,
              )
            ],
          ),
          body: _reviewsController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : _reviewsController.reviews.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star_border, size: 80, color: Colors.grey),
                          SizedBox(height: 16),
                          Text('Aún no tienes reseñas.', style: TextStyle(fontSize: 18, color: AppColors.textLight)),
                          Text('Pide a tus clientes que validen sus compras.', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    )
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // RESUMEN DE REPUTACIÓN
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15, offset: const Offset(0, 5))],
                            ),
                            child: Row(
                              children: [
                                // Promedio General
                                Column(
                                  children: [
                                    Text(
                                      _reviewsController.averageRating.toStringAsFixed(1),
                                      style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: AppColors.textDark),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: List.generate(5, (index) {
                                        return Icon(
                                          index < _reviewsController.averageRating.floor() ? Icons.star : Icons.star_border,
                                          color: Colors.amber,
                                          size: 20,
                                        );
                                      }),
                                    ),
                                    const SizedBox(height: 4),
                                    Text('${_reviewsController.reviews.length} reseñas', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                                  ],
                                ),
                                const SizedBox(width: 24),
                                const VerticalDivider(thickness: 1, color: Colors.black12),
                                const SizedBox(width: 24),
                                // Desglose
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      _buildRatingBar('Calidad', _reviewsController.averageProductQuality, AppColors.success),
                                      const SizedBox(height: 12),
                                      _buildRatingBar('Atención', _reviewsController.averageService, AppColors.primaryPurple),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: 30),
                          const Text('Comentarios Recientes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 16),

                          // LISTA DE RESEÑAS
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _reviewsController.reviews.length,
                            itemBuilder: (context, index) {
                              final review = _reviewsController.reviews[index];
                              final clientName = review['usuarios']?['nombre'] ?? 'Cliente';
                              final date = review['fecha_validacion'] != null 
                                  ? DateTime.parse(review['fecha_validacion']).toLocal() 
                                  : DateTime.now();
                              final formattedDate = DateFormat('dd/MM/yyyy').format(date);
                              final quality = (review['calificacion_estado'] as num).toInt();
                              final service = (review['calificacion_atencion'] as num).toInt();

                              return Card(
                                margin: const EdgeInsets.only(bottom: 12),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(clientName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                          Text(formattedDate, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          _buildStarRating(quality, 'Calidad'),
                                          const SizedBox(width: 12),
                                          _buildStarRating(service, 'Atención'),
                                        ],
                                      ),
                                      if (review['comentario_cliente'] != null && review['comentario_cliente'].toString().isNotEmpty) ...[
                                        const SizedBox(height: 12),
                                        Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(8)),
                                          child: Text(
                                            '"${review['comentario_cliente']}"',
                                            style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 13),
                                          ),
                                        )
                                      ]
                                    ],
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

  Widget _buildRatingBar(String label, double rating, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            Text(rating.toStringAsFixed(1), style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: rating / 5,
          backgroundColor: Colors.grey[200],
          color: color,
          borderRadius: BorderRadius.circular(10),
          minHeight: 8,
        ),
      ],
    );
  }

  Widget _buildStarRating(int stars, String label) {
    return Row(
      children: [
        Text('$label:', style: const TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(width: 4),
        ...List.generate(5, (index) => Icon(
          index < stars ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 14,
        )),
      ],
    );
  }
}
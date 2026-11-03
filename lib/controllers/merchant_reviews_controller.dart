import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MerchantReviewsController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> reviews = [];
  
  double averageRating = 0.0;
  double averageProductQuality = 0.0;
  double averageService = 0.0;

  MerchantReviewsController() {
    loadReviews();
  }

  Future<void> loadReviews() async {
    isLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      final comercio = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      final comercioId = comercio['id'];

      // Buscamos las compras completadas y validadas por el cliente
      final response = await _supabase
          .from('compras')
          .select('*, usuarios(nombre)')
          .eq('comercio_id', comercioId)
          .eq('estado', 'Completado')
          .eq('validado_por_cliente', true)
          .order('fecha_validacion', ascending: false);

      // Filtramos solo las que tienen calificación
      reviews = response.where((r) => r['calificacion_estado'] != null && r['calificacion_atencion'] != null).toList();

      if (reviews.isNotEmpty) {
        double sumTotal = 0;
        double sumQuality = 0;
        double sumService = 0;

        for (var r in reviews) {
          final quality = (r['calificacion_estado'] as num).toDouble();
          final service = (r['calificacion_atencion'] as num).toDouble();
          
          sumQuality += quality;
          sumService += service;
          sumTotal += (quality + service) / 2;
        }

        averageProductQuality = sumQuality / reviews.length;
        averageService = sumService / reviews.length;
        averageRating = sumTotal / reviews.length;
      }

    } catch (e) {
      debugPrint('Error cargando reseñas: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
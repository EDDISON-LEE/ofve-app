import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminOffersController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> offers = [];
  String? errorMessage;

  AdminOffersController() {
    loadOffers();
  }

  Future<void> loadOffers() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      // Hacemos JOIN con comercios para obtener el nombre de la tienda
      final response = await _supabase
          .from('ofertas')
          .select('*, comercios(nombre_comercial)')
          .order('fecha_creacion', ascending: false);
      offers = response;
    } catch (e) {
      debugPrint('Error cargando ofertas (Admin): $e');
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleOfferStatus(String offerId, String currentStatus) async {
    try {
      final newStatus = currentStatus == 'Activa' ? 'Suspendida' : 'Activa';
      await _supabase.from('ofertas').update({
        'estado': newStatus,
      }).eq('id', offerId);
      
      await loadOffers(); // Recargar
    } catch (e) {
      debugPrint('Error al suspender/reactivar oferta: $e');
    }
  }

  Future<void> deleteOffer(String offerId) async {
    try {
      await _supabase.from('ofertas').delete().eq('id', offerId);
      await loadOffers();
    } catch (e) {
      debugPrint('Error al eliminar oferta: $e');
    }
  }
}
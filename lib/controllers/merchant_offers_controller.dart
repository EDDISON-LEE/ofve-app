import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MerchantOffersController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  String? errorMessage;
  List<dynamic> activeOffers = [];

  MerchantOffersController() {
    loadOffers();
  }

  Future<void> loadOffers() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      
      // 1. Obtener el ID del comercio
      final comercioData = await _supabase
          .from('comercios')
          .select('id')
          .eq('usuario_id', userId)
          .single();
      
      final comercioId = comercioData['id'];

      // 2. Obtener las ofertas activas
      final response = await _supabase
          .from('ofertas')
          .select('*')
          .eq('comercio_id', comercioId)
          .eq('estado', 'Activa')
          .order('fecha_inicio', ascending: false);

      activeOffers = response;
    } catch (e) {
      debugPrint('Error cargando ofertas del comercio: $e');
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
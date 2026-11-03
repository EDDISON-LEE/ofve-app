import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoadingOffers = true;
  List<dynamic> offers = [];

  ClientController() {
    loadOffers();
  }

  Future<void> loadOffers() async {
    isLoadingOffers = true;
    notifyListeners();

    try {
      final response = await _supabase
          .from('ofertas')
          .select('*')
          .eq('estado', 'Activa')
          .order('fecha_inicio', ascending: false)
          .limit(5);
      offers = response;
    } catch (e) {
      debugPrint('Error cargando ofertas: $e');
    } finally {
      isLoadingOffers = false;
      notifyListeners();
    }
  }
}
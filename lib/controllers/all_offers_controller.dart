import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AllOffersController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> offers = [];
  List<dynamic> filteredOffers = [];
  String? selectedCategory;

  final List<String> categories = [
    'Todas', 'Alimentos y Bebidas', 'Tecnología', 'Ropa y Calzado', 
    'Salud y Belleza', 'Hogar y Ferretería', 'Supermercado', 
    'Farmacia', 'Servicios', 'Otros'
  ];

  AllOffersController() {
    loadAllOffers();
  }

  Future<void> loadAllOffers() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _supabase
          .from('ofertas')
          .select('*')
          .eq('estado', 'Activa')
          .order('fecha_inicio', ascending: false);

      offers = response;
      _applyFilter();
    } catch (e) {
      debugPrint('Error cargando ofertas: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void filterByCategory(String? category) {
    selectedCategory = category;
    _applyFilter();
    notifyListeners();
  }

  void _applyFilter() {
    if (selectedCategory == null || selectedCategory == 'Todas') {
      filteredOffers = offers;
    } else {
      filteredOffers = offers.where((o) => o['categoria'] == selectedCategory).toList();
    }
  }
}
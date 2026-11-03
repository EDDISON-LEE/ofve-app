import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CategoriesController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<String> categories = [];

  CategoriesController() {
    loadCategories();
  }

  Future<void> loadCategories() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _supabase
          .from('categorias')
          .select('nombre')
          .order('nombre', ascending: true);
      
      categories = response.map<String>((c) => c['nombre'].toString()).toList();
      
      // Si por alguna razón la tabla está vacía, ponemos un fallback
      if (categories.isEmpty) {
        categories = ['Alimentos y Bebidas', 'Tecnología', 'Otros'];
      }
    } catch (e) {
      debugPrint('Error cargando categorías: $e');
      categories = ['Alimentos y Bebidas', 'Tecnología', 'Otros'];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
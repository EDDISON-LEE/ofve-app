import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminCategoriesController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> categories = [];

  AdminCategoriesController() {
    loadCategories();
  }

  Future<void> loadCategories() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _supabase
          .from('categorias')
          .select('*')
          .order('nombre', ascending: true);
      categories = response;
    } catch (e) {
      debugPrint('Error cargando categorias: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> addCategory(String name) async {
    if (name.trim().isEmpty) return false;
    
    try {
      await _supabase.from('categorias').insert({
        'nombre': name.trim(),
      });
      await loadCategories();
      return true;
    } catch (e) {
      debugPrint('Error creando categoria: $e');
      return false;
    }
  }

  Future<void> deleteCategory(String id) async {
    try {
      await _supabase.from('categorias').delete().eq('id', id);
      await loadCategories();
    } catch (e) {
      debugPrint('Error eliminando categoria: $e');
    }
  }
}
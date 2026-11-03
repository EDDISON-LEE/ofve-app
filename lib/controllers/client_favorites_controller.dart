import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientFavoritesController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> favorites = [];
  List<String> favoriteIds = []; // <-- NUEVO: Lista rápida de IDs

  ClientFavoritesController() {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    isLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;

      final response = await _supabase
          .from('favoritos')
          .select('oferta_id, ofertas(*)')
          .eq('usuario_id', userId)
          .order('fecha_agregado', ascending: false);

      favorites = response.map((f) => f['ofertas']).toList();
      // Guardamos solo los IDs para búsquedas rápidas
      favoriteIds = favorites.map((o) => o['id'].toString()).toList(); 
    } catch (e) {
      debugPrint('Error cargando favoritos: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  bool isFavorite(String ofertaId) {
    return favoriteIds.contains(ofertaId);
  }

  Future<void> toggleFavorite(String ofertaId) async {
    try {
      final userId = _supabase.auth.currentUser!.id;

      final existing = await _supabase
          .from('favoritos')
          .select('id')
          .eq('usuario_id', userId)
          .eq('oferta_id', ofertaId)
          .maybeSingle();

      if (existing != null) {
        await _supabase.from('favoritos').delete().eq('id', existing['id']);
        favoriteIds.remove(ofertaId);
        favorites.removeWhere((o) => o['id'] == ofertaId);
      } else {
        await _supabase.from('favoritos').insert({
          'usuario_id': userId,
          'oferta_id': ofertaId,
        });
        // No recargamos toda la lista para no perder el scroll, solo actualizamos localmente
        favoriteIds.add(ofertaId);
        loadFavorites(); // Recargamos en segundo plano para traer los datos completos
      }
      
      notifyListeners();
    } catch (e) {
      debugPrint('Error al cambiar favorito: $e');
    }
  }
}
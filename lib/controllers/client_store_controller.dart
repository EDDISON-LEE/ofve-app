import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientStoreController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  bool isFollowing = false;
  bool isActionLoading = false;
  Map<String, dynamic>? storeData;
  List<dynamic> storeOffers = [];

  Future<void> loadStoreProfile(String comercioId) async {
    isLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;

      // 1. Cargar datos de la tienda
      final storeRes = await _supabase
          .from('comercios')
          .select('*')
          .eq('id', comercioId)
          .single();
      storeData = storeRes;

      // 2. Cargar ofertas de la tienda
      final offersRes = await _supabase
          .from('ofertas')
          .select('*')
          .eq('comercio_id', comercioId)
          .eq('estado', 'Activa');
      storeOffers = offersRes;

      // 3. Verificar si el cliente ya sigue a esta tienda
      final followRes = await _supabase
          .from('seguidores_comercios')
          .select('id')
          .eq('usuario_id', userId)
          .eq('comercio_id', comercioId)
          .maybeSingle();
      isFollowing = followRes != null;

    } catch (e) {
      debugPrint('Error cargando perfil de tienda: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleFollow(String comercioId) async {
    isActionLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;

      if (isFollowing) {
        await _supabase
            .from('seguidores_comercios')
            .delete()
            .eq('usuario_id', userId)
            .eq('comercio_id', comercioId);
        isFollowing = false;
      } else {
        await _supabase.from('seguidores_comercios').insert({
          'usuario_id': userId,
          'comercio_id': comercioId,
        });
        isFollowing = true;
      }
    } catch (e) {
      debugPrint('Error al seguir/dejar de seguir: $e');
    } finally {
      isActionLoading = false;
      notifyListeners();
    }
  }
}
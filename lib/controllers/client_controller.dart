import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../services/local_storage_service.dart'; // <-- IMPORTANTE

class ClientController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoadingOffers = true;
  bool isOfflineMode = false; // <-- NUEVA VARIABLE
  List<dynamic> offers = [];
  List<String> userPreferences = []; 

  ClientController() {
    loadOffers();
  }

  Future<void> loadOffers() async {
    isLoadingOffers = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;

      final prefsRes = await _supabase
          .from('preferencias_usuario')
          .select('categoria')
          .eq('usuario_id', userId);
      
      userPreferences = prefsRes.map<String>((p) => p['categoria'].toString()).toList();

      var query = _supabase.from('ofertas').select('*').eq('estado', 'Activa');
      
      if (userPreferences.isNotEmpty) {
        query = query.inFilter('categoria', userPreferences);
      }

      final response = await query
          .order('fecha_inicio', ascending: false)
          .limit(10); // Aumenté un poco el límite para tener más caché
          
      offers = response;
      isOfflineMode = false;

      // GUARDAR EN CACHÉ
      await LocalStorageService.saveOffers(offers);

    } catch (e) {
      debugPrint('Error de red, cargando desde caché: $e');
      
      // LEER DE CACHÉ SI FALLA
      offers = await LocalStorageService.getCachedOffers();
      isOfflineMode = true;
    } finally {
      isLoadingOffers = false;
      notifyListeners();
    }
  }
}
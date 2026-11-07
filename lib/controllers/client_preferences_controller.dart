import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientPreferencesController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<String> selectedCategories = [];
  
  final List<String> availableCategories = [
    'Alimentos y Bebidas', 'Tecnología', 'Ropa y Calzado', 
    'Salud y Belleza', 'Hogar y Ferretería', 'Supermercado', 
    'Farmacia', 'Servicios', 'Otros'
  ];

  ClientPreferencesController() {
    loadPreferences();
  }

  Future<void> loadPreferences() async {
    isLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      final response = await _supabase
          .from('preferencias_usuario')
          .select('categoria')
          .eq('usuario_id', userId);

      selectedCategories = response.map<String>((p) => p['categoria'].toString()).toList();
    } catch (e) {
      debugPrint('Error cargando preferencias: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> togglePreference(String category) async {
    final userId = _supabase.auth.currentUser!.id;
    final isSelected = selectedCategories.contains(category);

    // Actualización optimista (para que la UI responda rápido)
    if (isSelected) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }
    notifyListeners();

    try {
      if (isSelected) {
        await _supabase.from('preferencias_usuario').delete()
            .eq('usuario_id', userId)
            .eq('categoria', category);
      } else {
        await _supabase.from('preferencias_usuario').insert({
          'usuario_id': userId,
          'categoria': category,
        });
      }
    } catch (e) {
      debugPrint('Error guardando preferencia: $e');
      // Revertir en caso de error
      if (isSelected) {
        selectedCategories.add(category);
      } else {
        selectedCategories.remove(category);
      }
      notifyListeners();
    }
  }

  // --- SIMULACIÓN DE ALERTA FOMO (PRUEBA DE PUSH) ---
  Future<bool> simularAlertaFomo() async {
    try {
      final userId = _supabase.auth.currentUser!.id;
      
      // 1. Obtener el email del usuario
      final userData = await _supabase.from('usuarios').select('email').eq('id', userId).single();
      final email = userData['email'];
      
      if (email == null) return false;

      // 2. Invocar la Edge Function de Push con el mensaje de FOMO
      await _supabase.functions.invoke('send-push', body: {
        'target_email': email,
        'title': '🚨 ¡Oferta Relámpago cerca de ti!',
        'body': 'A 500 metros de tu ubicación hay una oferta de Pañales Huggies con 30% OFF. ¡Quedan pocas unidades!',
        'data': {'ruta': '/all_offers'}
      });
      
      return true;
    } catch (e) {
      debugPrint('Error simulando alerta: $e');
      return false;
    }
  }
}
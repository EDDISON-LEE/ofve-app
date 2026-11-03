import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AnimalRequestsController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> requests = [];
  String? errorMessage;

  AnimalRequestsController() {
    loadRequests();
  }

  Future<void> loadRequests() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      final response = await _supabase
          .from('solicitudes_animales')
          .select('*, ofertas(producto_nombre, imagen_url)')
          .eq('usuario_id', userId)
          .order('fecha_solicitud', ascending: false);
      requests = response;
    } catch (e) {
      debugPrint('Error cargando solicitudes de animales: $e');
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
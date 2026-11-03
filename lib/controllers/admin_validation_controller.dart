import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminValidationController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;
  
  bool isLoading = true;
  List<dynamic> comerciosPendientes = [];

  AdminValidationController() {
    loadComercios();
  }

  Future<void> loadComercios() async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await _supabase.from('comercios').select('*').eq('estatus_verificacion', 'En Revision');
      comerciosPendientes = response;
    } catch (e) {
      debugPrint('Error cargando comercios: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> actualizarEstado(String comercioId, String nuevoEstado) async {
    try {
      await _supabase.from('comercios').update({'estatus_verificacion': nuevoEstado}).eq('id', comercioId);
      await loadComercios(); // Recargar la lista
    } catch (e) {
      debugPrint('Error actualizando estado: $e');
    }
  }
}
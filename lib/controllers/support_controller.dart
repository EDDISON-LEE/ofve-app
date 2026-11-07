import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupportController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;
  bool isLoading = true;
  List<dynamic> tickets = [];

  SupportController() {
    loadTickets();
  }

  Future<void> loadTickets() async {
    isLoading = true;
    notifyListeners();
    try {
      final userId = _supabase.auth.currentUser!.id;
      final response = await _supabase
          .from('tickets_soporte')
          .select('*')
          .eq('usuario_id', userId)
          .order('fecha_creacion', ascending: false);
      tickets = response;
    } catch (e) {
      debugPrint('Error cargando tickets: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> createTicket(String asunto, String mensaje) async {
    try {
      final userId = _supabase.auth.currentUser!.id;
      await _supabase.from('tickets_soporte').insert({
        'usuario_id': userId,
        'asunto': asunto,
        'mensaje': mensaje,
        'estado': 'Abierto',
      });
      await loadTickets();
      return true;
    } catch (e) {
      debugPrint('Error creando ticket: $e');
      return false;
    }
  }
}
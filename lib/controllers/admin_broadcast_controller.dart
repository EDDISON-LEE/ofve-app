import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminBroadcastController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  bool isSending = false;
  List<dynamic> announcements = [];
  String? errorMessage;

  AdminBroadcastController() {
    loadAnnouncements();
  }

  Future<void> loadAnnouncements() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _supabase
          .from('anuncios_globales')
          .select('*')
          .order('fecha_creacion', ascending: false);
      announcements = response;
    } catch (e) {
      debugPrint('Error cargando anuncios: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> sendAnnouncement(String title, String message) async {
    if (title.trim().isEmpty || message.trim().isEmpty) {
      errorMessage = 'El título y el mensaje no pueden estar vacíos.';
      notifyListeners();
      return false;
    }

    isSending = true;
    errorMessage = null;
    notifyListeners();

    try {
      await _supabase.from('anuncios_globales').insert({
        'titulo': title.trim(),
        'mensaje': message.trim(),
        'activo': true,
      });
      
      await loadAnnouncements();
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isSending = false;
      notifyListeners();
    }
  }

  Future<void> toggleAnnouncementStatus(String id, bool currentStatus) async {
    try {
      await _supabase.from('anuncios_globales').update({
        'activo': !currentStatus
      }).eq('id', id);
      
      await loadAnnouncements();
    } catch (e) {
      debugPrint('Error al cambiar estado del anuncio: $e');
    }
  }
}
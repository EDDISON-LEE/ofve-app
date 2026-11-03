import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientAnnouncementsController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> announcements = [];
  int unreadCount = 0;

  ClientAnnouncementsController() {
    loadAnnouncements();
  }

  Future<void> loadAnnouncements() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _supabase
          .from('anuncios_globales')
          .select('*')
          .eq('activo', true)
          .order('fecha_creacion', ascending: false);

      announcements = response;
      // Simulamos un contador de "no leídos" basado en la cantidad de anuncios
      unreadCount = announcements.length; 
    } catch (e) {
      debugPrint('Error cargando anuncios para el cliente: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void markAsRead() {
    unreadCount = 0;
    notifyListeners();
  }
}
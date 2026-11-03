import 'dart:async';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotificationsController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;
  
  StreamSubscription<List<Map<String, dynamic>>>? _subscription;
  List<Map<String, dynamic>> notifications = [];
  int unreadCount = 0;

  NotificationsController() {
    _initRealtime();
  }

  void _initRealtime() {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return;

    // Escuchar en tiempo real los cambios en la tabla
    _subscription = _supabase
        .from('notificaciones')
        .stream(primaryKey: ['id'])
        .eq('usuario_id', userId)
        .order('created_at')
        .listen((data) {
      notifications = data;
      unreadCount = notifications.where((n) => n['leida'] == false).length;
      notifyListeners();
    });
  }

  Future<void> markAsRead(String id) async {
    try {
      await _supabase.from('notificaciones').update({'leida': true}).eq('id', id);
    } catch (e) {
      debugPrint('Error marcando notificación como leída: $e');
    }
  }

  Future<void> markAllAsRead() async {
    try {
      final userId = _supabase.auth.currentUser!.id;
      await _supabase.from('notificaciones').update({'leida': true}).eq('usuario_id', userId).eq('leida', false);
    } catch (e) {
      debugPrint('Error marcando todas como leídas: $e');
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
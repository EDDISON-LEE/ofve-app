import 'package:flutter/foundation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotificationService {
  final _supabase = Supabase.instance.client;
  final _fcm = FirebaseMessaging.instance;

  // 1. Solicitar permisos y obtener el token
  Future<void> initialize() async {
    if (kIsWeb) return; // En Web no lo usaremos por ahora

    // Pedir permiso al usuario (iOS y Android 13+)
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('✅ El usuario aceptó las notificaciones.');

      // Obtener el token del dispositivo
      String? token = await _fcm.getToken();
      if (token != null) {
        await saveTokenToSupabase(token);
      }

      // Escuchar si el token cambia (ej. al reinstalar la app)
      _fcm.onTokenRefresh.listen((newToken) {
        saveTokenToSupabase(newToken);
      });
    } else {
      debugPrint('⚠️ El usuario rechazó las notificaciones.');
    }
  }

  // 2. Guardar el token en Supabase asociado al usuario
  Future<void> saveTokenToSupabase(String token) async {
    try {
      final user = _supabase.auth.currentUser;
      if (user == null) return;

      // Guardamos el token en la tabla user_devices
      // Usamos upsert para que si el usuario abre la app en otro celular, se actualice
      await _supabase.from('user_devices').upsert({
        'usuario_id': user.id,
        'fcm_token': token,
        'plataforma': defaultTargetPlatform.name, // 'android' o 'ios'
        'fecha_actualizacion': DateTime.now().toIso8601String(),
      }, onConflict: 'fcm_token'); // Si el token ya existe, lo actualiza
      
      debugPrint('✅ Token FCM guardado en Supabase.');
    } catch (e) {
      debugPrint('⚠️ Error guardando token FCM: $e');
    }
  }
}
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  String role = 'user';
  String userName = 'Usuario';
  String userEmail = '';
  String storeName = 'Mi Comercio';
  String planName = 'Básico';
  String category = 'Sin categoría';
  int puntos = 0; // <-- Inicializado en 0

  UserController() {
    loadUserData();
  }

  Future<void> loadUserData() async {
    isLoading = true;
    notifyListeners();

    final user = _supabase.auth.currentUser;
    if (user != null) {
      String detectedRole = 'user';

      try {
        await _supabase.auth.refreshSession();
        // Traemos tanto el rol como los puntos reales
        final dbUser = await _supabase
            .from('usuarios')
            .select('rol, puntos_acumulados')
            .eq('id', user.id)
            .single();
        
        detectedRole = dbUser['rol'] ?? 'user';
        puntos = dbUser['puntos_acumulados'] ?? 0;
      } catch (e) {
        debugPrint('Error consultando rol/puntos: $e');
        detectedRole = user.appMetadata['rol'] ?? user.userMetadata?['rol'] ?? 'user';
      }

      role = detectedRole;
      userName = user.userMetadata?['nombre']?.toString().toUpperCase() ?? 'USUARIO';
      userEmail = user.email ?? '';

      if (role == 'merchant') {
        try {
          var comercio = await _supabase
              .from('comercios')
              .select('nombre_comercial, categoria, planes_suscripcion(nombre)')
              .eq('usuario_id', user.id)
              .maybeSingle();

          if (comercio != null) {
            storeName = comercio['nombre_comercial'] ?? 'Mi Comercio';
            planName = comercio['planes_suscripcion']?['nombre'] ?? 'Básico';
            category = comercio['categoria'] ?? 'Sin categoría';
          }
        } catch (e) {
          debugPrint('Error al cargar comercio: $e');
        }
      }
    }
    
    isLoading = false;
    notifyListeners();
  }
}
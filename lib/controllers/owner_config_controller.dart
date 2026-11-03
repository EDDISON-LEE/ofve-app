import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OwnerConfigController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  String? errorMessage;

  // Variables de estado
  bool iaGlobalActiva = true;
  bool poolsActivos = true;
  bool appEnMantenimiento = false;
  bool soporteActivo = true;
  bool notificacionesActivas = true;

  OwnerConfigController() {
    loadConfig();
  }

  Future<void> loadConfig() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await _supabase
          .from('configuracion_global')
          .select('*')
          .eq('id', 1)
          .single();

      iaGlobalActiva = response['ia_global_activa'] ?? true;
      poolsActivos = response['pools_activos'] ?? true;
      appEnMantenimiento = response['app_en_mantenimiento'] ?? false;
      soporteActivo = response['soporte_activo'] ?? true;
      notificacionesActivas = response['notificaciones_activas'] ?? true;
    } catch (e) {
      debugPrint('Error cargando configuración global: $e');
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleConfig(String column, bool value) async {
    try {
      // Actualizamos la base de datos
      await _supabase
          .from('configuracion_global')
          .update({column: value})
          .eq('id', 1);

      // Actualizamos el estado local
      if (column == 'ia_global_activa') iaGlobalActiva = value;
      if (column == 'pools_activos') poolsActivos = value;
      if (column == 'app_en_mantenimiento') appEnMantenimiento = value;
      if (column == 'soporte_activo') soporteActivo = value;
      if (column == 'notificaciones_activas') notificacionesActivas = value;

      notifyListeners();
    } catch (e) {
      debugPrint('Error al cambiar configuración: $e');
      errorMessage = e.toString();
      notifyListeners();
    }
  }
}
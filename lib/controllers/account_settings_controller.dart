import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AccountSettingsController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  bool isSaving = false;
  String? errorMessage;
  String? successMessage;

  // Datos del usuario
  String email = '';
  String nombre = '';
  String telefono = '';
  String rol = 'user';
  String tipoPlan = 'Básico';
  int puntos = 0;

  AccountSettingsController() {
    loadUserData();
  }

  Future<void> loadUserData() async {
    isLoading = true;
    notifyListeners();

    try {
      final user = _supabase.auth.currentUser;
      if (user == null) throw Exception('No hay sesión activa');

      email = user.email ?? '';

      final response = await _supabase
          .from('usuarios')
          .select('nombre, telefono, rol, tipo_plan, puntos_acumulados')
          .eq('id', user.id)
          .single();

      nombre = response['nombre'] ?? '';
      telefono = response['telefono'] ?? '';
      rol = response['rol'] ?? 'user';
      tipoPlan = response['tipo_plan'] ?? 'Básico';
      puntos = response['puntos_acumulados'] ?? 0;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> updateProfile({required String newName, required String newPhone}) async {
    isSaving = true;
    errorMessage = null;
    successMessage = null;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;

      await _supabase.from('usuarios').update({
        'nombre': newName.trim(),
        'telefono': newPhone.trim(),
      }).eq('id', userId);

      // Actualizar también en los metadatos del Auth
      await _supabase.auth.updateUser(
        UserAttributes(data: {'nombre': newName.trim()}),
      );

      nombre = newName.trim();
      telefono = newPhone.trim();
      successMessage = 'Perfil actualizado correctamente.';
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isSaving = false;
      notifyListeners();
    }
  }

  Future<bool> changePassword(String newPassword) async {
    isSaving = true;
    errorMessage = null;
    successMessage = null;
    notifyListeners();

    try {
      await _supabase.auth.updateUser(
        UserAttributes(password: newPassword),
      );
      successMessage = 'Contraseña actualizada correctamente.';
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isSaving = false;
      notifyListeners();
    }
  }

  Future<bool> deleteAccount() async {
    try {
      // En producción, esto debería hacerse via Edge Function con service_role
      // Por ahora, solo cerramos sesión
      await _supabase.auth.signOut();
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    }
  }
}
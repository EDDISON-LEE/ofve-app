import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminUsersController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> allUsers = [];
  List<dynamic> filteredUsers = [];
  String searchQuery = '';

  AdminUsersController() {
    loadUsers();
  }

  Future<void> loadUsers() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _supabase
          .from('usuarios')
          .select('id, nombre, email, rol, estado_cuenta, estado_baneado')
          .order('fecha_creacion', ascending: false);
      
      allUsers = response;
      _applyFilter();
    } catch (e) {
      debugPrint('Error cargando usuarios: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void search(String query) {
    searchQuery = query.toLowerCase();
    _applyFilter();
    notifyListeners();
  }

  void _applyFilter() {
    if (searchQuery.isEmpty) {
      filteredUsers = allUsers;
    } else {
      filteredUsers = allUsers.where((u) {
        final name = (u['nombre'] ?? '').toString().toLowerCase();
        final email = (u['email'] ?? '').toString().toLowerCase();
        return name.contains(searchQuery) || email.contains(searchQuery);
      }).toList();
    }
  }

  Future<void> toggleUserBan(String userId, bool currentStatus) async {
    try {
      final newStatus = !currentStatus;
      await _supabase.from('usuarios').update({
        'estado_baneado': newStatus,
        'estado_cuenta': newStatus ? 'Suspendido' : 'Activo',
      }).eq('id', userId);

      // Actualizamos la lista localmente para evitar recargar toda la pantalla
      final index = allUsers.indexWhere((u) => u['id'] == userId);
      if (index != -1) {
        allUsers[index]['estado_baneado'] = newStatus;
        allUsers[index]['estado_cuenta'] = newStatus ? 'Suspendido' : 'Activo';
        _applyFilter();
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error al banear/desbanear usuario: $e');
    }
  }
}
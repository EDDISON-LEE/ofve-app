import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthController extends ChangeNotifier {
  final AuthService _authService = AuthService();
  
  bool isLoading = false;
  String? errorMessage;

  Future<bool> login(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      await _authService.login(email, password);
      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> register({
    required String email,
    required String password,
    required String role,
    required String name,
    required bool isAdult,
    String? storeName,
    String? rif,
    String? referidoPor, // <-- NUEVO PARÁMETRO
  }) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      await _authService.register(
        email: email, 
        password: password, 
        role: role, 
        name: name, 
        isAdult: isAdult, 
        storeName: storeName, 
        rif: rif,
        referidoPor: referidoPor, // <-- LO PASAMOS AL SERVICIO
      );
      
      await _authService.logout();
      
      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> resetPassword(String email) async {
    isLoading = true;
    notifyListeners();
    try {
      await _authService.resetPassword(email);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }
}
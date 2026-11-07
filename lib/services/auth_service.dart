import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String _redirectUrl = 'https://fluffy-journey-qvrq7pgv5gxcxxq7-8080.app.github.dev/';

  Future<AuthResponse> login(String email, String password) async {
    return await _supabase.auth.signInWithPassword(email: email, password: password);
  }

  Future<AuthResponse> register({
    required String email,
    required String password,
    required String role,
    required String name,
    required bool isAdult,
    String? storeName,
    String? rif,
    String? referidoPor, // <-- NUEVO PARÁMETRO
  }) async {
    return await _supabase.auth.signUp(
      email: email,
      password: password,
      emailRedirectTo: _redirectUrl,
      data: {
        'nombre': role == 'merchant' ? storeName : name,
        'rol': role,
        'mayor_de_edad': isAdult,
        'referido_por_codigo': referidoPor, // <-- LO GUARDAMOS EN LOS METADATOS
      },
    );
  }

  Future<void> resetPassword(String email) async {
    await _supabase.auth.resetPasswordForEmail(email, redirectTo: _redirectUrl);
  }

  Future<void> logout() async {
    await _supabase.auth.signOut();
  }
}
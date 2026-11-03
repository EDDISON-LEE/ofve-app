import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;

    return StreamBuilder<AuthState>(
      stream: supabase.auth.onAuthStateChange,
      builder: (context, snapshot) {
        // Evaluamos si hay una sesión activa
        final session = snapshot.data?.session ?? supabase.auth.currentSession;

        if (session == null) {
          // Si no hay sesión (o acabamos de hacer signOut), muestra el Login
          return const LoginScreen();
        }

        // Si hay sesión, va al Home
        return const HomeScreen();
      },
    );
  }
}
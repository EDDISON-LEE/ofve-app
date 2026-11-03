import 'dart:async';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'config.dart';
import 'auth_gate.dart';
import 'screens/update_password_screen.dart';

// Llave global para navegar desde el listener de autenticación
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    
    // Vital para que el enlace del correo funcione en Web
    usePathUrlStrategy(); 

    await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);

    await SentryFlutter.init(
      (options) {
        options.dsn = 'https://9760817470fff8d5e02c3109fcb785af@o4512309844836353.ingest.us.sentry.io/4512309897134080';
        options.tracesSampleRate = 1.0;
      },
      appRunner: () => runApp(const OfVeApp()),
    );
  }, (error, stackTrace) {
    Sentry.captureException(error, stackTrace: stackTrace);
  });
}

class OfVeApp extends StatefulWidget {
  const OfVeApp({super.key});

  @override
  State<OfVeApp> createState() => _OfVeAppState();
}

class _OfVeAppState extends State<OfVeApp> {
  @override
  void initState() {
    super.initState();
    _setupAuthListener();
  }

  void _setupAuthListener() {
    Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      final event = data.event;

      // Si el usuario llega desde el enlace del correo, abrimos la pantalla de cambio
      if (event == AuthChangeEvent.passwordRecovery) {
        navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const UpdatePasswordScreen()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OfVe',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F3FF),
        primaryColor: const Color(0xFF6B4EFF),
        fontFamily: 'Roboto',
      ),
      home: const AuthGate(),
    );
  }
}
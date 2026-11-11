import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb, kDebugMode;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'services/notification_service.dart';
import 'services/sync_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

import 'config.dart';
import 'auth_gate.dart';
import 'screens/update_password_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  // Evitamos que un error detenga la app antes de mostrar algo en pantalla
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // 1. Firebase (Blindado)
    if (!kIsWeb) {
      try {
        await Firebase.initializeApp();
        await FirebaseAppCheck.instance.activate(
          androidProvider: kDebugMode ? AndroidProvider.debug : AndroidProvider.playIntegrity,
          appleProvider: kDebugMode ? AppleProvider.debug : AppleProvider.deviceCheck,
        );
        await NotificationService().initialize();
      } catch (e) {
        debugPrint('⚠️ Error inicializando Firebase: $e');
      }
    } 

    // 2. Supabase (Blindado con try/catch)
    try {
      await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
    } catch (e) {
      debugPrint('⚠️ Error inicializando Supabase: $e');
      // Si Supabase falla, igual mostramos la app para que veas el Login y el error.
    }

    // 3. Sentry (Blindado)
    try {
      await SentryFlutter.init(
        (options) {
          options.dsn = 'https://9760817470fff8d5e02c3109fcb785af@o4512309844836353.ingest.us.sentry.io/4512309897134080';
          options.tracesSampleRate = 1.0;
        },
        appRunner: () => runApp(const OfVeApp()),
      );
    } catch (e) {
      debugPrint('⚠️ Error inicializando Sentry: $e');
      runApp(const OfVeApp()); // Arrancamos la app aunque Sentry falle
    }
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
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _setupAuthListener();
    _setupConnectivityListener();
  }

  void _setupAuthListener() {
    Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      if (data.event == AuthChangeEvent.passwordRecovery) {
        navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const UpdatePasswordScreen()),
          (route) => false,
        );
      }
    });
  }

  void _setupConnectivityListener() {
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
      if (!result.contains(ConnectivityResult.none)) {
        SyncService.syncPendingScans();
      }
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
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
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'config.dart';
import 'auth_gate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
  
  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://9760817470fff8d5e02c3109fcb785af@o4512309844836353.ingest.us.sentry.io/4512309897134080'; 
      options.tracesSampleRate = 1.0; 
    },
    appRunner: () => runApp(const OfVeApp()),
  );
}

class OfVeApp extends StatelessWidget {
  const OfVeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OfVe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F3FF),
        primaryColor: const Color(0xFF6B4EFF),
        fontFamily: 'Roboto',
      ),
      home: const AuthGate(),
    );
  }
}import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'config.dart';
import 'auth_gate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
  
  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://9760817470fff8d5e02c3109fcb785af@o4512309844836353.ingest.us.sentry.io/4512309897134080'; 
      options.tracesSampleRate = 1.0; 
    },
    appRunner: () => runApp(const OfVeApp()),
  );
}

class OfVeApp extends StatelessWidget {
  const OfVeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OfVe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F3FF),
        primaryColor: const Color(0xFF6B4EFF),
        fontFamily: 'Roboto',
      ),
      home: const AuthGate(),
    );
  }
}
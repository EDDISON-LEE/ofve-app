import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';

class BannedScreen extends StatefulWidget {
  const BannedScreen({super.key});

  @override
  State<BannedScreen> createState() => _BannedScreenState();
}

class _BannedScreenState extends State<BannedScreen> {
  final _supabase = Supabase.instance.client;
  final _appealController = TextEditingController();
  bool _isLoading = true;
  Map<String, dynamic>? _sancion;

  @override
  void initState() {
    super.initState();
    _loadSancion();
  }

  Future<void> _loadSancion() async {
    try {
      final userId = _supabase.auth.currentUser!.id;
      final response = await _supabase
          .from('sanciones')
          .select('*')
          .eq('usuario_id', userId)
          .eq('estado', 'Activa')
          .order('fecha_inicio', ascending: false)
          .limit(1)
          .maybeSingle();
      
      setState(() => _sancion = response);
    } catch (e) {
      debugPrint('Error cargando sanción: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _enviarApelacion() async {
    if (_appealController.text.trim().isEmpty) return;

    setState(() => _isLoading = true);
    try {
      await _supabase.from('sanciones').update({
        'apelacion_texto': _appealController.text.trim(),
        'apelacion_estado': 'Pendiente',
        'fecha_apelacion': DateTime.now().toIso8601String(),
      }).eq('id', _sancion!['id']);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Apelación enviada. Un administrador la revisará pronto.'), backgroundColor: AppColors.success));
        _loadSancion();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error al enviar apelación: $e'), backgroundColor: AppColors.error));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator(color: AppColors.error)));
    }

    return Scaffold(
      backgroundColor: AppColors.bgTop,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.gavel, size: 100, color: AppColors.error),
              const SizedBox(height: 20),
              const Text('Cuenta Suspendida', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.error)),
              const SizedBox(height: 16),
              Text(
                _sancion?['motivo'] ?? 'Tu cuenta ha sido suspendida por violar nuestras políticas de moderación.',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: AppColors.textDark),
              ),
              const SizedBox(height: 30),

              if (_sancion != null && _sancion!['apelacion_estado'] == 'Pendiente') ...[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                  child: const Text('Tu apelación está en revisión. Te notificaremos pronto.', textAlign: TextAlign.center, style: TextStyle(color: AppColors.warning, fontWeight: FontWeight.bold)),
                ),
              ] else if (_sancion != null && _sancion!['apelacion_estado'] != 'Aprobada') ...[
                const Text('¿Crees que es un error? Puedes apelar aquí:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                TextField(
                  controller: _appealController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: 'Explica por qué crees que tu cuenta debería ser reactivada...',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryPurple),
                    onPressed: _enviarApelacion,
                    child: const Text('Enviar Apelación', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],

              const SizedBox(height: 30),
              TextButton.icon(
                onPressed: () => _supabase.auth.signOut(),
                icon: const Icon(Icons.logout, color: Colors.grey),
                label: const Text('Cerrar Sesión', style: TextStyle(color: Colors.grey)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
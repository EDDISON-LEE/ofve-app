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
  bool _isSending = false;
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
      
      if (mounted) setState(() => _sancion = response);
    } catch (e) {
      debugPrint('Error cargando sanción: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _enviarApelacion() async {
    if (_appealController.text.trim().isEmpty) return;

    setState(() => _isSending = true);
    try {
      // 1. Guardar apelación
      await _supabase.from('sanciones').update({
        'apelacion_texto': _appealController.text.trim(),
        'apelacion_estado': 'Pendiente',
        'fecha_apelacion': DateTime.now().toIso8601String(),
      }).eq('id', _sancion!['id']);

      // 2. Notificar a Admins y Owners
      try {
        final admins = await _supabase.from('usuarios').select('email').inFilter('rol', ['admin', 'owner']);
        for (var admin in admins) {
          if (admin['email'] != null) {
            await _supabase.functions.invoke('send-push', body: {
              'target_email': admin['email'],
              'title': '⚖️ Nueva Apelación de Baneo',
              'body': 'Un usuario ha enviado una apelación. Revisa el panel de moderación.',
              'data': {'ruta': '/admin_moderation'}
            });
          }
        }
      } catch (e) {
        debugPrint('⚠️ Error notificando a admins: $e');
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Apelación enviada. Un administrador la revisará pronto.'), backgroundColor: AppColors.success));
        _loadSancion(); // Recargar para cambiar la vista a "En revisión"
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error al enviar apelación: $e'), backgroundColor: AppColors.error));
      }
    } finally {
      if (mounted) setState(() => _isSending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator(color: AppColors.error)));
    }

    final isPending = _sancion != null && _sancion!['apelacion_estado'] == 'Pendiente';
    final isRejected = _sancion != null && _sancion!['apelacion_estado'] == 'Rechazada';

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

              // --- ESTADOS DE LA APELACIÓN ---
              if (isPending) ...[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.1), borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.warning)),
                  child: const Column(
                    children: [
                      Icon(Icons.hourglass_top, color: AppColors.warning, size: 30),
                      SizedBox(height: 8),
                      Text('Apelación en Revisión', style: TextStyle(color: AppColors.warning, fontWeight: FontWeight.bold, fontSize: 16)),
                      SizedBox(height: 4),
                      Text('Nuestro equipo está evaluando tu caso. Te notificaremos la decisión pronto.', textAlign: TextAlign.center, style: TextStyle(fontSize: 13)),
                    ],
                  ),
                ),
              ] else if (isRejected) ...[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: AppColors.error.withOpacity(0.1), borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.error)),
                  child: const Column(
                    children: [
                      Icon(Icons.cancel, color: AppColors.error, size: 30),
                      SizedBox(height: 8),
                      Text('Apelación Rechazada', style: TextStyle(color: AppColors.error, fontWeight: FontWeight.bold, fontSize: 16)),
                      SizedBox(height: 4),
                      Text('Tu cuenta permanecerá suspendida por el momento.', textAlign: TextAlign.center, style: TextStyle(fontSize: 13)),
                    ],
                  ),
                ),
              ] else ...[
                // FORMULARIO DE APELACIÓN
                const Text('¿Crees que es un error? Cuéntanos tu caso:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                    onPressed: _isSending ? null : _enviarApelacion,
                    child: _isSending 
                        ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                        : const Text('Enviar Apelación', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
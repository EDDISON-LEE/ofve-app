import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart'; // <-- NUEVO
import '../core/theme/app_theme.dart'; // <-- NUEVO

class LocationAlertController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;
  bool _isChecking = false;

  Future<void> checkProximityAlerts(BuildContext context) async {
    if (_isChecking) return;
    _isChecking = true;

    try {
      // 1. Obtener ubicación actual
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        _isChecking = false;
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(accuracy: LocationAccuracy.low),
      );

      final userId = _supabase.auth.currentUser!.id;

      // 2. NUEVO: Verificar si está cerca de un comercio con su planificación
      final planesRes = await _supabase.rpc('obtener_planes_cerca', params: {
        'p_usuario_id': userId,
        'p_lat': position.latitude,
        'p_lng': position.longitude,
      });

      if (planesRes != null && (planesRes as List).isNotEmpty) {
        final alerta = planesRes.first;
        if (context.mounted) {
          _mostrarAlertaPlan(context, alerta['nombre_comercio'], alerta['latitud'], alerta['longitud']);
        }
        _isChecking = false;
        return; // Si muestra la de plan, no muestra la de validación
      }

      // 3. Consultar compras pendientes de validar
      final comprasRes = await _supabase.rpc('obtener_compras_pendientes_cerca', params: {
        'p_usuario_id': userId,
        'p_lat': position.latitude,
        'p_lng': position.longitude,
      });

      if (comprasRes != null && (comprasRes as List).isNotEmpty) {
        final alerta = comprasRes.first;
        if (context.mounted) {
          _mostrarAlertaValidacion(context, alerta['nombre_comercio'], alerta['pendientes']);
        }
      }
    } catch (e) {
      debugPrint('Error verificando proximidad: $e');
    } finally {
      _isChecking = false;
    }
  }

  // --- NUEVO: Alerta para Planes de Compra ---
  void _mostrarAlertaPlan(BuildContext context, String comercio, double lat, double lng) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppColors.info.withValues(alpha: 0.1), shape: BoxShape.circle),
              child: const Icon(Icons.navigation, color: AppColors.info, size: 40),
            ),
            const SizedBox(height: 16),
            const Text('¡Estás cerca de tu plan!', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ],
        ),
        content: Text(
          'Estás cerca de $comercio, donde tienes productos de tu planificación al mejor precio. ¿Deseas ir ahora?',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Ignorar', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.info),
            onPressed: () async {
              Navigator.pop(ctx);
              // Abrir Google Maps en modo Ruta
              final url = Uri.parse('https://www.google.com/maps/dir/?api=1&destination=$lat,$lng&travelmode=driving');
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              }
            },
            icon: const Icon(Icons.map, color: Colors.white),
            label: const Text('Ir con Google Maps', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _mostrarAlertaValidacion(BuildContext context, String comercio, int cantidad) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppColors.primaryPurple.withValues(alpha: 0.1), shape: BoxShape.circle),
              child: const Icon(Icons.location_on, color: AppColors.primaryPurple, size: 40),
            ),
            const SizedBox(height: 16),
            const Text('¡Estás cerca!', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ],
        ),
        content: Text(
          'Estás cerca de $comercio. Tienes $cantidad oferta(s) pendiente(s) por validar aquí.',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Ignorar', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryPurple),
            onPressed: () {
              Navigator.pop(ctx);
              // Aquí podrías navegar a la pantalla de validación o compras
              // Navigator.push(context, MaterialPageRoute(builder: (_) => const ClientValidationScreen()));
            },
            child: const Text('Ver mis compras', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
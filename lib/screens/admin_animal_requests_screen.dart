import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';

class AdminAnimalRequestsScreen extends StatefulWidget {
  const AdminAnimalRequestsScreen({super.key});

  @override
  State<AdminAnimalRequestsScreen> createState() => _AdminAnimalRequestsScreenState();
}

class _AdminAnimalRequestsScreenState extends State<AdminAnimalRequestsScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _requests = [];

  @override
  void initState() {
    super.initState();
    _loadRequests();
  }

  Future<void> _loadRequests() async {
    setState(() => _isLoading = true);
    try {
      final response = await _supabase
          .from('solicitudes_animales')
          .select('*, usuarios(nombre, email)')
          .eq('estado', 'Pendiente')
          .order('fecha_solicitud', ascending: false);
      setState(() => _requests = response);
    } catch (e) {
      debugPrint('Error cargando solicitudes de animales: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _processRequest(String id, String userId, bool approve) async {
    try {
      await _supabase.from('solicitudes_animales').update({
        'estado': approve ? 'Aprobado' : 'Rechazado',
        'fecha_respuesta': DateTime.now().toIso8601String(),
      }).eq('id', id);
      
      _loadRequests();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(approve ? 'Solicitud aprobada' : 'Solicitud rechazada'), backgroundColor: approve ? AppColors.success : AppColors.error)
        );
      }
    } catch (e) {
      debugPrint('Error procesando solicitud: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgTop,
      appBar: AppBar(title: const Text('Solicitudes de Animales')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
          : _requests.isEmpty
              ? const Center(child: Text('No hay solicitudes pendientes.'))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _requests.length,
                  itemBuilder: (context, index) {
                    final req = _requests[index];
                    final user = req['usuarios'];

                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Solicitud de: ${user['nombre']}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            Text('Animal: ${req['nombre_animal']}', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            Text('Descripción: ${req['descripcion_venta']}'),
                            const Divider(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OutlinedButton(
                                  onPressed: () => _processRequest(req['id'], user['id'], false),
                                  style: OutlinedButton.styleFrom(foregroundColor: AppColors.error),
                                  child: const Text('Rechazar'),
                                ),
                                const SizedBox(width: 12),
                                ElevatedButton(
                                  onPressed: () => _processRequest(req['id'], user['id'], true),
                                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.success),
                                  child: const Text('Aprobar'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
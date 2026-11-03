import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';

class OwnerManualPaymentsScreen extends StatefulWidget {
  const OwnerManualPaymentsScreen({super.key});

  @override
  State<OwnerManualPaymentsScreen> createState() => _OwnerManualPaymentsScreenState();
}

class _OwnerManualPaymentsScreenState extends State<OwnerManualPaymentsScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _pendingRequests = [];

  @override
  void initState() {
    super.initState();
    _loadRequests();
  }

  Future<void> _loadRequests() async {
    setState(() => _isLoading = true);
    try {
      final response = await _supabase
          .from('solicitudes_suscripcion')
          .select('*, usuarios(nombre, email)')
          .eq('estado_verificacion', 'Manual')
          .order('fecha_solicitud', ascending: false);
      setState(() => _pendingRequests = response);
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _processRequest(String requestId, String userId, String planName, bool approve) async {
    try {
      if (approve) {
        await _supabase.from('usuarios').update({'tipo_plan': planName}).eq('id', userId);
      }
      await _supabase.from('solicitudes_suscripcion').update({
        'estado_verificacion': approve ? 'Aprobado' : 'Rechazado',
        'fecha_respuesta': DateTime.now().toIso8601String(),
      }).eq('id', requestId);
      
      _loadRequests();
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(approve ? 'Pago aprobado' : 'Pago rechazado'), backgroundColor: approve ? AppColors.success : AppColors.error));
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgTop,
      appBar: AppBar(title: const Text('Revisión de Pagos Manuales')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
          : _pendingRequests.isEmpty
              ? const Center(child: Text('No hay pagos pendientes de revisión manual.'))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _pendingRequests.length,
                  itemBuilder: (context, index) {
                    final req = _pendingRequests[index];
                    final user = req['usuarios'];
                    final isCash = req['metodo_pago'] == 'Efectivo';

                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user['nombre'] ?? 'Usuario', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            Text(user['email'] ?? '', style: const TextStyle(color: Colors.grey)),
                            const Divider(),
                            Text('Plan: ${req['plan_solicitado']} | Monto: \$${req['monto']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                            Text('Método: ${req['metodo_pago']} | Ref: ${req['referencia'] ?? 'N/A'}'),
                            if (req['comprobante_url'] != null) ...[
                              const SizedBox(height: 8),
                              TextButton.icon(
                                onPressed: () {
                                  // Abrir la imagen del comprobante en el navegador
                                  // launchUrl(Uri.parse(req['comprobante_url']));
                                },
                                icon: const Icon(Icons.receipt_long, color: AppColors.primaryPurple),
                                label: const Text('Ver Comprobante'),
                              ),
                            ],
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OutlinedButton(
                                  onPressed: () => _processRequest(req['id'], req['usuario_id'], req['plan_solicitado'], false),
                                  style: OutlinedButton.styleFrom(foregroundColor: AppColors.error),
                                  child: const Text('Rechazar'),
                                ),
                                const SizedBox(width: 12),
                                ElevatedButton(
                                  onPressed: () => _processRequest(req['id'], req['usuario_id'], req['plan_solicitado'], true),
                                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.success),
                                  child: const Text('Aprobar Pago'),
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
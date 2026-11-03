import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';

class ClientPaymentHistoryScreen extends StatefulWidget {
  const ClientPaymentHistoryScreen({super.key});

  @override
  State<ClientPaymentHistoryScreen> createState() => _ClientPaymentHistoryScreenState();
}

class _ClientPaymentHistoryScreenState extends State<ClientPaymentHistoryScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _solicitudes = [];

  @override
  void initState() {
    super.initState();
    _loadSolicitudes();
  }

  Future<void> _loadSolicitudes() async {
    setState(() => _isLoading = true);
    try {
      final userId = _supabase.auth.currentUser!.id;
      final response = await _supabase
          .from('solicitudes_suscripcion')
          .select('*')
          .eq('usuario_id', userId)
          .order('fecha_solicitud', ascending: false);
      
      setState(() => _solicitudes = response);
    } catch (e) {
      debugPrint('Error cargando historial de pagos: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgTop,
      appBar: AppBar(title: const Text('Mis Pagos y Suscripciones')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
          : _solicitudes.isEmpty
              ? const Center(child: Text('No tienes solicitudes de pago registradas.', style: TextStyle(color: Colors.grey)))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _solicitudes.length,
                  itemBuilder: (context, index) {
                    final sol = _solicitudes[index];
                    final fecha = DateTime.parse(sol['fecha_solicitud']).toLocal();
                    final fechaStr = DateFormat('dd/MM/yyyy HH:mm').format(fecha);
                    
                    Color statusColor;
                    String statusText;
                    switch (sol['estado_verificacion']) {
                      case 'Aprobado':
                        statusColor = AppColors.success;
                        statusText = 'APROBADO';
                        break;
                      case 'Rechazado':
                        statusColor = AppColors.error;
                        statusText = 'RECHAZADO';
                        break;
                      case 'Automatico':
                        statusColor = AppColors.info;
                        statusText = 'VERIFICADO AUTO';
                        break;
                      default:
                        statusColor = AppColors.warning;
                        statusText = 'PENDIENTE';
                    }

                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        leading: CircleAvatar(
                          backgroundColor: statusColor.withOpacity(0.1),
                          child: Icon(Icons.receipt_long, color: statusColor),
                        ),
                        title: Text('Plan: ${sol['plan_solicitado']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),
                            Text('Monto: \$${sol['monto']} | Ref: ${sol['referencia'] ?? 'N/A'}'),
                            Text(fechaStr, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                            if (sol['motivo_rechazo'] != null)
                              Text('Motivo: ${sol['motivo_rechazo']}', style: const TextStyle(color: AppColors.error, fontSize: 12)),
                          ],
                        ),
                        trailing: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(color: statusColor.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                          child: Text(statusText, style: TextStyle(color: statusColor, fontSize: 10, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
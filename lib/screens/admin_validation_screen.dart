import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/theme/app_theme.dart';
import '../controllers/admin_validation_controller.dart';

class AdminValidationScreen extends StatefulWidget {
  const AdminValidationScreen({super.key});

  @override
  State<AdminValidationScreen> createState() => _AdminValidationScreenState();
}

class _AdminValidationScreenState extends State<AdminValidationScreen> {
  final _validationController = AdminValidationController();
  final _supabase = Supabase.instance.client;

  Future<void> _verDocumento(String? path) async {
    if (path == null || path.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No hay documento subido.')));
      return;
    }

    try {
      final signedUrl = await _supabase.storage.from('documentos_comercios').createSignedUrl(path, 60);
      final uri = Uri.parse(signedUrl);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw Exception('No se pudo abrir el documento');
      }
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e'), backgroundColor: AppColors.error));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _validationController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Validación de Comercios')),
          body: _validationController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : _validationController.comerciosPendientes.isEmpty
                  ? const Center(child: Text('No hay comercios pendientes por revisar.'))
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _validationController.comerciosPendientes.length,
                      itemBuilder: (context, index) {
                        final comercio = _validationController.comerciosPendientes[index];
                        final nombre = comercio['nombre_comercial'] ?? 'Sin nombre';
                        final rif = comercio['rif'] ?? 'Sin RIF';
                        final iaData = comercio['validacion_ia'] as Map<String, dynamic>?;
                        final iaFallo = iaData != null && iaData['exitoso'] == false;
                        
                        return Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(nombre, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Text('RIF: $rif', style: const TextStyle(color: Colors.grey)),
                                const Divider(height: 24),
                                
                                if (iaFallo) ...[
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(color: AppColors.warning.withValues(alpha: 0.1), border: Border.all(color: AppColors.warning), borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.warning_amber_rounded, color: AppColors.warning),
                                        const SizedBox(width: 8),
                                        Expanded(child: Text('Alerta de IA: ${iaData['motivo'] ?? 'Requiere revisión manual'}', style: const TextStyle(color: AppColors.warning, fontSize: 13, fontWeight: FontWeight.w500))),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                ] else if (iaData != null && iaData['exitoso'] == true) ...[
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(color: AppColors.success.withValues(alpha: 0.1), border: Border.all(color: AppColors.success), borderRadius: BorderRadius.circular(8)),
                                    child: const Row(
                                      children: [
                                        Icon(Icons.check_circle, color: AppColors.success),
                                        SizedBox(width: 8),
                                        Expanded(child: Text('IA: Documentos válidos. Aprobación automática recomendada.', style: TextStyle(color: AppColors.success, fontSize: 13, fontWeight: FontWeight.w500))),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                ],

                                const Text('Documentos:', style: TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(height: 8),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: [
                                    _buildDocButton('Ver RIF', comercio['doc_rif_url']),
                                    _buildDocButton('Ver Legal', comercio['doc_constitutivo_url']),
                                    _buildDocButton('Ver Cédulas', comercio['doc_cedulas_url']),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    OutlinedButton(
                                      onPressed: () => _validationController.actualizarEstado(comercio['id'], 'Rechazado'),
                                      style: OutlinedButton.styleFrom(foregroundColor: AppColors.error),
                                      child: const Text('Rechazar'),
                                    ),
                                    const SizedBox(width: 12),
                                    ElevatedButton(
                                      onPressed: () => _validationController.actualizarEstado(comercio['id'], 'Aprobado'),
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
      },
    );
  }

  Widget _buildDocButton(String label, String? path) {
    return ActionChip(
      avatar: const Icon(Icons.picture_as_pdf, color: AppColors.error, size: 18),
      label: Text(label),
      onPressed: () => _verDocumento(path),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminValidationScreen extends StatefulWidget {
  const AdminValidationScreen({super.key});

  @override
  State<AdminValidationScreen> createState() => _AdminValidationScreenState();
}

class _AdminValidationScreenState extends State<AdminValidationScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _comerciosPendientes = [];

  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

  @override
  void initState() {
    super.initState();
    _loadComercios();
  }

  Future<void> _loadComercios() async {
    setState(() => _isLoading = true);
    try {
      final response = await _supabase
          .from('comercios')
          .select('*')
          .eq('estatus_verificacion', 'En Revision');
      setState(() => _comerciosPendientes = response);
    } catch (e) {
      debugPrint('Error cargando comercios: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _verDocumento(String? path) async {
    if (path == null || path.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No hay documento subido para esta categoría.')),
      );
      return;
    }

    try {
      final signedUrl = await _supabase.storage
          .from('documentos_comercios')
          .createSignedUrl(path, 60);

      final uri = Uri.parse(signedUrl);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw Exception('No se pudo abrir el documento');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al abrir documento: $e')),
        );
      }
    }
  }

  Future<void> _actualizarEstado(String comercioId, String nuevoEstado) async {
    setState(() => _isLoading = true);
    try {
      await _supabase.from('comercios').update({
        'estatus_verificacion': nuevoEstado
      }).eq('id', comercioId);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Comercio marcado como: $nuevoEstado'), backgroundColor: Colors.green),
        );
      }
      _loadComercios();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al actualizar: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Validación de Comercios', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: primaryPurple))
          : _comerciosPendientes.isEmpty
              ? const Center(child: Text('No hay comercios pendientes por revisar.'))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _comerciosPendientes.length,
                  itemBuilder: (context, index) {
                    final comercio = _comerciosPendientes[index];
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
                            
                            // SECCIÓN DE ANÁLISIS DE IA
                            if (iaFallo) ...[
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.orange.withOpacity(0.1),
                                  border: Border.all(color: Colors.orange),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.warning_amber_rounded, color: Colors.orange),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        'Alerta de IA: ${iaData['motivo'] ?? 'Requiere revisión manual'}',
                                        style: const TextStyle(color: Colors.orange, fontSize: 13, fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                            ] else if (iaData != null && iaData['exitoso'] == true) ...[
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.1),
                                  border: Border.all(color: Colors.green),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(Icons.check_circle, color: Colors.green),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        'IA: Documentos válidos. Aprobación automática recomendada.',
                                        style: TextStyle(color: Colors.green, fontSize: 13, fontWeight: FontWeight.w500),
                                      ),
                                    ),
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
                                  onPressed: () => _actualizarEstado(comercio['id'], 'Rechazado'),
                                  style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
                                  child: const Text('Rechazar'),
                                ),
                                const SizedBox(width: 12),
                                ElevatedButton(
                                  onPressed: () => _actualizarEstado(comercio['id'], 'Aprobado'),
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                  child: const Text('Aprobar', style: TextStyle(color: Colors.white)),
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

  Widget _buildDocButton(String label, String? path) {
    return ActionChip(
      avatar: const Icon(Icons.picture_as_pdf, color: Colors.red, size: 18),
      label: Text(label),
      onPressed: () => _verDocumento(path),
    );
  }
}
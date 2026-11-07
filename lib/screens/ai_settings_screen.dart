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

  // Paleta de colores oficial
  final Color primaryPurple = const Color(0xFF7C5DFE);
  final Color bgTop = const Color(0xFFECE2FC);
  final Color darkCardColor = const Color(0xFF252152);

  @override
  void initState() {
    super.initState();
    _loadComercios();
  }

  Future<void> _loadComercios() async {
    setState(() => _isLoading = true);
    try {
      // Solo traemos los que están "En Revision"
      final response = await _supabase
          .from('comercios')
          .select('*')
          .eq('estatus_verificacion', 'En Revision');
      setState(() => _comerciosPendientes = response);
    } catch (e) {
      debugPrint('Error cargando comercios: $e');
      _showErrorSnack('Error al cargar lista: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showErrorSnack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  void _showSuccessSnack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );
  }

  Future<void> _verDocumento(String? path, String tipoDocumento) async {
    if (path == null || path.isEmpty) {
      _showErrorSnack('El comercio no subió el documento: $tipoDocumento');
      return;
    }

    try {
      // Generamos URL firmada de 60 segundos por seguridad
      final signedUrl = await _supabase.storage
          .from('documentos_comercios')
          .createSignedUrl(path, 60);

      final uri = Uri.parse(signedUrl);
      // Abrimos en navegador externo o visor de PDF del sistema
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw Exception('No se pudo abrir el enlace del documento');
      }
    } catch (e) {
      _showErrorSnack('Error al abrir documento: $e');
    }
  }

  Future<void> _confirmarAccion(String comercioId, String nombre, String nuevoEstado) async {
    final bool? confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(nuevoEstado == 'Aprobado' ? '¿Aprobar Comercio?' : '¿Rechazar Comercio?'),
        content: Text('Estás a punto de marcar a "$nombre" como "$nuevoEstado". Esta acción notificará al comercio.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: nuevoEstado == 'Aprobado' ? Colors.green : Colors.red,
            ),
            onPressed: () => Navigator.pop(ctx, true),
            child: Text('Sí, $nuevoEstado', style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await _actualizarEstado(comercioId, nuevoEstado);
    }
  }

  Future<void> _actualizarEstado(String comercioId, String nuevoEstado) async {
    try {
      await _supabase.from('comercios').update({
        'estatus_verificacion': nuevoEstado
      }).eq('id', comercioId);
      
      _showSuccessSnack('Comercio $nuevoEstado exitosamente.');
      _loadComercios(); // Recargar lista
    } catch (e) {
      _showErrorSnack('Error al actualizar: $e');
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
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.black),
            tooltip: 'Actualizar Lista',
            onPressed: _loadComercios,
          )
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: primaryPurple))
          : _comerciosPendientes.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle_outline, size: 80, color: Colors.green[300]),
                      const SizedBox(height: 16),
                      const Text('¡Todo al día!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      const Text('No hay comercios pendientes por revisar.', style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _comerciosPendientes.length,
                  itemBuilder: (context, index) {
                    final comercio = _comerciosPendientes[index];
                    final nombre = comercio['nombre_comercial'] ?? 'Sin nombre';
                    final rif = comercio['rif'] ?? 'Sin RIF';
                    final categoria = comercio['categoria'] ?? 'Sin categoría';
                    final tipo = comercio['tipo_comercio']?.toString().toUpperCase() ?? 'NO DEFINIDO';
                    
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Cabecera del Comercio
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(nombre, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(color: primaryPurple.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
                                  child: Text(tipo, style: TextStyle(color: primaryPurple, fontSize: 10, fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text('RIF: $rif', style: const TextStyle(color: Colors.black54, fontSize: 13)),
                            Text('Categoría: $categoria', style: const TextStyle(color: Colors.black54, fontSize: 13)),
                            
                            const Divider(height: 24),
                            
                            // Botones de Documentos
                            const Text('Documentos Legales:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                _buildDocChip('RIF', comercio['doc_rif_url']),
                                _buildDocChip('Acta/Registro', comercio['doc_constitutivo_url']),
                                _buildDocChip('Cédulas', comercio['doc_cedulas_url']),
                              ],
                            ),
                            
                            const SizedBox(height: 20),
                            
                            // Botones de Acción
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OutlinedButton.icon(
                                  onPressed: () => _confirmarAccion(comercio['id'], nombre, 'Rechazado'),
                                  icon: const Icon(Icons.close, size: 18),
                                  label: const Text('Rechazar'),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.red,
                                    side: const BorderSide(color: Colors.red),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                ElevatedButton.icon(
                                  onPressed: () => _confirmarAccion(comercio['id'], nombre, 'Aprobado'),
                                  icon: const Icon(Icons.check, size: 18),
                                  label: const Text('Aprobar'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                  ),
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

  // Chip para abrir el documento
  Widget _buildDocChip(String label, String? path) {
    final hasDoc = path != null && path.isNotEmpty;
    return ActionChip(
      avatar: Icon(
        hasDoc ? Icons.picture_as_pdf : Icons.warning_amber_rounded, 
        color: hasDoc ? Colors.red : Colors.orange, 
        size: 18
      ),
      label: Text(
        hasDoc ? label : '$label (Falta)',
        style: TextStyle(color: hasDoc ? Colors.black87 : Colors.orange),
      ),
      backgroundColor: hasDoc ? Colors.red.withValues(alpha: 0.05) : Colors.orange.withValues(alpha: 0.1),
      onPressed: () => _verDocumento(path, label),
    );
  }
}
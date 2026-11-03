import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminModerationScreen extends StatefulWidget {
  const AdminModerationScreen({super.key});

  @override
  State<AdminModerationScreen> createState() => _AdminModerationScreenState();
}

class _AdminModerationScreenState extends State<AdminModerationScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _reportes = [];
  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

  @override
  void initState() {
    super.initState();
    _loadReportes();
  }

  Future<void> _loadReportes() async {
    setState(() => _isLoading = true);
    try {
      final response = await _supabase
          .from('reportes_moderacion')
          .select('*, reportante:reportante_id(nombre), reportado:reportado_id(nombre)')
          .eq('estado', 'Pendiente')
          .order('fecha', ascending: false);
      setState(() => _reportes = response);
    } catch (e) {
      debugPrint('Error cargando reportes: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _resolverReporte(String reporteId, String decision) async {
    try {
      await _supabase.from('reportes_moderacion').update({'estado': 'Resuelto', 'decision_admin': decision}).eq('id', reporteId);
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Reporte resuelto: $decision'), backgroundColor: Colors.green));
      _loadReportes();
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(title: const Text('Moderación de Reportes', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.black)),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: primaryPurple))
          : _reportes.isEmpty
              ? const Center(child: Text('No hay reportes pendientes. ¡Todo limpio!'))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _reportes.length,
                  itemBuilder: (context, index) {
                    final reporte = _reportes[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [const Icon(Icons.warning_amber_rounded, color: Colors.red), const SizedBox(width: 8), Text(reporte['motivo'].toString().toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red))]),
                            const Divider(height: 24),
                            Text('Reportante: ${reporte['reportante']?['nombre'] ?? 'Anónimo'}'),
                            Text('Reportado: ${reporte['reportado']?['nombre'] ?? 'Desconocido'}'),
                            const SizedBox(height: 12),
                            Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)), child: Text('"${reporte['descripcion']}"', style: const TextStyle(fontStyle: FontStyle.italic))),
                            const SizedBox(height: 16),
                            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                              OutlinedButton(onPressed: () => _resolverReporte(reporte['id'], 'Descartado'), child: const Text('Descartar')),
                              const SizedBox(width: 12),
                              ElevatedButton(onPressed: () => _resolverReporte(reporte['id'], 'Sancionado'), style: ElevatedButton.styleFrom(backgroundColor: Colors.red), child: const Text('Sancionar', style: TextStyle(color: Colors.white))),
                            ])
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
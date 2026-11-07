import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';

class AdminModerationScreen extends StatefulWidget {
  const AdminModerationScreen({super.key});

  @override
  State<AdminModerationScreen> createState() => _AdminModerationScreenState();
}

class _AdminModerationScreenState extends State<AdminModerationScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _reportes = [];
  List<dynamic> _apelaciones = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      // 1. Cargar Reportes
      final resReportes = await _supabase
          .from('reportes_moderacion')
          .select('*, reportante:reportante_id(nombre), reportado:reportado_id(nombre)')
          .eq('estado', 'Pendiente')
          .order('fecha', ascending: false);

      // 2. Cargar Apelaciones
      final resApelaciones = await _supabase
          .from('sanciones')
          .select('*, usuarios(nombre, email)')
          .eq('apelacion_estado', 'Pendiente')
          .order('fecha_apelacion', ascending: false);

      setState(() {
        _reportes = resReportes;
        _apelaciones = resApelaciones;
      });
    } catch (e) {
      debugPrint('Error cargando moderación: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _resolverReporte(String reporteId, String decision) async {
    try {
      await _supabase.from('reportes_moderacion').update({
        'estado': 'Resuelto',
        'decision_admin': decision
      }).eq('id', reporteId);
      
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Reporte resuelto: $decision'), backgroundColor: AppColors.success));
      _loadData();
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e'), backgroundColor: AppColors.error));
    }
  }

  Future<void> _resolverApelacion(String sancionId, String usuarioId, bool aprobar) async {
    try {
      if (aprobar) {
        // Levantar baneo
        await _supabase.from('usuarios').update({'estado_baneado': false}).eq('id', usuarioId);
        await _supabase.from('sanciones').update({'estado': 'Revocada', 'apelacion_estado': 'Aprobada'}).eq('id', sancionId);
      } else {
        // Mantener baneo
        await _supabase.from('sanciones').update({'apelacion_estado': 'Rechazada'}).eq('id', sancionId);
      }
      _loadData();
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Apelación procesada.'), backgroundColor: AppColors.success));
    } catch (e) {
      debugPrint('Error procesando apelación: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.bgTop,
        appBar: AppBar(
          title: const Text('Moderación y Sanciones', style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColors.textDark),
          actions: [IconButton(icon: const Icon(Icons.refresh, color: AppColors.textDark), onPressed: _loadData)],
          bottom: const TabBar(
            indicatorColor: AppColors.primaryPurple,
            labelColor: AppColors.primaryPurple,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Reportes', icon: Icon(Icons.report)),
              Tab(text: 'Apelaciones', icon: Icon(Icons.gavel)),
            ],
          ),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
            : TabBarView(
                children: [
                  _buildReportesTab(),
                  _buildApelacionesTab(),
                ],
              ),
      ),
    );
  }

  Widget _buildReportesTab() {
    if (_reportes.isEmpty) return const Center(child: Text('No hay reportes pendientes. ¡Todo limpio!'));
    
    return ListView.builder(
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
                Row(children: [const Icon(Icons.warning_amber_rounded, color: AppColors.error), const SizedBox(width: 8), Text(reporte['motivo'].toString().toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.error))]),
                const Divider(height: 24),
                Text('Reportante: ${reporte['reportante']?['nombre'] ?? 'Anónimo'}'),
                Text('Reportado: ${reporte['reportado']?['nombre'] ?? 'Desconocido'}'),
                const SizedBox(height: 12),
                Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)), child: Text('"${reporte['descripcion']}"', style: const TextStyle(fontStyle: FontStyle.italic))),
                const SizedBox(height: 16),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  OutlinedButton(onPressed: () => _resolverReporte(reporte['id'], 'Descartado'), child: const Text('Descartar')),
                  const SizedBox(width: 12),
                  ElevatedButton(onPressed: () => _resolverReporte(reporte['id'], 'Sancionado'), style: ElevatedButton.styleFrom(backgroundColor: AppColors.error), child: const Text('Sancionar', style: TextStyle(color: Colors.white))),
                ])
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildApelacionesTab() {
    if (_apelaciones.isEmpty) return const Center(child: Text('No hay apelaciones pendientes.'));

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _apelaciones.length,
      itemBuilder: (context, index) {
        final a = _apelaciones[index];
        final user = a['usuarios'];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Usuario: ${user['nombre']} (${user['email']})', style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('Motivo original: ${a['motivo']}', style: const TextStyle(color: AppColors.error, fontSize: 13)),
                const Divider(),
                const Text('Apelación del usuario:', style: TextStyle(fontWeight: FontWeight.w600)),
                Text('"${a['apelacion_texto']}"', style: const TextStyle(fontStyle: FontStyle.italic)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () => _resolverApelacion(a['id'], user['id'], false),
                      child: const Text('Mantener Baneo', style: TextStyle(color: AppColors.error)),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.success),
                      onPressed: () => _resolverApelacion(a['id'], user['id'], true),
                      child: const Text('Aprobar y Reactivar', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
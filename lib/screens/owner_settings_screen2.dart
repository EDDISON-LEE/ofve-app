import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OwnerSettingsScreen extends StatefulWidget {
  const OwnerSettingsScreen({super.key});

  @override
  State<OwnerSettingsScreen> createState() => _OwnerSettingsScreenState();
}

class _OwnerSettingsScreenState extends State<OwnerSettingsScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _features = [];

  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

  @override
  void initState() {
    super.initState();
    _loadFeatures();
  }

  Future<void> _loadFeatures() async {
    setState(() => _isLoading = true);
    try {
      // Leemos la tabla que ya tenías en tu esquema
      final response = await _supabase.from('configuracion_features').select('*').order('id');
      
      // Si la tabla está vacía, insertamos las features por defecto para que el Owner las vea
      if (response.isEmpty) {
        await _supabase.from('configuracion_features').insert([
          {'nombre_feature': 'Asistente IA', 'estado_global': true},
          {'nombre_feature': 'Publicación por Voz', 'estado_global': true},
          {'nombre_feature': 'Pools Comunitarios', 'estado_global': true},
          {'nombre_feature': 'Módulo de Cupones', 'estado_global': true},
          {'nombre_feature': 'Delivery y Chasqui', 'estado_global': true},
        ]);
        _loadFeatures(); // Recargar
        return;
      }
      
      setState(() => _features = response);
    } catch (e) {
      debugPrint('Error cargando features: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _toggleFeature(int id, bool currentState) async {
    try {
      await _supabase.from('configuracion_features').update({
        'estado_global': !currentState
      }).eq('id', id);
      
      _loadFeatures();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cambiar estado: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Configuración Global', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: primaryPurple))
          : Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    'Activa o desactiva módulos enteros de la aplicación para todos los usuarios. Útil para mantenimiento o lanzamientos por fases.',
                    style: TextStyle(fontSize: 13, color: Colors.black87),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _features.length,
                    itemBuilder: (context, index) {
                      final feature = _features[index];
                      final isActive = feature['estado_global'] ?? true;

                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: SwitchListTile(
                          title: Text(feature['nombre_feature'] ?? 'Módulo', style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(isActive ? 'Activo en la App' : 'Desactivado'),
                          value: isActive,
                          activeColor: primaryPurple,
                          onChanged: (val) => _toggleFeature(feature['id'], isActive),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
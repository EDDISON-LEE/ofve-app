import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';

class OwnerSettingsScreen extends StatefulWidget {
  const OwnerSettingsScreen({super.key});

  @override
  State<OwnerSettingsScreen> createState() => _OwnerSettingsScreenState();
}

class _OwnerSettingsScreenState extends State<OwnerSettingsScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _features = [];

  @override
  void initState() {
    super.initState();
    _loadFeatures();
  }

  Future<void> _loadFeatures() async {
    setState(() => _isLoading = true);
    try {
      final response = await _supabase.from('configuracion_features').select('*').order('id');
      
      if (response.isEmpty) {
        await _supabase.from('configuracion_features').insert([
          {'nombre_feature': 'Asistente IA', 'estado_global': true},
          {'nombre_feature': 'Publicación por Voz', 'estado_global': true},
          {'nombre_feature': 'Pools Comunitarios', 'estado_global': true},
          {'nombre_feature': 'Módulo de Cupones', 'estado_global': true},
          {'nombre_feature': 'Delivery y Chasqui', 'estado_global': true},
        ]);
        _loadFeatures();
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
          SnackBar(content: Text('Error al cambiar estado: $e'), backgroundColor: AppColors.error),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgTop,
      appBar: AppBar(
        title: const Text('Configuración Global', style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold)),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
          : Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    'Activa o desactiva módulos enteros de la aplicación para todos los usuarios. Útil para mantenimiento o lanzamientos por fases.',
                    style: TextStyle(fontSize: 13, color: AppColors.textDark),
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
                          activeColor: AppColors.primaryPurple,
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
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/admin_zones_controller.dart';

class AdminZonesScreen extends StatefulWidget {
  const AdminZonesScreen({super.key});

  @override
  State<AdminZonesScreen> createState() => _AdminZonesScreenState();
}

class _AdminZonesScreenState extends State<AdminZonesScreen> {
  final _zonesController = AdminZonesController();
  final _estadoCtrl = TextEditingController();
  final _municipioCtrl = TextEditingController();
  final _parroquiaCtrl = TextEditingController();

  @override
  void dispose() {
    _estadoCtrl.dispose();
    _municipioCtrl.dispose();
    _parroquiaCtrl.dispose();
    super.dispose();
  }

  void _mostrarDialogoAgregar() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Nueva Zona Geográfica'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _estadoCtrl,
                decoration: const InputDecoration(labelText: 'Estado', prefixIcon: Icon(Icons.map)),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _municipioCtrl,
                decoration: const InputDecoration(labelText: 'Municipio', prefixIcon: Icon(Icons.location_city)),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _parroquiaCtrl,
                decoration: const InputDecoration(labelText: 'Parroquia', prefixIcon: Icon(Icons.location_on)),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () async {
              if (_estadoCtrl.text.isEmpty || _municipioCtrl.text.isEmpty || _parroquiaCtrl.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Todos los campos son obligatorios'), backgroundColor: AppColors.error));
                return;
              }
              final success = await _zonesController.addZone(
                estado: _estadoCtrl.text,
                municipio: _municipioCtrl.text,
                parroquia: _parroquiaCtrl.text,
              );
              if (ctx.mounted) {
                Navigator.pop(ctx);                
                _estadoCtrl.clear();
                _municipioCtrl.clear();
                _parroquiaCtrl.clear();
                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Zona agregada'), backgroundColor: AppColors.success));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_zonesController.errorMessage ?? 'Error al agregar'), backgroundColor: AppColors.error));
                }
              }
            },
            child: const Text('Agregar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _zonesController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Gestión de Zonas')),
          floatingActionButton: FloatingActionButton(
            onPressed: _mostrarDialogoAgregar,
            backgroundColor: AppColors.primaryPurple,
            child: const Icon(Icons.add, color: AppColors.white),
          ),
          body: _zonesController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : _zonesController.zones.isEmpty
                  ? const Center(child: Text('No hay zonas registradas.', style: TextStyle(color: Colors.grey)))
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _zonesController.zones.length,
                      itemBuilder: (context, index) {
                        final zone = _zonesController.zones[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: AppColors.primaryPurple.withOpacity(0.1),
                              child: const Icon(Icons.map, color: AppColors.primaryPurple),
                            ),
                            title: Text('${zone['parroquia']}, ${zone['municipio']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(zone['estado'], style: const TextStyle(color: Colors.grey)),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: AppColors.error),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: const Text('Eliminar Zona'),
                                    content: Text('¿Estás seguro de eliminar la zona "${zone['parroquia']}"?'),
                                    actions: [
                                      TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
                                        onPressed: () {
                                          Navigator.pop(ctx);
                                          _zonesController.deleteZone(zone['id']);
                                        },
                                        child: const Text('Eliminar'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
        );
      },
    );
  }
}
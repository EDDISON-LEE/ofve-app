import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'owner_assign_plan_screen.dart';

class OwnerPlansManagementScreen extends StatefulWidget {
  const OwnerPlansManagementScreen({super.key});

  @override
  State<OwnerPlansManagementScreen> createState() => _OwnerPlansManagementScreenState();
}

class _OwnerPlansManagementScreenState extends State<OwnerPlansManagementScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _planes = [];

  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

  @override
  void initState() {
    super.initState();
    _loadPlanes();
  }

  Future<void> _loadPlanes() async {
    setState(() => _isLoading = true);
    try {
      final response = await _supabase
          .from('planes_suscripcion')
          .select('*, plan_caracteristicas(*)')
          .order('precio', ascending: true);
      setState(() => _planes = response);
    } catch (e) {
      debugPrint('Error cargando planes: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _editarPrecio(String planId, String nombre, double precioActual) async {
    final ctrl = TextEditingController(text: precioActual.toString());
    final nuevoPrecio = await showDialog<double>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Editar Precio: $nombre'),
        content: TextField(
          controller: ctrl,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(labelText: 'Precio en USD', prefixIcon: Icon(Icons.attach_money)),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, double.tryParse(ctrl.text)),
            child: const Text('Guardar'),
          ),
        ],
      ),
    );

    if (nuevoPrecio != null) {
      await _supabase.from('planes_suscripcion').update({'precio': nuevoPrecio}).eq('id', planId);
      _loadPlanes();
    }
  }

  Future<void> _agregarCaracteristica(String planId) async {
    final ctrl = TextEditingController();
    final nueva = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Agregar Característica'),
        content: TextField(controller: ctrl, decoration: const InputDecoration(labelText: 'Ej: Ofertas Ilimitadas')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, ctrl.text.trim()),
            child: const Text('Agregar'),
          ),
        ],
      ),
    );

    if (nueva != null && nueva.isNotEmpty) {
      await _supabase.from('plan_caracteristicas').insert({'plan_id': planId, 'nombre_caracteristica': nueva});
      _loadPlanes();
    }
  }

  Future<void> _eliminarCaracteristica(String featureId) async {
    await _supabase.from('plan_caracteristicas').delete().eq('id', featureId);
    _loadPlanes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Gestión de Planes', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add, color: Colors.black),
            tooltip: 'Asignar Plan a Comercio',
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OwnerAssignPlanScreen())),
          )
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: primaryPurple))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _planes.length,
              itemBuilder: (context, index) {
                final plan = _planes[index];
                final features = plan['plan_caracteristicas'] as List<dynamic>;

                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: ExpansionTile(
                    title: Text(plan['nombre'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    subtitle: Text('\$${plan['precio']} USD / mes', style: TextStyle(color: primaryPurple, fontWeight: FontWeight.bold)),
                    leading: CircleAvatar(
                      backgroundColor: primaryPurple.withOpacity(0.1),
                      child: Icon(Icons.workspace_premium, color: primaryPurple),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () => _editarPrecio(plan['id'], plan['nombre'], (plan['precio'] as num).toDouble()),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Características Incluidas:', style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            ...features.map((f) => ListTile(
                              dense: true,
                              leading: const Icon(Icons.check_circle, color: Colors.green, size: 20),
                              title: Text(f['nombre_caracteristica']),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                                onPressed: () => _eliminarCaracteristica(f['id']),
                              ),
                            )),
                            TextButton.icon(
                              onPressed: () => _agregarCaracteristica(plan['id']),
                              icon: const Icon(Icons.add),
                              label: const Text('Agregar Característica'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
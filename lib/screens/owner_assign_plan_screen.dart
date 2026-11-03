import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';

class OwnerAssignPlanScreen extends StatefulWidget {
  const OwnerAssignPlanScreen({super.key});

  @override
  State<OwnerAssignPlanScreen> createState() => _OwnerAssignPlanScreenState();
}

class _OwnerAssignPlanScreenState extends State<OwnerAssignPlanScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _comercios = [];
  List<dynamic> _planes = [];

  String? _comercioSeleccionado;
  String? _planSeleccionado;
  bool _esLibre = false;
  int _mesesGracia = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final comerciosRes = await _supabase.from('comercios').select('id, nombre_comercial');
      final planesRes = await _supabase.from('planes_suscripcion').select('*');
      setState(() {
        _comercios = comerciosRes;
        _planes = planesRes;
      });
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _asignarPlan() async {
    if (_comercioSeleccionado == null || _planSeleccionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Selecciona un comercio y un plan.'), backgroundColor: AppColors.error));
      return;
    }

    setState(() => _isLoading = true);
    try {
      final ahora = DateTime.now();
      final fechaExpiracion = DateTime(ahora.year, ahora.month + 1 + _mesesGracia, ahora.day);

      await _supabase.from('comercios').update({
        'plan_id': _planSeleccionado!,
        'es_plan_libre': _esLibre,
        'meses_gracia': _mesesGracia,
        'fecha_expiracion': fechaExpiracion.toIso8601String(),
      }).eq('id', _comercioSeleccionado!);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('¡Plan asignado con éxito!'), backgroundColor: AppColors.success));
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e'), backgroundColor: AppColors.error));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgTop,
      appBar: AppBar(title: const Text('Asignar Plan')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Seleccionar Comercio'),
                    items: _comercios.map((c) => DropdownMenuItem<String>(value: c['id'].toString(), child: Text(c['nombre_comercial'] ?? 'Sin Nombre'))).toList(),
                    onChanged: (v) => setState(() => _comercioSeleccionado = v),
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Seleccionar Plan'),
                    items: _planes.map((p) => DropdownMenuItem<String>(value: p['id'].toString(), child: Text('${p['nombre']} - \$${p['precio']}'))).toList(),
                    onChanged: (v) => setState(() => _planSeleccionado = v),
                  ),
                  const SizedBox(height: 20),
                  SwitchListTile(
                    title: const Text('Plan Libre (Gratis)', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text('Activar para comercios de labor social'),
                    value: _esLibre,
                    activeColor: AppColors.primaryPurple,
                    onChanged: (v) => setState(() => _esLibre = v),
                  ),
                  ListTile(
                    title: const Text('Meses de Gracia (Promoción)', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('$_mesesGracia meses gratis adicionales'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline, color: AppColors.error),
                          onPressed: _mesesGracia > 0 ? () => setState(() => _mesesGracia--) : null,
                        ),
                        Text('$_mesesGracia', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline, color: AppColors.success),
                          onPressed: () => setState(() => _mesesGracia++),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 55,
                    child: ElevatedButton(
                      onPressed: _asignarPlan,
                      child: const Text('Guardar Asignación'),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
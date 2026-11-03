import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  // Selecciones
  String? _comercioSeleccionado;
  String? _planSeleccionado;
  bool _esLibre = false;
  int _mesesGracia = 0;

  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

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
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Selecciona un comercio y un plan.'), backgroundColor: Colors.red));
      return;
    }

    setState(() => _isLoading = true);
    try {
      // Calculamos la fecha de expiración (hoy + 1 mes + meses de gracia)
      final ahora = DateTime.now();
      final fechaExpiracion = DateTime(ahora.year, ahora.month + 1 + _mesesGracia, ahora.day);

      // CORRECCIÓN: Se agregó el operador '!' para asegurar que no es nulo.
      await _supabase.from('comercios').update({
        'plan_id': _planSeleccionado!,
        'es_plan_libre': _esLibre,
        'meses_gracia': _mesesGracia,
        'fecha_expiracion': fechaExpiracion.toIso8601String(),
      }).eq('id', _comercioSeleccionado!);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('¡Plan asignado con éxito!'), backgroundColor: Colors.green));
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Asignar Plan', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: primaryPurple))
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 1. Seleccionar Comercio
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Seleccionar Comercio', filled: true, fillColor: Colors.white, border: OutlineInputBorder()),
                    items: _comercios.map((c) => DropdownMenuItem<String>(value: c['id'].toString(), child: Text(c['nombre_comercial'] ?? 'Sin Nombre'))).toList(),
                    onChanged: (v) => setState(() => _comercioSeleccionado = v),
                  ),
                  const SizedBox(height: 20),

                  // 2. Seleccionar Plan
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Seleccionar Plan', filled: true, fillColor: Colors.white, border: OutlineInputBorder()),
                    items: _planes.map((p) => DropdownMenuItem<String>(value: p['id'].toString(), child: Text('${p['nombre']} - \$${p['precio']}'))).toList(),
                    onChanged: (v) => setState(() => _planSeleccionado = v),
                  ),
                  const SizedBox(height: 20),

                  // 3. Plan Libre (Labor Social)
                  SwitchListTile(
                    title: const Text('Plan Libre (Gratis)', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text('Activar para comercios de labor social'),
                    value: _esLibre,
                    activeColor: primaryPurple,
                    onChanged: (v) => setState(() => _esLibre = v),
                  ),

                  // 4. Meses de Gracia
                  ListTile(
                    title: const Text('Meses de Gracia (Promoción)', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('$_mesesGracia meses gratis adicionales'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                          onPressed: _mesesGracia > 0 ? () => setState(() => _mesesGracia--) : null,
                        ),
                        Text('$_mesesGracia', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline, color: Colors.green),
                          onPressed: () => setState(() => _mesesGracia++),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),
                  SizedBox(
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: primaryPurple, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                      onPressed: _asignarPlan,
                      child: const Text('Guardar Asignación', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/owner_plans_controller.dart';
import 'owner_assign_plan_screen.dart';

class OwnerPlansManagementScreen extends StatefulWidget {
  const OwnerPlansManagementScreen({super.key});

  @override
  State<OwnerPlansManagementScreen> createState() => _OwnerPlansManagementScreenState();
}

class _OwnerPlansManagementScreenState extends State<OwnerPlansManagementScreen> {
  final _plansController = OwnerPlansController();

  // Diálogo para editar Precio
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
      await _plansController.editarPrecio(planId, nuevoPrecio);
    }
  }

  // Diálogo para editar Cuota de IA
  Future<void> _editarCuotaIA(String planId, String nombre, int cuotaActual) async {
    final ctrl = TextEditingController(text: cuotaActual.toString());
    final nuevaCuota = await showDialog<int>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Cuota IA: $nombre'),
        content: TextField(
          controller: ctrl,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Generaciones por mes', prefixIcon: Icon(Icons.auto_awesome)),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, int.tryParse(ctrl.text)),
            child: const Text('Guardar'),
          ),
        ],
      ),
    );

    if (nuevaCuota != null) {
      final plan = _plansController.planes.firstWhere((p) => p['id'] == planId);
      await _plansController.updatePlanAI(planId, plan['ia_habilitada'], nuevaCuota);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _plansController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(
            title: const Text('Gestión de Planes', style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold)),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_add, color: AppColors.textDark),
                tooltip: 'Asignar Plan a Comercio',
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OwnerAssignPlanScreen())),
              )
            ],
          ),
          body: _plansController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    // TARJETA DE CONTROL GLOBAL
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      color: AppColors.darkCardColor,
                      child: SwitchListTile(
                        title: const Text('IA Global Activada', style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold)),
                        subtitle: const Text('Interruptor maestro para toda la app', style: TextStyle(color: Colors.white70)),
                        value: _plansController.iaGlobalActiva,
                        activeColor: AppColors.success,
                        onChanged: (val) => _plansController.toggleGlobalIA(val),
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // LISTA DE PLANES
                    ..._plansController.planes.map((plan) {
                      final features = plan['plan_caracteristicas'] as List<dynamic>? ?? [];
                      final iaActiva = plan['ia_habilitada'] ?? false;
                      final cuotaIa = plan['ia_cuota_mensual'] ?? 0;
                      final isBasic = plan['nombre'].toString().toLowerCase() == 'básico' || plan['nombre'].toString().toLowerCase() == 'basico';

                      return Card(
                        margin: const EdgeInsets.only(bottom: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: ExpansionTile(
                          title: Text(plan['nombre'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          subtitle: Text('\$${plan['precio']} USD / mes', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold)),
                          leading: CircleAvatar(
                            backgroundColor: AppColors.primaryPurple.withOpacity(0.1),
                            child: const Icon(Icons.workspace_premium, color: AppColors.primaryPurple),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.edit, color: AppColors.info),
                            tooltip: 'Editar Precio',
                            onPressed: () => _editarPrecio(plan['id'], plan['nombre'], (plan['precio'] as num).toDouble()),
                          ),
                          children: [
                            const Divider(),
                            
                            // SECCIÓN DE IA DEL PLAN
                            SwitchListTile(
                              title: const Text('Habilitar IA para este plan', style: TextStyle(fontWeight: FontWeight.w600)),
                              value: iaActiva,
                              activeColor: AppColors.primaryPurple,
                              onChanged: (val) => _plansController.updatePlanAI(plan['id'], val, cuotaIa),
                            ),
                            if (iaActiva && !isBasic)
                              ListTile(
                                leading: const Icon(Icons.auto_awesome, color: Colors.amber),
                                title: const Text('Cuota Mensual de IA'),
                                subtitle: Text('$cuotaIa generaciones / mes'),
                                trailing: const Icon(Icons.edit, size: 20),
                                onTap: () => _editarCuotaIA(plan['id'], plan['nombre'], cuotaIa),
                              ),
                            const Divider(),
                            
                            // CARACTERÍSTICAS DEL PLAN
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Características Incluidas:', style: TextStyle(fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 8),
                                  ...features.map((f) => ListTile(
                                    dense: true,
                                    leading: const Icon(Icons.check_circle, color: AppColors.success, size: 20),
                                    title: Text(f['nombre_caracteristica']),
                                  )),
                                  if (features.isEmpty)
                                    const Text('No hay características registradas.', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  ],
                ),
        );
      },
    );
  }
}
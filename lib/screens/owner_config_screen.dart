import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/owner_config_controller.dart';

class OwnerConfigScreen extends StatefulWidget {
  const OwnerConfigScreen({super.key});

  @override
  State<OwnerConfigScreen> createState() => _OwnerConfigScreenState();
}

class _OwnerConfigScreenState extends State<OwnerConfigScreen> {
  final _configController = OwnerConfigController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _configController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Configuración Global')),
          body: _configController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ALERTA DE MANTENIMIENTO
                      if (_configController.appEnMantenimiento)
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 20),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.error.withOpacity(0.1),
                            border: Border.all(color: AppColors.error),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.warning_amber_rounded, color: AppColors.error, size: 30),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'La app está en MANTENIMIENTO. Ningún cliente podrá acceder hasta que desactives esta opción.',
                                  style: TextStyle(color: AppColors.error, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),

                      const Text('Módulos de la Aplicación', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),

                      // TARJETA DE CONFIGURACIÓN
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
                        ),
                        child: Column(
                          children: [
                            // 1. MANTENIMIENTO
                            SwitchListTile(
                              title: const Text('Modo Mantenimiento', style: TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: const Text('Bloquea el acceso a los clientes'),
                              value: _configController.appEnMantenimiento,
                              activeColor: AppColors.error,
                              secondary: const Icon(Icons.build_circle, color: AppColors.error),
                              onChanged: (val) => _configController.toggleConfig('app_en_mantenimiento', val),
                            ),
                            const Divider(height: 1),

                            // 2. IA GLOBAL
                            SwitchListTile(
                              title: const Text('Asistente IA', style: TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: const Text('Habilita/Deshabilita el uso de IA en toda la app'),
                              value: _configController.iaGlobalActiva,
                              activeColor: AppColors.primaryPurple,
                              secondary: const Icon(Icons.smart_toy, color: AppColors.primaryPurple),
                              onChanged: (val) => _configController.toggleConfig('ia_global_activa', val),
                            ),
                            const Divider(height: 1),

                            // 3. POOLS COMUNITARIOS
                            SwitchListTile(
                              title: const Text('Pools Comunitarios', style: TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: const Text('Permite a los usuarios unirse a compras grupales'),
                              value: _configController.poolsActivos,
                              activeColor: AppColors.primaryPurple,
                              secondary: const Icon(Icons.groups, color: AppColors.primaryPurple),
                              onChanged: (val) => _configController.toggleConfig('pools_activos', val),
                            ),
                            const Divider(height: 1),

                            // 4. SOPORTE
                            SwitchListTile(
                              title: const Text('Módulo de Soporte', style: TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: const Text('Permite a los usuarios abrir tickets de ayuda'),
                              value: _configController.soporteActivo,
                              activeColor: AppColors.primaryPurple,
                              secondary: const Icon(Icons.support_agent, color: AppColors.primaryPurple),
                              onChanged: (val) => _configController.toggleConfig('soporte_activo', val),
                            ),
                            const Divider(height: 1),

                            // 5. NOTIFICACIONES
                            SwitchListTile(
                              title: const Text('Notificaciones Push', style: TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: const Text('Habilita el envío de alertas a los usuarios'),
                              value: _configController.notificacionesActivas,
                              activeColor: AppColors.primaryPurple,
                              secondary: const Icon(Icons.notifications_active, color: AppColors.primaryPurple),
                              onChanged: (val) => _configController.toggleConfig('notificaciones_activas', val),
                            ),
                            const Divider(height: 1),

                            // 6. DELIVERY (NUEVO)
                            SwitchListTile(
                              title: const Text('Servicio de Delivery', style: TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: const Text('Permite a los clientes solicitar entrega a domicilio'),
                              value: _configController.deliveryActivo,
                              activeColor: AppColors.primaryPurple,
                              secondary: const Icon(Icons.delivery_dining, color: AppColors.primaryPurple),
                              onChanged: (val) => _configController.toggleConfig('delivery_activo', val),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 30),
                      
                      // NOTA INFORMATIVA
                      const Text(
                        'Nota: Los cambios realizados aquí se aplican en tiempo real en toda la plataforma. Úsalos con precaución.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.grey, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
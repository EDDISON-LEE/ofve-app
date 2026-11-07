import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import '../controllers/owner_audit_controller.dart';

class OwnerAuditScreen extends StatefulWidget {
  const OwnerAuditScreen({super.key});

  @override
  State<OwnerAuditScreen> createState() => _OwnerAuditScreenState();
}

class _OwnerAuditScreenState extends State<OwnerAuditScreen> {
  final _auditController = OwnerAuditController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _auditController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(
            title: const Text('Registro de Auditoría'),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh, color: AppColors.textDark),
                onPressed: _auditController.loadLogs,
              )
            ],
          ),
          body: Column(
            children: [
              // FILTROS
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _auditController.filters.length,
                    itemBuilder: (context, index) {
                      final filter = _auditController.filters[index];
                      final isSelected = _auditController.selectedFilter == filter;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                          label: Text(filter),
                          selected: isSelected,
                          onSelected: (_) => _auditController.setFilter(filter),
                          selectedColor: AppColors.primaryPurple,
                          labelStyle: TextStyle(color: isSelected ? Colors.white : AppColors.textDark, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide.none),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // TIMELINE
              Expanded(
                child: _auditController.isLoading
                    ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
                    : _auditController.logs.isEmpty
                        ? const Center(child: Text('No hay registros de auditoría aún.', style: TextStyle(color: Colors.grey)))
                        : ListView.builder(
                            padding: const EdgeInsets.all(16),
                            itemCount: _auditController.logs.length,
                            itemBuilder: (context, index) {
                              final log = _auditController.logs[index];
                              return _buildTimelineItem(log);
                            },
                          ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTimelineItem(dynamic log) {
    final fecha = DateTime.parse(log['created_at']).toLocal();
    final fechaStr = DateFormat('dd/MM/yyyy HH:mm:ss').format(fecha);
    final usuario = log['usuarios']?['nombre'] ?? 'Sistema / Desconocido';
    final rol = log['rol'] ?? 'Sistema';
    final tabla = log['tabla_afectada'] ?? 'Desconocida';
    final accion = log['accion'] ?? 'Acción Desconocida';

    // Definir icono y color según la tabla
    IconData icon = Icons.info_outline;
    Color color = AppColors.info;

    if (tabla == 'comercios') {
      icon = Icons.store;
      color = AppColors.warning;
    } else if (tabla == 'ofertas') {
      icon = Icons.local_offer;
      color = AppColors.success;
    } else if (tabla == 'solicitudes_suscripcion') {
      icon = Icons.attach_money;
      color = AppColors.primaryPurple;
    }

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // LÍNEA VERTICAL DEL TIMELINE
          Column(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                  border: Border.all(color: color, width: 2),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              Expanded(
                child: Container(
                  width: 2,
                  color: Colors.grey.withValues(alpha: 0.3),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          
          // TARJETA DE DATOS
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(accion, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.textDark)),
                          Text(fechaStr, style: const TextStyle(fontSize: 10, color: Colors.grey)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.person, size: 14, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(usuario, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(color: AppColors.primaryPurple.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(4)),
                            child: Text(rol.toUpperCase(), style: const TextStyle(color: AppColors.primaryPurple, fontSize: 9, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                      const Divider(height: 20),
                      Text('Tabla: $tabla', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      // Puedes expandir los detalles JSON aquí si lo deseas en el futuro
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import '../controllers/animal_requests_controller.dart';
import 'create_offer_screen.dart';

class MerchantAnimalRequestsScreen extends StatefulWidget {
  const MerchantAnimalRequestsScreen({super.key});

  @override
  State<MerchantAnimalRequestsScreen> createState() =>
      _MerchantAnimalRequestsScreenState();
}

class _MerchantAnimalRequestsScreenState
    extends State<MerchantAnimalRequestsScreen> {
  final _controller = AnimalRequestsController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(
            title: const Text('Solicitudes de Animales'),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh, color: AppColors.textDark),
                onPressed: _controller.loadRequests,
              )
            ],
          ),
          body: _controller.isLoading
              ? const Center(
                  child:
                      CircularProgressIndicator(color: AppColors.primaryPurple))
              : _controller.requests.isEmpty
                  ? _buildEmptyState()
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _controller.requests.length,
                      itemBuilder: (context, index) =>
                          _buildRequestCard(_controller.requests[index]),
                    ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.pets, size: 80, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No tienes solicitudes de animales.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: AppColors.textLight),
            ),
            SizedBox(height: 8),
            Text(
              'Si intentas publicar un animal que requiere aprobación, aparecerá aquí.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestCard(Map<String, dynamic> request) {
    final estado = request['estado'] ?? 'Pendiente';
    final fecha = DateTime.parse(request['fecha_solicitud']).toLocal();
    final fechaStr = DateFormat('dd/MM/yyyy HH:mm').format(fecha);

    Color statusColor;
    IconData statusIcon;
    String statusLabel;

    switch (estado) {
      case 'Aprobado':
        statusColor = AppColors.success;
        statusIcon = Icons.check_circle;
        statusLabel = 'APROBADO';
        break;
      case 'Rechazado':
        statusColor = AppColors.error;
        statusIcon = Icons.cancel;
        statusLabel = 'RECHAZADO';
        break;
      case 'Publicado':
        statusColor = AppColors.primaryPurple;
        statusIcon = Icons.sell;
        statusLabel = 'PUBLICADO';
        break;
      default:
        statusColor = AppColors.warning;
        statusIcon = Icons.hourglass_top;
        statusLabel = 'PENDIENTE';
    }

    final canPublish = estado == 'Aprobado' && request['oferta_id'] == null;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: statusColor.withValues(alpha: 0.1),
                  child: Icon(statusIcon, color: statusColor),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        request['nombre_animal'] ?? 'Animal',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors.textDark),
                      ),
                      Text(fechaStr,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 11)),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    statusLabel,
                    style: TextStyle(
                        color: statusColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.bgTop,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                request['descripcion_venta'] ?? 'Sin descripción',
                style:
                    const TextStyle(fontSize: 13, color: AppColors.textDark),
              ),
            ),
            if (estado == 'Rechazado' &&
                request['motivo_rechazo'] != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.1),
                  border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.info_outline,
                        color: AppColors.error, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Motivo: ${request['motivo_rechazo']}',
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.error),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            if (canPublish) ...[
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton.icon(
                  onPressed: () => _publicarOferta(request),
                  icon: const Icon(Icons.publish, color: AppColors.white),
                  label: const Text('Publicar Oferta Aprobada',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
            if (estado == 'Publicado') ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primaryPurple.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.check_circle,
                        color: AppColors.primaryPurple, size: 18),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Oferta publicada. Puedes verla en tu inventario.',
                        style: TextStyle(
                            fontSize: 12, color: AppColors.primaryPurple),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _publicarOferta(Map<String, dynamic> request) async {
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => CreateOfferScreen(
          initialNombre: request['nombre_animal'],
          initialDescripcion: request['descripcion_venta'],
          solicitudAnimalId: request['id'],
        ),
      ),
    );

    if (result == true) _controller.loadRequests();
  }
}
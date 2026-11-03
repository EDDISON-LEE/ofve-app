import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import '../controllers/client_announcements_controller.dart';

class ClientAnnouncementsScreen extends StatefulWidget {
  const ClientAnnouncementsScreen({super.key});

  @override
  State<ClientAnnouncementsScreen> createState() => _ClientAnnouncementsScreenState();
}

class _ClientAnnouncementsScreenState extends State<ClientAnnouncementsScreen> {
  final _announcementsController = ClientAnnouncementsController();

  @override
  void initState() {
    super.initState();
    // Marcamos como leídos al abrir la pantalla
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _announcementsController.markAsRead();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _announcementsController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Anuncios de OfVe')),
          body: _announcementsController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : _announcementsController.announcements.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.notifications_off, size: 80, color: Colors.grey),
                          SizedBox(height: 16),
                          Text('No hay anuncios nuevos.', style: TextStyle(fontSize: 18, color: AppColors.textLight)),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(20),
                      itemCount: _announcementsController.announcements.length,
                      itemBuilder: (context, index) {
                        final anuncio = _announcementsController.announcements[index];
                        final fecha = DateTime.parse(anuncio['fecha_creacion']).toLocal();
                        final formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(fecha);

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
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryPurple.withOpacity(0.1),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(Icons.campaign, color: AppColors.primaryPurple, size: 24),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        anuncio['titulo'],
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textDark),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  anuncio['mensaje'],
                                  style: const TextStyle(fontSize: 14, color: AppColors.textDark, height: 1.4),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  formattedDate,
                                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                                ),
                              ],
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
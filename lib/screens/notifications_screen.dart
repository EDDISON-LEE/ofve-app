import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import '../controllers/notifications_controller.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final _notificationsController = NotificationsController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _notificationsController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(
            title: const Text('Notificaciones'),
            actions: [
              if (_notificationsController.unreadCount > 0)
                TextButton.icon(
                  onPressed: () => _notificationsController.markAllAsRead(),
                  icon: const Icon(Icons.done_all, color: AppColors.primaryPurple),
                  label: const Text('Marcar leídas', style: TextStyle(color: AppColors.primaryPurple)),
                ),
            ],
          ),
          body: _notificationsController.notifications.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.notifications_off_outlined, size: 80, color: Colors.grey),
                      SizedBox(height: 16),
                      Text('No tienes notificaciones.', style: TextStyle(fontSize: 18, color: AppColors.textLight)),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _notificationsController.notifications.length,
                  itemBuilder: (context, index) {
                    final notif = _notificationsController.notifications[index];
                    final isRead = notif['leida'] ?? false;
                    final fecha = DateTime.parse(notif['created_at']).toLocal();
                    final fechaStr = DateFormat('dd/MM/yyyy HH:mm').format(fecha);

                    // Color e icono según el tipo
                    Color iconColor = AppColors.info;
                    IconData iconData = Icons.info_outline;
                    if (notif['tipo'] == 'success') { iconColor = AppColors.success; iconData = Icons.check_circle_outline; }
                    if (notif['tipo'] == 'warning') { iconColor = AppColors.warning; iconData = Icons.warning_amber; }
                    if (notif['tipo'] == 'error') { iconColor = AppColors.error; iconData = Icons.error_outline; }

                    return GestureDetector(
                      onTap: () {
                        if (!isRead) _notificationsController.markAsRead(notif['id']);
                      },
                      child: Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        color: isRead ? Colors.white : AppColors.primaryPurple.withValues(alpha: 0.05),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: isRead ? BorderSide.none : const BorderSide(color: AppColors.primaryPurple, width: 1),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          leading: CircleAvatar(
                            backgroundColor: iconColor.withValues(alpha: 0.1),
                            child: Icon(iconData, color: iconColor),
                          ),
                          title: Text(notif['titulo'], style: TextStyle(fontWeight: isRead ? FontWeight.w500 : FontWeight.bold)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              Text(notif['mensaje']),
                              const SizedBox(height: 8),
                              Text(fechaStr, style: const TextStyle(fontSize: 10, color: Colors.grey)),
                            ],
                          ),
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
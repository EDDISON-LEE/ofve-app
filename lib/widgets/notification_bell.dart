import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../screens/notifications_screen.dart';
import '../controllers/notifications_controller.dart';

class NotificationBell extends StatefulWidget {
  const NotificationBell({super.key});

  @override
  State<NotificationBell> createState() => _NotificationBellState();
}

class _NotificationBellState extends State<NotificationBell> {
  final _notificationsController = NotificationsController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _notificationsController,
      builder: (context, child) {
        return Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_none, size: 28, color: AppColors.textDark),
              tooltip: 'Notificaciones',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const NotificationsScreen()),
                );
              },
            ),
            if (_notificationsController.unreadCount > 0)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: AppColors.error,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                  child: Text(
                    '${_notificationsController.unreadCount}',
                    style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
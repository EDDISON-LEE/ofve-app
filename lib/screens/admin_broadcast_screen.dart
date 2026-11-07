import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import '../controllers/admin_broadcast_controller.dart';

class AdminBroadcastScreen extends StatefulWidget {
  const AdminBroadcastScreen({super.key});

  @override
  State<AdminBroadcastScreen> createState() => _AdminBroadcastScreenState();
}

class _AdminBroadcastScreenState extends State<AdminBroadcastScreen> {
  final _broadcastController = AdminBroadcastController();
  final _titleController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _enviarAnuncio() async {
    final success = await _broadcastController.sendAnnouncement(
      _titleController.text, 
      _messageController.text
    );

    if (success && mounted) {
      _titleController.clear();
      _messageController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('¡Anuncio enviado a todos los usuarios!'), backgroundColor: AppColors.success),
      );
      FocusScope.of(context).unfocus(); // Ocultar teclado
    } else if (mounted && _broadcastController.errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_broadcastController.errorMessage!), backgroundColor: AppColors.error),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _broadcastController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Mensajes Masivos')),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // FORMULARIO DE ENVÍO
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4))],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('Crear Nuevo Anuncio', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                          labelText: 'Título del Anuncio',
                          prefixIcon: Icon(Icons.title),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _messageController,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          labelText: 'Mensaje para la comunidad',
                          prefixIcon: Icon(Icons.message),
                          alignLabelWithHint: true,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: _broadcastController.isSending ? null : _enviarAnuncio,
                          icon: _broadcastController.isSending 
                              ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2))
                              : const Icon(Icons.send, color: AppColors.white),
                          label: Text(_broadcastController.isSending ? 'Enviando...' : 'Enviar a Todos'),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
                const Text('Historial de Anuncios', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),

                // HISTORIAL DE ANUNCIOS
                if (_broadcastController.isLoading)
                  const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
                else if (_broadcastController.announcements.isEmpty)
                  const Center(child: Text('No has enviado anuncios aún.', style: TextStyle(color: Colors.grey)))
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _broadcastController.announcements.length,
                    itemBuilder: (context, index) {
                      final anuncio = _broadcastController.announcements[index];
                      final fecha = DateTime.parse(anuncio['fecha_creacion']).toLocal();
                      final formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(fecha);
                      final isActive = anuncio['activo'] ?? false;

                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16),
                          leading: CircleAvatar(
                            backgroundColor: isActive ? AppColors.success.withValues(alpha: 0.1) : Colors.grey.withValues(alpha: 0.1),
                            child: Icon(
                              isActive ? Icons.campaign : Icons.campaign_outlined, 
                              color: isActive ? AppColors.success : Colors.grey
                            ),
                          ),
                          title: Text(anuncio['titulo'], style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(anuncio['mensaje']),
                              const SizedBox(height: 4),
                              Text(formattedDate, style: const TextStyle(fontSize: 10, color: Colors.grey)),
                            ],
                          ),
                          trailing: Switch(
                            value: isActive,
                            activeColor: AppColors.primaryPurple,
                            onChanged: (val) => _broadcastController.toggleAnnouncementStatus(anuncio['id'], isActive),
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
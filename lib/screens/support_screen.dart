import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import '../controllers/support_controller.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final _controller = SupportController();

  void _mostrarFormulario() {
    final asuntoCtrl = TextEditingController();
    final mensajeCtrl = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom, top: 20, left: 20, right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Nuevo Ticket de Soporte', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextField(controller: asuntoCtrl, decoration: const InputDecoration(labelText: 'Asunto', border: OutlineInputBorder())),
            const SizedBox(height: 12),
            TextField(controller: mensajeCtrl, maxLines: 4, decoration: const InputDecoration(labelText: 'Describe tu problema', border: OutlineInputBorder())),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (asuntoCtrl.text.isEmpty || mensajeCtrl.text.isEmpty) return;
                final success = await _controller.createTicket(asuntoCtrl.text, mensajeCtrl.text);
                if (ctx.mounted) {
                  Navigator.pop(ctx);
                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ticket enviado'), backgroundColor: AppColors.success));
                  }
                }
              },
              child: const Text('Enviar Ticket'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Soporte')),
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: AppColors.primaryPurple,
            onPressed: _mostrarFormulario,
            icon: const Icon(Icons.add, color: Colors.white),
            label: const Text('Nuevo Ticket', style: TextStyle(color: Colors.white)),
          ),
          body: _controller.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : _controller.tickets.isEmpty
                  ? const Center(child: Text('No tienes tickets abiertos.', style: TextStyle(color: Colors.grey)))
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _controller.tickets.length,
                      itemBuilder: (context, index) {
                        final ticket = _controller.tickets[index];
                        final fecha = DateTime.parse(ticket['fecha_creacion']).toLocal();
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: ListTile(
                            title: Text(ticket['asunto'], style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(ticket['mensaje'], maxLines: 2, overflow: TextOverflow.ellipsis),
                                if (ticket['respuesta_admin'] != null) ...[
                                  const SizedBox(height: 8),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(color: AppColors.success.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                                    child: Text('Soporte: ${ticket['respuesta_admin']}', style: const TextStyle(color: AppColors.success, fontSize: 12)),
                                  ),
                                ],
                                const SizedBox(height: 4),
                                Text(DateFormat('dd/MM/yyyy HH:mm').format(fecha), style: const TextStyle(fontSize: 10, color: Colors.grey)),
                              ],
                            ),
                            trailing: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: ticket['estado'] == 'Abierto' ? AppColors.warning.withOpacity(0.1) : AppColors.success.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                ticket['estado'], 
                                style: TextStyle(color: ticket['estado'] == 'Abierto' ? AppColors.warning : AppColors.success, fontSize: 10, fontWeight: FontWeight.bold)
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
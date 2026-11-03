import 'package:flutter/material.dart';

class AdminSupportScreen extends StatelessWidget {
  const AdminSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryPurple = const Color(0xFF6B4EFF);
    final Color bgTop = const Color(0xFFECE2FC);

    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(title: const Text('Soporte al Usuario', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.black)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTicketCard(nombre: 'Eddison (Cliente)', asunto: 'No puedo aplicar un cupón', mensaje: 'Hola, intenté comprar en la Panadería El Trigal pero el cupón me da error...', tiempo: 'Hace 5 min', prioridad: 'Alta', color: Colors.red),
          _buildTicketCard(nombre: 'Tech Home Promos (Comercio)', asunto: 'Problema con la IA', mensaje: 'El asistente de IA no está generando la descripción correcta...', tiempo: 'Hace 2 horas', prioridad: 'Media', color: Colors.orange),
          _buildTicketCard(nombre: 'María Gómez (Cliente)', asunto: 'Cambio de contraseña', mensaje: 'No me llega el correo para cambiar mi clave. Ya revisé spam.', tiempo: 'Hace 1 día', prioridad: 'Baja', color: Colors.green),
        ],
      ),
    );
  }

  Widget _buildTicketCard({required String nombre, required String asunto, required String mensaje, required String tiempo, required String prioridad, required Color color}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(backgroundColor: color.withOpacity(0.1), child: Icon(Icons.person, color: color)),
        title: Text(nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(asunto, style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black87)),
            Text(mensaje, maxLines: 2, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 8),
            Row(children: [
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(4)), child: Text('Prioridad: $prioridad', style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.bold))),
              const SizedBox(width: 8),
              Text(tiempo, style: const TextStyle(fontSize: 10, color: Colors.grey)),
            ])
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ),
    );
  }
}
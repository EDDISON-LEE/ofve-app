import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OwnerUserManagementScreen extends StatefulWidget {
  const OwnerUserManagementScreen({super.key});

  @override
  State<OwnerUserManagementScreen> createState() => _OwnerUserManagementScreenState();
}

class _OwnerUserManagementScreenState extends State<OwnerUserManagementScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _usuarios = [];

  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

  @override
  void initState() {
    super.initState();
    _loadUsuarios();
  }

  Future<void> _loadUsuarios() async {
    setState(() => _isLoading = true);
    try {
      final response = await _supabase.from('usuarios').select('id, nombre, email, rol').order('nombre', ascending: true);
      setState(() => _usuarios = response);
    } catch (e) {
      debugPrint('Error cargando usuarios: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _cambiarRol(String email, String nuevoRol) async {
    setState(() => _isLoading = true);
    try {
      // Función RPC segura creada anteriormente
      await _supabase.rpc('assign_role', params: {
        'target_email': email,
        'new_role': nuevoRol,
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Rol actualizado a $nuevoRol.'), backgroundColor: Colors.green),
        );
      }
      _loadUsuarios();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Gestión de Roles', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _loadUsuarios)
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: primaryPurple))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _usuarios.length,
              itemBuilder: (context, index) {
                final user = _usuarios[index];
                final rol = user['rol'] ?? 'user';
                
                Color roleColor = Colors.grey;
                if (rol == 'admin') roleColor = Colors.redAccent;
                if (rol == 'merchant') roleColor = Colors.blue;
                if (rol == 'owner') roleColor = Colors.purple;

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: roleColor.withOpacity(0.1),
                      child: Icon(Icons.person, color: roleColor),
                    ),
                    title: Text(user['nombre'] ?? 'Sin nombre', style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(user['email'] ?? ''),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) => _cambiarRol(user['email'], value),
                      itemBuilder: (context) => [
                        const PopupMenuItem(value: 'admin', child: Text('Hacer Administrador')),
                        const PopupMenuItem(value: 'merchant', child: Text('Hacer Comercio')),
                        const PopupMenuItem(value: 'user', child: Text('Hacer Cliente')),
                      ],
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(color: roleColor.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(rol.toUpperCase(), style: TextStyle(color: roleColor, fontWeight: FontWeight.bold, fontSize: 10)),
                            const SizedBox(width: 4),
                            Icon(Icons.arrow_drop_down, color: roleColor, size: 16),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
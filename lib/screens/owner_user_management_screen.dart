import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';

class OwnerUserManagementScreen extends StatefulWidget {
  const OwnerUserManagementScreen({super.key});

  @override
  State<OwnerUserManagementScreen> createState() => _OwnerUserManagementScreenState();
}

class _OwnerUserManagementScreenState extends State<OwnerUserManagementScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _usuarios = [];

  @override
  void initState() {
    super.initState();
    _loadUsuarios();
  }

  Future<void> _loadUsuarios() async {
    setState(() => _isLoading = true);
    try {
      // MODIFICADO: Hacemos un JOIN con comercios para traer el estado del resumen
      final response = await _supabase
          .from('usuarios')
          .select('id, nombre, email, rol, comercios(resumen_ia_activo)')
          .order('nombre', ascending: true);
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
      await _supabase.rpc('assign_role', params: {
        'target_email': email,
        'new_role': nuevoRol,
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Rol actualizado a $nuevoRol.'), backgroundColor: AppColors.success),
        );
      }
      _loadUsuarios();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: AppColors.error),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  // --- NUEVO MÉTODO: Activar Resumen IA a un Comercio ---
  Future<void> _toggleResumenIA(String usuarioId, bool currentState) async {
    try {
      await _supabase.from('comercios').update({'resumen_ia_activo': !currentState}).eq('usuario_id', usuarioId);
      _loadUsuarios(); // Recargar
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Resumen IA actualizado.'), backgroundColor: AppColors.success),
        );
      }
    } catch (e) {
      debugPrint('Error actualizando resumen IA: $e');
    }
  }
  // -----------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgTop,
      appBar: AppBar(
        title: const Text('Gestión de Roles', style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.refresh, color: AppColors.textDark), onPressed: _loadUsuarios)
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _usuarios.length,
              itemBuilder: (context, index) {
                final user = _usuarios[index];
                final rol = user['rol'] ?? 'user';
                final hasResumen = user['comercios']?['resumen_ia_activo'] ?? false; // <-- NUEVO
                
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
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // --- NUEVO: BOTÓN DE RESUMEN IA (Solo para merchants) ---
                        if (rol == 'merchant')
                          IconButton(
                            icon: Icon(
                              hasResumen ? Icons.chat_bubble : Icons.chat_bubble_outline,
                              color: hasResumen ? AppColors.success : Colors.grey,
                            ),
                            tooltip: hasResumen ? 'Desactivar Resumen IA' : 'Activar Resumen IA',
                            onPressed: () => _toggleResumenIA(user['id'], hasResumen),
                          ),
                        // -----------------------------------------------------------
                        PopupMenuButton<String>(
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
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
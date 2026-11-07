import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/admin_users_controller.dart';

class AdminUsersScreen extends StatefulWidget {
  const AdminUsersScreen({super.key});

  @override
  State<AdminUsersScreen> createState() => _AdminUsersScreenState();
}

class _AdminUsersScreenState extends State<AdminUsersScreen> {
  final _usersController = AdminUsersController();
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _usersController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Gestión de Usuarios')),
          body: Column(
            children: [
              // BUSCADOR
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _searchController,
                  onChanged: _usersController.search,
                  decoration: InputDecoration(
                    hintText: 'Buscar por nombre o email...',
                    prefixIcon: const Icon(Icons.search, color: AppColors.primaryPurple),
                    suffixIcon: _searchController.text.isNotEmpty 
                        ? IconButton(
                            icon: const Icon(Icons.clear, color: Colors.grey),
                            onPressed: () {
                              _searchController.clear();
                              _usersController.search('');
                            },
                          )
                        : null,
                    filled: true,
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                  ),
                ),
              ),

              // LISTA DE USUARIOS
              Expanded(
                child: _usersController.isLoading
                    ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
                    : _usersController.filteredUsers.isEmpty
                        ? const Center(child: Text('No se encontraron usuarios.', style: TextStyle(color: Colors.grey)))
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemCount: _usersController.filteredUsers.length,
                            itemBuilder: (context, index) {
                              final user = _usersController.filteredUsers[index];
                              final isBanned = user['estado_baneado'] ?? false;
                              final role = user['rol'] ?? 'user';
                              
                              Color roleColor = Colors.grey;
                              if (role == 'admin') roleColor = Colors.redAccent;
                              if (role == 'merchant') roleColor = Colors.blue;
                              if (role == 'owner') roleColor = Colors.purple;

                              return Card(
                                margin: const EdgeInsets.only(bottom: 12),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  leading: CircleAvatar(
                                    backgroundColor: isBanned ? AppColors.error.withValues(alpha: 0.1) : roleColor.withValues(alpha: 0.1),
                                    child: Icon(
                                      isBanned ? Icons.block : Icons.person, 
                                      color: isBanned ? AppColors.error : roleColor
                                    ),
                                  ),
                                  title: Text(user['nombre'] ?? 'Sin nombre', style: const TextStyle(fontWeight: FontWeight.bold)),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(user['email'] ?? ''),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                            decoration: BoxDecoration(color: roleColor.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(4)),
                                            child: Text(role.toUpperCase(), style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: roleColor)),
                                          ),
                                          const SizedBox(width: 8),
                                          if (isBanned)
                                            const Text('SUSPENDIDO', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.error)),
                                        ],
                                      )
                                    ],
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(
                                      isBanned ? Icons.lock_open : Icons.block,
                                      color: isBanned ? AppColors.success : AppColors.error,
                                    ),
                                    tooltip: isBanned ? 'Reactivar Cuenta' : 'Suspender Cuenta',
                                    onPressed: () => _mostrarConfirmacion(user['id'], user['nombre'], isBanned),
                                  ),
                                ),
                              );
                            },
                          ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _mostrarConfirmacion(String userId, String nombre, bool isBanned) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(isBanned ? 'Reactivar Usuario' : 'Suspender Usuario'),
        content: Text('¿Estás seguro que deseas ${isBanned ? "reactivar" : "suspender"} a "$nombre"?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: isBanned ? AppColors.success : AppColors.error),
            onPressed: () {
              Navigator.pop(ctx);
              _usersController.toggleUserBan(userId, isBanned);
            },
            child: Text(isBanned ? 'Reactivar' : 'Suspender'),
          ),
        ],
      ),
    );
  }
}
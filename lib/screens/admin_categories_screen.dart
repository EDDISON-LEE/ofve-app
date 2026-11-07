import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/admin_categories_controller.dart';

class AdminCategoriesScreen extends StatefulWidget {
  const AdminCategoriesScreen({super.key});

  @override
  State<AdminCategoriesScreen> createState() => _AdminCategoriesScreenState();
}

class _AdminCategoriesScreenState extends State<AdminCategoriesScreen> {
  final _categoriesController = AdminCategoriesController();
  final _nameCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    super.dispose();
  }

  void _mostrarDialogoAgregar() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Nueva Categoría'),
        content: TextField(
          controller: _nameCtrl,
          decoration: const InputDecoration(
              labelText: 'Nombre de la categoría', prefixIcon: Icon(Icons.category)),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () async {
              // FIX: capturamos messenger del State ANTES del await
              final messenger = ScaffoldMessenger.of(context);
              final success = await _categoriesController.addCategory(_nameCtrl.text);
              if (!mounted) return;
              if (!ctx.mounted) return;
              Navigator.pop(ctx);
              _nameCtrl.clear();
              if (success) {
                messenger.showSnackBar(const SnackBar(
                    content: Text('Categoría agregada'),
                    backgroundColor: AppColors.success));
              } else {
                messenger.showSnackBar(const SnackBar(
                    content: Text('Error al agregar (puede que ya exista)'),
                    backgroundColor: AppColors.error));
              }
            },
            child: const Text('Agregar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _categoriesController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Gestión de Categorías')),
          floatingActionButton: FloatingActionButton(
            onPressed: _mostrarDialogoAgregar,
            backgroundColor: AppColors.primaryPurple,
            child: const Icon(Icons.add, color: AppColors.white),
          ),
          body: _categoriesController.isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _categoriesController.categories.length,
                  itemBuilder: (context, index) {
                    final cat = _categoriesController.categories[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      shape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: AppColors.primaryPurple.withValues(alpha: 0.1),
                          child: const Icon(Icons.category, color: AppColors.primaryPurple),
                        ),
                        title: Text(cat['nombre'],
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: AppColors.error),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text('Eliminar Categoría'),
                                content: Text(
                                    '¿Estás seguro que deseas eliminar "${cat['nombre']}"?'),
                                actions: [
                                  TextButton(
                                      onPressed: () => Navigator.pop(ctx),
                                      child: const Text('Cancelar')),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.error),
                                    onPressed: () {
                                      Navigator.pop(ctx);
                                      _categoriesController.deleteCategory(cat['id']);
                                    },
                                    child: const Text('Eliminar'),
                                  ),
                                ],
                              ),
                            );
                          },
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
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/client_pools_controller.dart';

class ClientPoolsScreen extends StatefulWidget {
  const ClientPoolsScreen({super.key});

  @override
  State<ClientPoolsScreen> createState() => _ClientPoolsScreenState();
}

class _ClientPoolsScreenState extends State<ClientPoolsScreen> {
  final _poolsController = ClientPoolsController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _poolsController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Pools Comunitarios')),
          body: _poolsController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : _poolsController.activePools.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.groups, size: 80, color: Colors.grey),
                          SizedBox(height: 16),
                          Text('No hay pools activos hoy.', style: TextStyle(fontSize: 18, color: AppColors.textLight)),
                          Text('¡Vuelve pronto para comprar al por mayor!', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(20),
                      itemCount: _poolsController.activePools.length,
                      itemBuilder: (context, index) {
                        final pool = _poolsController.activePools[index];
                        final current = pool['usuarios_comprometidos'] ?? 0;
                        final meta = pool['meta_usuarios'] ?? 50;
                        final progress = current / meta;
                        
                        return Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        pool['producto_nombre'], 
                                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textDark)
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                      decoration: BoxDecoration(color: AppColors.primaryPurple.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                                      child: const Text('En Recaudación', style: TextStyle(color: AppColors.primaryPurple, fontSize: 12, fontWeight: FontWeight.bold)),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Precio al mayor: \$${pool['precio_mayorista_sugerido']}',
                                  style: const TextStyle(fontSize: 18, color: AppColors.success, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 16),
                                LinearProgressIndicator(
                                  value: progress > 1.0 ? 1.0 : progress,
                                  backgroundColor: Colors.grey[200],
                                  color: AppColors.primaryPurple,
                                  minHeight: 10,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '$current de $meta personas comprometidas',
                                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  width: double.infinity,
                                  height: 45,
                                  child: ElevatedButton(
                                    onPressed: () => _mostrarDialogoUnion(pool['id']),
                                    child: const Text('Unirme al Pool'),
                                  ),
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

  void _mostrarDialogoUnion(String poolId) {
    final ctrl = TextEditingController(text: '1');
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Unirse al Pool'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('¿Cuántas unidades deseas comprometer?'),
            const SizedBox(height: 16),
            TextField(
              controller: ctrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Cantidad', prefixIcon: Icon(Icons.shopping_bag)),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () async {
              final cantidad = int.tryParse(ctrl.text) ?? 1;
              Navigator.pop(ctx);
              final success = await _poolsController.joinPool(poolId, cantidad);
              if (success && mounted) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('¡Te has unido al pool con éxito!'), backgroundColor: AppColors.success));
              }
            },
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}
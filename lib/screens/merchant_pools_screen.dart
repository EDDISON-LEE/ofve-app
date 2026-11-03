import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/merchant_pools_controller.dart';

class MerchantPoolsScreen extends StatefulWidget {
  const MerchantPoolsScreen({super.key});

  @override
  State<MerchantPoolsScreen> createState() => _MerchantPoolsScreenState();
}

class _MerchantPoolsScreenState extends State<MerchantPoolsScreen> {
  final _poolsController = MerchantPoolsController();
  final _productNameCtrl = TextEditingController();
  final _targetUsersCtrl = TextEditingController();
  final _wholesalePriceCtrl = TextEditingController();

  @override
  void dispose() {
    _productNameCtrl.dispose();
    _targetUsersCtrl.dispose();
    _wholesalePriceCtrl.dispose();
    super.dispose();
  }

  void _mostrarFormulario() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, top: 20, left: 20, right: 20),
        decoration: const BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Crear Nuevo Pool', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              TextField(controller: _productNameCtrl, decoration: const InputDecoration(labelText: 'Nombre del Producto (Ej: Caja de 12 Refrescos)', prefixIcon: Icon(Icons.shopping_bag))),
              const SizedBox(height: 12),
              TextField(controller: _targetUsersCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Meta de Personas', prefixIcon: Icon(Icons.group))),
              const SizedBox(height: 12),
              TextField(controller: _wholesalePriceCtrl, keyboardType: const TextInputType.numberWithOptions(decimal: true), decoration: const InputDecoration(labelText: 'Precio al Mayor Sugerido (\$)', prefixIcon: Icon(Icons.attach_money))),
              const SizedBox(height: 24),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    final success = await _poolsController.createPool(
                      productName: _productNameCtrl.text,
                      targetUsers: int.tryParse(_targetUsersCtrl.text) ?? 50,
                      wholesalePrice: double.tryParse(_wholesalePriceCtrl.text) ?? 0.0,
                    );
                    if (success && mounted) {
                      Navigator.pop(ctx);
                      _productNameCtrl.clear();
                      _targetUsersCtrl.clear();
                      _wholesalePriceCtrl.clear();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('¡Pool creado con éxito!'), backgroundColor: AppColors.success));
                    }
                  },
                  child: const Text('Lanzar Pool'),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _poolsController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(
            title: const Text('Pools Comunitarios'),
            actions: [
              IconButton(
                icon: const Icon(Icons.add_circle, color: AppColors.primaryPurple, size: 30),
                tooltip: 'Crear Nuevo Pool',
                onPressed: _mostrarFormulario,
              )
            ],
          ),
          body: _poolsController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : _poolsController.myPools.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.groups, size: 80, color: Colors.grey),
                          SizedBox(height: 16),
                          Text('No tienes pools activos.', style: TextStyle(fontSize: 18, color: AppColors.textLight)),
                          Text('¡Crea uno con el botón +!', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(20),
                      itemCount: _poolsController.myPools.length,
                      itemBuilder: (context, index) {
                        final pool = _poolsController.myPools[index];
                        final current = pool['usuarios_comprometidos'] ?? 0;
                        final meta = pool['meta_usuarios'] ?? 1;
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
                                    Expanded(child: Text(pool['producto_nombre'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                                    Text(pool['estado'], style: const TextStyle(color: AppColors.primaryPurple, fontSize: 12, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text('Precio Mayorista: \$${pool['precio_mayorista_sugerido']}', style: const TextStyle(color: AppColors.success, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 16),
                                LinearProgressIndicator(value: progress > 1.0 ? 1.0 : progress, backgroundColor: Colors.grey[200], color: AppColors.primaryPurple, minHeight: 10, borderRadius: BorderRadius.circular(10)),
                                const SizedBox(height: 8),
                                Text('$current de $meta personas comprometidas', style: const TextStyle(color: Colors.grey, fontSize: 13)),
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
}
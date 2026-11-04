import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/merchant_branches_controller.dart';

class MerchantBranchesScreen extends StatefulWidget {
  const MerchantBranchesScreen({super.key});

  @override
  State<MerchantBranchesScreen> createState() => _MerchantBranchesScreenState();
}

class _MerchantBranchesScreenState extends State<MerchantBranchesScreen> {
  final _controller = MerchantBranchesController();

  void _mostrarFormularioSucursal() {
    final nameCtrl = TextEditingController();
    final addressCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, top: 24, left: 20, right: 20),
        decoration: const BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Nueva Sucursal', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Nombre de la Sucursal', prefixIcon: Icon(Icons.store))),
            const SizedBox(height: 12),
            TextField(controller: addressCtrl, decoration: const InputDecoration(labelText: 'Dirección Física', prefixIcon: Icon(Icons.location_on))),
            const SizedBox(height: 12),
            TextField(controller: phoneCtrl, keyboardType: TextInputType.phone, decoration: const InputDecoration(labelText: 'Teléfono', prefixIcon: Icon(Icons.phone))),
            const SizedBox(height: 24),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  final success = await _controller.createBranch(
                    nombre: nameCtrl.text,
                    direccion: addressCtrl.text,
                    telefono: phoneCtrl.text,
                  );
                  if (success && ctx.mounted) {
                    Navigator.pop(ctx);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('¡Sucursal creada con éxito!'), backgroundColor: AppColors.success));
                  } else if (ctx.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_controller.errorMessage ?? 'Error'), backgroundColor: AppColors.error));
                  }
                },
                child: _controller.isCreating 
                  ? const CircularProgressIndicator(color: AppColors.white) 
                  : const Text('Guardar Sucursal'),
              ),
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
          appBar: AppBar(title: const Text('Mis Sucursales')),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: _mostrarFormularioSucursal,
            backgroundColor: AppColors.primaryPurple,
            icon: const Icon(Icons.add_business, color: AppColors.white),
            label: const Text('Nueva Sucursal', style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold)),
          ),
          body: _controller.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TARJETA DE LA CASA MATRIZ
                      if (_controller.parentStore != null) ...[
                        const Text('Casa Matriz', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [AppColors.darkCardColor, const Color(0xFF3D3785)]),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [BoxShadow(color: AppColors.darkCardColor.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 5))],
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.store, color: AppColors.white, size: 40),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(_controller.parentStore!['nombre_comercial'], style: const TextStyle(color: AppColors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                                    Text(_controller.parentStore!['direccion_texto'] ?? 'Sin dirección', style: const TextStyle(color: Colors.white70, fontSize: 12)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      
                      const SizedBox(height: 30),
                      const Text('Sucursales', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),

                      if (_controller.branches.isEmpty)
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text('No tienes sucursales registradas aún.', style: TextStyle(color: Colors.grey)),
                          ),
                        )
                      else
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _controller.branches.length,
                          itemBuilder: (context, index) {
                            final branch = _controller.branches[index];
                            return Card(
                              margin: const EdgeInsets.only(bottom: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(16),
                                leading: CircleAvatar(
                                  backgroundColor: AppColors.primaryPurple.withOpacity(0.1),
                                  child: const Icon(Icons.storefront, color: AppColors.primaryPurple),
                                ),
                                title: Text(branch['nombre_comercial'], style: const TextStyle(fontWeight: FontWeight.bold)),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 4),
                                    Text(branch['direccion_texto'] ?? 'Sin dirección'),
                                    if (branch['telefono_empresa'] != null)
                                      Text('Telf: ${branch['telefono_empresa']}', style: const TextStyle(fontSize: 12)),
                                  ],
                                ),
                                trailing: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(color: AppColors.success.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                                  child: const Text('ACTIVA', style: TextStyle(color: AppColors.success, fontSize: 10, fontWeight: FontWeight.bold)),
                                ),
                              ),
                            );
                          },
                        ),
                      const SizedBox(height: 80), // Espacio para el FAB
                    ],
                  ),
                ),
        );
      },
    );
  }
}
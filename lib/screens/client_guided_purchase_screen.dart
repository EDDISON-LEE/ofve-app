import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/guided_purchase_controller.dart';
import 'client_checkout_screen.dart';

class ClientGuidedPurchaseScreen extends StatefulWidget {
  const ClientGuidedPurchaseScreen({super.key});

  @override
  State<ClientGuidedPurchaseScreen> createState() => _ClientGuidedPurchaseScreenState();
}

class _ClientGuidedPurchaseScreenState extends State<ClientGuidedPurchaseScreen> {
  final _purchaseController = GuidedPurchaseController();
  final _budgetController = TextEditingController();
  
  String _selectedCategory = 'Supermercado';
  final List<String> _categories = [
    'Supermercado', 'Alimentos y Bebidas', 'Tecnología', 'Ropa y Calzado', 
    'Salud y Belleza', 'Hogar y Ferretería', 'Farmacia', 'Servicios', 'Otros'
  ];

  // Lista inicial con un producto vacío
  final List<Map<String, dynamic>> _requestedItems = [
    {'nombre': '', 'cantidad': '1'}
  ];

  void _agregarItem() {
    setState(() {
      _requestedItems.add({'nombre': '', 'cantidad': '1'});
    });
  }

  void _eliminarItem(int index) {
    if (_requestedItems.length > 1) {
      setState(() => _requestedItems.removeAt(index));
    }
  }

  Future<void> _generarOptimizacion() async {
    final budget = double.tryParse(_budgetController.text);
    if (budget == null || budget <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ingresa un presupuesto válido.'), backgroundColor: AppColors.error));
      return;
    }

    // Filtrar productos vacíos
    final cleanItems = _requestedItems.where((item) => item['nombre'].toString().trim().isNotEmpty).toList();
    if (cleanItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Agrega al menos un producto a tu lista.'), backgroundColor: AppColors.warning));
      return;
    }

    final success = await _purchaseController.optimizeBasket(
      budget: budget,
      category: _selectedCategory,
      requestedItems: cleanItems,
    );

    if (!success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_purchaseController.errorMessage ?? 'Error al optimizar'), backgroundColor: AppColors.error));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _purchaseController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Compra Guiada')),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // FORMULARIO DE CONFIGURACIÓN
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('1. Presupuesto y Categoría', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _budgetController,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              decoration: const InputDecoration(labelText: 'Presupuesto (USD)', prefixIcon: Icon(Icons.attach_money)),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _selectedCategory,
                              decoration: const InputDecoration(labelText: 'Categoría'),
                              items: _categories.map((e) => DropdownMenuItem(value: e, child: Text(e, overflow: TextOverflow.ellipsis))).toList(),
                              onChanged: (v) => setState(() => _selectedCategory = v!),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text('2. Productos que necesitas', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 8),
                      
                      // LISTA DINÁMICA DE PRODUCTOS
                      ..._requestedItems.asMap().entries.map((entry) {
                        final index = entry.key;
                        final item = entry.value;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: TextFormField(
                                  initialValue: item['nombre'],
                                  decoration: const InputDecoration(labelText: 'Producto (Ej: Harina)', isDense: true),
                                  onChanged: (v) => item['nombre'] = v,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                  initialValue: item['cantidad'],
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(labelText: 'Cant.', isDense: true),
                                  onChanged: (v) => item['cantidad'] = v,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: AppColors.error),
                                onPressed: () => _eliminarItem(index),
                              )
                            ],
                          ),
                        );
                      }),
                      
                      TextButton.icon(
                        onPressed: _agregarItem,
                        icon: const Icon(Icons.add, color: AppColors.primaryPurple),
                        label: const Text('Agregar otro producto', style: TextStyle(color: AppColors.primaryPurple)),
                      ),

                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: _purchaseController.isLoading ? null : _generarOptimizacion,
                          icon: _purchaseController.isLoading ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2)) : const Icon(Icons.auto_awesome, color: AppColors.white),
                          label: Text(_purchaseController.isLoading ? 'Optimizando...' : 'Armar mi Cesta'),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // RESULTADOS: CESTA OPTIMIZADA
                if (_purchaseController.optimizedBasket.isNotEmpty) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Cesta Inteligente', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(color: AppColors.success.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                        child: Text('Total: \$${_purchaseController.totalSpent.toStringAsFixed(2)}', style: const TextStyle(color: AppColors.success, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _purchaseController.optimizedBasket.length,
                    itemBuilder: (context, index) {
                      final item = _purchaseController.optimizedBasket[index];
                      final offer = item['oferta'];
                      final qty = item['requested_qty'];
                      final cost = item['total_cost'];

                      return Card(
                        margin: const EdgeInsets.only(bottom: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: (offer['imagen_url'] != null && offer['imagen_url'].toString().isNotEmpty)
                                ? Image.network(offer['imagen_url'], width: 50, height: 50, fit: BoxFit.cover)
                                : Container(width: 50, height: 50, color: Colors.grey[200], child: const Icon(Icons.image, color: Colors.grey)),
                          ),
                          title: Text('${qty}x ${offer['producto_nombre']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Precio unitario: \$${item['unit_price']}'),
                          trailing: Text('\$${cost.toStringAsFixed(2)}', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold, fontSize: 16)),
                          onTap: () {
                            // Navegar al checkout para comprar este item específico
                            Navigator.push(context, MaterialPageRoute(
                              builder: (_) => ClientCheckoutScreen(oferta: offer),
                            ));
                          },
                        ),
                      );
                    },
                  ),

                  // ITEMS FUERA DEL PRESUPUESTO
                  if (_purchaseController.outOfBudgetItems.isNotEmpty) ...[
                    const SizedBox(height: 20),
                    const Text('Productos fuera de tu presupuesto:', style: TextStyle(color: AppColors.warning, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    ..._purchaseController.outOfBudgetItems.map((item) {
                      return ListTile(
                        leading: const Icon(Icons.warning_amber_rounded, color: AppColors.warning),
                        title: Text('${item['requested_qty']}x ${item['oferta']['producto_nombre']}', style: const TextStyle(color: Colors.grey)),
                        trailing: Text('\$${item['total_cost']}', style: const TextStyle(color: Colors.grey)),
                      );
                    }),
                  ]
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
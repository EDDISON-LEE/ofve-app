import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/client_plan_controller.dart';
import 'map_picker_screen.dart';
import 'client_plan_results_screen.dart';

class ClientPlanPurchaseScreen extends StatefulWidget {
  const ClientPlanPurchaseScreen({super.key});

  @override
  State<ClientPlanPurchaseScreen> createState() => _ClientPlanPurchaseScreenState();
}

class _ClientPlanPurchaseScreenState extends State<ClientPlanPurchaseScreen> {
  final _planController = ClientPlanController();
  
  final List<Map<String, dynamic>> _items = [
    {'nombre': '', 'cantidad': '1', 'descripcion': ''}
  ];

  double? _lat;
  double? _lng;
  DateTime _fechaCompra = DateTime.now().add(const Duration(days: 1));

  void _agregarItem() {
    setState(() {
      _items.add({'nombre': '', 'cantidad': '1', 'descripcion': ''});
    });
  }

  void _eliminarItem(int index) {
    if (_items.length > 1) setState(() => _items.removeAt(index));
  }

  Future<void> _seleccionarUbicacion() async {
    final result = await Navigator.push<Map<String, double>>(
      context,
      MaterialPageRoute(builder: (_) => const MapPickerScreen()),
    );

    if (result != null) {
      setState(() {
        _lat = result['lat'];
        _lng = result['lng'];
      });
    }
  }

  Future<void> _buscarOfertas() async {
    if (_items.every((item) => item['nombre'].toString().trim().isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Agrega al menos un producto.'), backgroundColor: AppColors.error));
      return;
    }
    if (_lat == null || _lng == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Selecciona un sector en el mapa.'), backgroundColor: AppColors.warning));
      return;
    }

    final success = await _planController.generarPlanificacion(
      items: _items,
      lat: _lat!,
      lng: _lng!,
      fechaCompra: _fechaCompra,
    );

    if (success && mounted) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const ClientPlanResultsScreen()));
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_planController.errorMessage ?? 'Error al buscar ofertas'), backgroundColor: AppColors.error));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _planController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Planificar mi Compra')),
          body: _planController.isLoading
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: AppColors.primaryPurple),
                      SizedBox(height: 20),
                      Text('Buscando los mejores precios en tu zona...', style: TextStyle(color: AppColors.textLight)),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
                        child: const Text(
                          'Dinos qué necesitas y nuestro motor buscará los precios más bajos en un radio de 1000 metros a la redonda.',
                          style: TextStyle(color: AppColors.textLight),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // LISTA DINÁMICA DE PRODUCTOS
                      ..._items.asMap().entries.map((entry) {
                        final index = entry.key;
                        final item = entry.value;
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: TextFormField(
                                        initialValue: item['nombre'],
                                        decoration: const InputDecoration(labelText: 'Producto (Ej: Harina)', isDense: true),
                                        onChanged: (v) => item['nombre'] = v,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
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
                              ],
                            ),
                          ),
                        );
                      }),

                      TextButton.icon(
                        onPressed: _agregarItem,
                        icon: const Icon(Icons.add, color: AppColors.primaryPurple),
                        label: const Text('Agregar otro producto', style: TextStyle(color: AppColors.primaryPurple)),
                      ),

                      const SizedBox(height: 24),
                      const Divider(),
                      const SizedBox(height: 24),

                      // SELECTOR DE UBICACIÓN
                      ListTile(
                        leading: const Icon(Icons.location_on, color: AppColors.primaryPurple),
                        title: const Text('Sector de Búsqueda', style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(_lat == null ? 'Toca para seleccionar en el mapa' : 'Lat: $_lat, Lng: $_lng'),
                        trailing: const Icon(Icons.map, color: AppColors.primaryPurple),
                        onTap: _seleccionarUbicacion,
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // SELECTOR DE FECHA
                      ListTile(
                        leading: const Icon(Icons.calendar_today, color: AppColors.primaryPurple),
                        title: const Text('Fecha de Compra', style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('${_fechaCompra.day}/${_fechaCompra.month}/${_fechaCompra.year}'),
                        trailing: const Icon(Icons.edit, color: Colors.grey),
                        onTap: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: _fechaCompra,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(const Duration(days: 30)),
                          );
                          if (date != null) setState(() => _fechaCompra = date);
                        },
                      ),

                      const SizedBox(height: 40),

                      SizedBox(
                        height: 55,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryPurple,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          ),
                          onPressed: _buscarOfertas,
                          icon: const Icon(Icons.auto_awesome, color: AppColors.white),
                          label: const Text('Buscar Mejores Precios', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
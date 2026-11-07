import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/client_plan_controller.dart';
import '../controllers/zones_controller.dart';
import 'map_picker_screen.dart';
import 'client_plan_results_screen.dart';

class ClientPlanPurchaseScreen extends StatefulWidget {
  const ClientPlanPurchaseScreen({super.key});

  @override
  State<ClientPlanPurchaseScreen> createState() => _ClientPlanPurchaseScreenState();
}

class _ClientPlanPurchaseScreenState extends State<ClientPlanPurchaseScreen> {
  final _planController = ClientPlanController();
  final _zonesController = ZonesController();
  
  final List<Map<String, dynamic>> _items = [
    {'nombre': '', 'cantidad': '1', 'descripcion': ''}
  ];

  double? _lat;
  double? _lng;
  String _sectorTexto = '';
  DateTime _fechaCompra = DateTime.now().add(const Duration(days: 1));

  void _agregarItem() {
    setState(() {
      _items.add({'nombre': '', 'cantidad': '1', 'descripcion': ''});
    });
  }

  void _eliminarItem(int index) {
    if (_items.length > 1) setState(() => _items.removeAt(index));
  }

  // Opción 1: Abrir Mapa Manualmente
  Future<void> _seleccionarUbicacionMapa() async {
    final result = await Navigator.push<Map<String, double>>(
      context,
      MaterialPageRoute(builder: (_) => const MapPickerScreen()),
    );

    if (result != null) {
      setState(() {
        _lat = result['lat'];
        _lng = result['lng'];
        _sectorTexto = 'Ubicación manual en mapa';
        // Limpiamos los dropdowns para evitar confusión
        _zonesController.selectEstado(null);
        _zonesController.selectMunicipio(null);
        _zonesController.selectParroquia(null);
      });
    }
  }

  // Opción 2: Usar Dropdowns Geográficos
  void _usarUbicacionZona() {
    final coords = _zonesController.getSelectedCoordinates();
    if (coords != null) {
      setState(() {
        _lat = coords['lat'];
        _lng = coords['lng'];
        _sectorTexto = '${_zonesController.selectedParroquia}, ${_zonesController.selectedMunicipio}';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ubicación seleccionada por zona.'), backgroundColor: AppColors.success),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('La zona seleccionada no tiene coordenadas válidas.'), backgroundColor: AppColors.warning),
      );
    }
  }

  Future<void> _buscarOfertas() async {
    if (_items.every((item) => item['nombre'].toString().trim().isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Agrega al menos un producto.'), backgroundColor: AppColors.error));
      return;
    }
    
    if (_lat == null || _lng == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Debes seleccionar una ubicación (por zona o mapa).'), backgroundColor: AppColors.warning));
      return;
    }

    final success = await _planController.generarPlanificacion(
      items: _items,
      lat: _lat!,
      lng: _lng!,
      fechaCompra: _fechaCompra,
      sectorTexto: _sectorTexto,
    );

    if (success && mounted) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const ClientPlanResultsScreen()));
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_planController.errorMessage ?? 'Error al buscar ofertas'), backgroundColor: AppColors.error));
    }
  }

  @override
  void dispose() {
    _zonesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_planController, _zonesController]),
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
                          'Dinos qué necesitas y buscaremos los precios más bajos en la zona que elijas.',
                          style: TextStyle(color: AppColors.textLight),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // LISTA DE PRODUCTOS
                      ..._items.asMap().entries.map((entry) {
                        final index = entry.key;
                        final item = entry.value;
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: TextFormField(
                                    initialValue: item['nombre'],
                                    decoration: const InputDecoration(labelText: 'Producto', isDense: true),
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

                      // SELECTORES GEOGRÁFICOS
                      const Text('1. Ubicación por Zona', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 12),
                      
                      if (_zonesController.isLoading)
                        const Center(child: CircularProgressIndicator())
                      else ...[
                        DropdownButtonFormField<String>(
                          value: _zonesController.selectedEstado,
                          decoration: const InputDecoration(labelText: 'Estado', prefixIcon: Icon(Icons.map)),
                          items: _zonesController.estados.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                          onChanged: (v) => _zonesController.selectEstado(v),
                        ),
                        const SizedBox(height: 12),
                        DropdownButtonFormField<String>(
                          value: _zonesController.selectedMunicipio,
                          decoration: const InputDecoration(labelText: 'Municipio', prefixIcon: Icon(Icons.location_city)),
                          items: _zonesController.municipios.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                          onChanged: _zonesController.selectedEstado == null ? null : (v) => _zonesController.selectMunicipio(v),
                        ),
                        const SizedBox(height: 12),
                        DropdownButtonFormField<String>(
                          value: _zonesController.selectedParroquia,
                          decoration: const InputDecoration(labelText: 'Parroquia / Sector', prefixIcon: Icon(Icons.location_on)),
                          items: _zonesController.parroquias.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                          onChanged: _zonesController.selectedMunicipio == null ? null : (v) => _zonesController.selectParroquia(v),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: _usarUbicacionZona,
                            child: const Text('Usar esta zona'),
                          ),
                        ),
                      ],

                      const SizedBox(height: 24),
                      const Text('O también:', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)),
                      const SizedBox(height: 8),
                      
                      // OPCIÓN MAPA MANUAL
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(backgroundColor: AppColors.darkCardColor),
                          onPressed: _seleccionarUbicacionMapa,
                          icon: const Icon(Icons.map_outlined, color: AppColors.white),
                          label: const Text('Seleccionar en el Mapa Manualmente', style: TextStyle(color: AppColors.white)),
                        ),
                      ),

                      if (_lat != null && _lng != null) ...[
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(color: AppColors.success.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: [
                              const Icon(Icons.check_circle, color: AppColors.success),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text('Ubicación elegida: $_sectorTexto\n(Lat: ${_lat!.toStringAsFixed(4)}, Lng: ${_lng!.toStringAsFixed(4)})', style: const TextStyle(fontSize: 12, color: AppColors.success)),
                              ),
                            ],
                          ),
                        ),
                      ],

                      const SizedBox(height: 24),
                      
                      // FECHA
                      ListTile(
                        leading: const Icon(Icons.calendar_today, color: AppColors.primaryPurple),
                        title: const Text('Fecha de Compra', style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('${_fechaCompra.day}/${_fechaCompra.month}/${_fechaCompra.year}'),
                        trailing: const Icon(Icons.edit, color: Colors.grey),
                        onTap: () async {
                          final now = DateTime.now();
                          final today = DateTime(now.year, now.month, now.day);

                          final date = await showDatePicker(
                            context: context,
                            initialDate: _fechaCompra,
                            firstDate: today,
                            lastDate: today.add(const Duration(days: 30)),
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
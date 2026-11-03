import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PlanificarCompraScreen extends StatefulWidget {
  const PlanificarCompraScreen({super.key});

  @override
  State<PlanificarCompraScreen> createState() => _PlanificarCompraScreenState();
}

class _PlanificarCompraScreenState extends State<PlanificarCompraScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = false;
  
  // Lista dinámica de productos
  final List<Map<String, dynamic>> _items = [
    {'nombre': '', 'cantidad': '1', 'descripcion': ''}
  ];

  String _sector = 'Mi ubicación actual (1000m a la redonda)';
  DateTime _fechaCompra = DateTime.now().add(const Duration(days: 1));
  
  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

  void _agregarItem() {
    setState(() {
      _items.add({'nombre': '', 'cantidad': '1', 'descripcion': ''});
    });
  }

  void _eliminarItem(int index) {
    if (_items.length > 1) {
      setState(() => _items.removeAt(index));
    }
  }

  Future<void> _generarPlanificacion() async {
    // Validar que al menos un producto tenga nombre
    if (_items.every((item) => item['nombre'].toString().trim().isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Agrega al menos un producto a tu lista.'), backgroundColor: Colors.orange),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final userId = _supabase.auth.currentUser!.id;
      
      // Simulamos que ya tenemos la lat/lng del cliente (en producción se usa Geolocator)
      final latCliente = 10.4806; 
      final lngCliente = -66.9036;

      // 1. Guardar la Planificación en la Base de Datos
      final response = await _supabase.from('planes_compra').insert({
        'usuario_id': userId,
        'tipo_plan': 'Optimizado',
        'items_solicitados': _items,
        'estado': 'Buscando ofertas',
        'fecha_planificada': _fechaCompra.toIso8601String(),
        'sector_busqueda': _sector,
        'latitud_centro': latCliente,
        'longitud_centro': lngCliente,
        'radio_metros': 1000,
      }).select('id').single();

      final planId = response['id'];

      // 2. Motor de Búsqueda Inteligente (Llamamos a la función RPC de PostGIS)
      final ofertasCercanas = await _supabase.rpc('obtener_ofertas_cercanas', params: {
        'lat': latCliente,
        'lng': lngCliente,
        'radio_metros': 1000
      });

      // 3. Cruzamos la lista de deseos con las ofertas encontradas (Lógica de Negocio)
      // En un caso real, esto se procesa en el Backend (Edge Function) para mayor eficiencia.
      List<Map<String, dynamic>> resultados = [];
      
      for (var item in _items) {
        final nombreBuscado = item['nombre'].toString().toLowerCase();
        // Buscamos la oferta más barata que coincida
        final mejorOferta = ofertasCercanas.firstWhere(
          (o) => o['nombre_oferta'].toString().toLowerCase().contains(nombreBuscado), 
          orElse: () => null
        );

        if (mejorOferta != null) {
          resultados.add({
            'item': item,
            'oferta': mejorOferta
          });
        }
      }

      // 4. Si encontramos todas las ofertas, notificamos al cliente inmediatamente
      if (resultados.length == _items.length) {
        await _supabase.from('planes_compra').update({'estado': 'Ofertas Encontradas'}).eq('id', planId);
        
        // Guardamos temporalmente el resultado en el SharedPreferences o pasamos a la pantalla de resultados
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => PlanResultsScreen(planId: planId, resultados: resultados))
          );
        }
      } else {
        // Si faltan productos, queda en "Buscando ofertas" y se notifica después
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Búsqueda en proceso. Te notificaremos cuando encontremos todos los productos al mejor precio.'), backgroundColor: Colors.blue),
          );
          Navigator.pop(context);
        }
      }
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
        title: const Text('Planificar mi Compra', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _isLoading 
        ? Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: primaryPurple),
              const SizedBox(height: 20),
              const Text('La IA está buscando los precios más bajos en tu zona...', style: TextStyle(color: Colors.black54)),
            ],
          ))
        : SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                  child: const Text(
                    'Dinos qué necesitas y nuestro motor buscará los precios más bajos en un radio de 1000 metros a la redonda.',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 20),

                // Lista de productos dinámica
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
                                  decoration: const InputDecoration(labelText: 'Producto (Ej: Harina PAN)', isDense: true),
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
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _eliminarItem(index),
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            initialValue: item['descripcion'],
                            decoration: const InputDecoration(labelText: 'Descripción / Marca (Opcional)', isDense: true),
                            onChanged: (v) => item['descripcion'] = v,
                          ),
                        ],
                      ),
                    ),
                  );
                }),

                TextButton.icon(
                  onPressed: _agregarItem,
                  icon: Icon(Icons.add, color: primaryPurple),
                  label: Text('Agregar otro producto', style: TextStyle(color: primaryPurple)),
                ),

                const SizedBox(height: 24),
                const Divider(),
                const SizedBox(height: 24),

                // Ubicación
                ListTile(
                  leading: Icon(Icons.location_on, color: primaryPurple),
                  title: const Text('Sector de Búsqueda', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(_sector),
                  trailing: const Icon(Icons.map, color: Colors.grey),
                  onTap: () {
                    // Aquí abrirías el MapPickerScreen para definir el centro
                  },
                ),
                
                const SizedBox(height: 16),
                
                // Fecha
                ListTile(
                  leading: Icon(Icons.calendar_today, color: primaryPurple),
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
                      backgroundColor: primaryPurple,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: _generarPlanificacion,
                    icon: const Icon(Icons.auto_awesome, color: Colors.white),
                    label: const Text('Buscar Ofertas', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

// --- PANTALLA DE RESULTADOS (Notificación en App) ---
class PlanResultsScreen extends StatelessWidget {
  final String planId;
  final List<Map<String, dynamic>> resultados;

  const PlanResultsScreen({super.key, required this.planId, required this.resultados});

  @override
  Widget build(BuildContext context) {
    final Color primaryPurple = const Color(0xFF6B4EFF);
    
    double totalUsd = 0;
    for (var r in resultados) {
      totalUsd += (r['oferta']['precio'] as num).toDouble();
    }

    return Scaffold(
      backgroundColor: const Color(0xFFECE2FC),
      appBar: AppBar(
        title: const Text('¡Ofertas Encontradas!', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                const Icon(Icons.check_circle, color: Colors.white, size: 40),
                const SizedBox(height: 8),
                const Text('¡Hemos encontrado todos tus productos al mejor precio!', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),
                Text('Total: \$${totalUsd.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          
          ...resultados.map((r) {
            final oferta = r['oferta'];
            final item = r['item'];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: primaryPurple.withOpacity(0.1),
                      child: Icon(Icons.store, color: primaryPurple),
                    ),
                    title: Text(oferta['nombre_comercio'], style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(oferta['direccion']),
                    trailing: Text('\$${oferta['precio']}', style: TextStyle(color: primaryPurple, fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${item['cantidad']}x ${item['nombre']}', style: const TextStyle(fontWeight: FontWeight.w500)),
                        TextButton.icon(
                          onPressed: () {
                            // Aquí abrirías la URL de Google Maps
                            // launchUrl(Uri.parse('https://www.google.com/maps/search/?api=1&query=${oferta['latitud']},${oferta['longitud']}'));
                          },
                          icon: const Icon(Icons.map, size: 16),
                          label: const Text('Ver en Maps'),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: primaryPurple),
                        onPressed: () {
                          // Lógica para generar el QR de ESTE producto específico
                        },
                        child: const Text('Comprar este producto', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
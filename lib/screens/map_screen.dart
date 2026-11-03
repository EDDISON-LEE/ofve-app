import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

enum MapLayerType { osm, relieve, satelite }

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  final TextEditingController _searchController = TextEditingController();
  
  LatLng _currentCenter = const LatLng(10.4806, -66.9036); 
  LatLng? _userLocation; // Guardamos la ubicación real del usuario aquí
  
  List<Marker> _markers = [];
  List<LatLng> _routePoints = []; // Aquí guardaremos la línea de la ruta
  
  bool _isLoading = true;
  bool _isFetchingRoute = false; // Para saber si estamos trazando la ruta
  String? _errorMessage;
  
  double _radioMetros = 500.0; 
  MapLayerType _currentLayer = MapLayerType.osm;

  String _selectedCategory = "Todos";
  String _searchQuery = "";
  final List<String> _categories = ["Todos", "Alimentos", "Bebidas", "Limpieza", "Cuidado Personal", "Hogar", "Salud"];

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedCategory = prefs.getString('map_category_pref');
    
    if (savedCategory == null) {
      final user = Supabase.instance.client.auth.currentUser;
      final prefsFromUser = user?.userMetadata?['preferencias'];
      if (prefsFromUser != null && prefsFromUser is List && prefsFromUser.isNotEmpty) {
        savedCategory = prefsFromUser.first; 
      }
    }

    setState(() {
      _selectedCategory = savedCategory ?? "Todos";
    });
    _initLocation();
  }

  Future<void> _savePreference(String category) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('map_category_pref', category);
  }

  Future<void> _initLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _loadOfertas(_currentCenter);
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _loadOfertas(_currentCenter); 
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _loadOfertas(_currentCenter);
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
      ).timeout(const Duration(seconds: 8));

      setState(() {
        _userLocation = LatLng(position.latitude, position.longitude);
        _currentCenter = _userLocation!;
      });
      
      _mapController.move(_currentCenter, 15.0);
      _loadOfertas(_currentCenter);
    } catch (e) {
      debugPrint("Error obteniendo GPS: $e");
      _loadOfertas(_currentCenter); 
    }
  }

  Future<void> _loadOfertas(LatLng center) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _routePoints.clear(); // Limpiamos la ruta anterior si se buscan nuevas ofertas
    });

    try {
      final url = Uri.parse(
        "https://ofve-api.eddisongabrielrodriguez.workers.dev/?lat=${center.latitude}&lon=${center.longitude}&radio=${_radioMetros.toInt()}&categoria=$_selectedCategory&search=$_searchQuery"
      );
      
      final response = await http.get(url).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List<dynamic> ofertas = json.decode(response.body);
        
        setState(() {
          _markers = ofertas.map((oferta) {
            final lat = oferta['latitud'] ?? center.latitude; 
            final lon = oferta['longitud'] ?? center.longitude;

            return Marker(
              point: LatLng(lat.toDouble(), lon.toDouble()),
              width: 80,
              height: 80,
              child: GestureDetector(
                onTap: () => _showOfertaDetails(oferta),
                child: const Icon(Icons.location_on, color: Color(0xFF6B4EFF), size: 40),
              ),
            );
          }).toList();
        });
      } else {
        setState(() => _errorMessage = "Error del servidor: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error cargando mapa: $e");
      setState(() => _errorMessage = "No se pudieron cargar las ofertas. Revisa tu conexión.");
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  // --- TRAZAR LA RUTA USANDO OSRM ---
  Future<void> _drawRoute(LatLng start, LatLng end) async {
    setState(() => _isFetchingRoute = true);
    
    try {
      // Llamada a la API pública de OSRM (Gratuita y sin API Key)
      final url = Uri.parse(
          'https://router.project-osrm.org/route/v1/driving/${start.longitude},${start.latitude};${end.longitude},${end.latitude}?overview=full&geometries=geojson');
      
      final response = await http.get(url);
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final coordinates = data['routes'][0]['geometry']['coordinates'] as List;
        
        // OSRM devuelve las coordenadas en [Longitud, Latitud]. Debemos invertirlas.
        final List<LatLng> newRoute = coordinates.map((coord) {
          return LatLng(coord[1].toDouble(), coord[0].toDouble());
        }).toList();

        setState(() {
          _routePoints = newRoute;
          _isFetchingRoute = false;
        });

        // Hacer zoom para que la ruta quepa en la pantalla
        final bounds = LatLngBounds.fromPoints(_routePoints);
        _mapController.fitCamera(CameraFit.bounds(
          bounds: bounds,
          padding: const EdgeInsets.all(50.0), // Margen de 50px alrededor de la ruta
        ));

      } else {
        throw Exception("No se pudo trazar la ruta");
      }
    } catch (e) {
      debugPrint("Error dibujando ruta: $e");
      setState(() => _isFetchingRoute = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se pudo calcular la ruta. Intenta de nuevo.')),
        );
      }
    }
  }

  // --- VENTANA DE DETALLES DE LA OFERTA ---
  void _showOfertaDetails(dynamic oferta) {
    final LatLng comercioLocation = LatLng(
      (oferta['latitud'] ?? 10.4806).toDouble(), 
      (oferta['longitud'] ?? -66.9036).toDouble()
    );
    
    // Asumiendo que tu base de datos envía 'direccion'. Si no, pon un texto por defecto.
    final String direccion = oferta['direccion'] ?? 'Dirección no registrada';

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 280, // Ventana un poco más alta para acomodar la dirección
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(oferta['producto_nombre'] ?? 'Oferta Especial', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF2D3A5A))),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.store, color: Colors.grey, size: 18),
                  const SizedBox(width: 5),
                  Text(oferta['comercio_nombre'] ?? 'Comercio', style: const TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.map, color: Colors.grey, size: 18),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(direccion, style: const TextStyle(fontSize: 14, color: Colors.grey), maxLines: 2, overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${oferta['precio_oferta'] ?? '0.00'}', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Colors.green)),
                  
                  // BOTÓN DE CÓMO LLEGAR
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6B4EFF),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Cerrar la ventana de detalles
                      
                      if (_userLocation != null) {
                        _drawRoute(_userLocation!, comercioLocation);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Necesitamos tu ubicación GPS para trazar la ruta.')),
                        );
                      }
                    },
                    icon: const Icon(Icons.directions, color: Colors.white),
                    label: const Text('Cómo llegar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ofertas Cercanas'),
        backgroundColor: const Color(0xFF2D3A5A),
        foregroundColor: Colors.white,
        actions: [
          PopupMenuButton<MapLayerType>(
            icon: const Icon(Icons.layers),
            onSelected: (layer) => setState(() => _currentLayer = layer),
            itemBuilder: (context) => [
              const PopupMenuItem(value: MapLayerType.osm, child: Text('Estándar')),
              const PopupMenuItem(value: MapLayerType.relieve, child: Text('Relieve')),
              const PopupMenuItem(value: MapLayerType.satelite, child: Text('Satélite')),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // --- BUSCADOR ---
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar producto...',
                prefixIcon: const Icon(Icons.search, color: Color(0xFF6B4EFF)),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear, color: Colors.grey),
                  onPressed: () {
                    _searchController.clear();
                    setState(() => _searchQuery = "");
                    _loadOfertas(_currentCenter);
                  },
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                filled: true,
                fillColor: const Color(0xFFF5F3FF),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
              onSubmitted: (value) {
                setState(() => _searchQuery = value);
                _loadOfertas(_currentCenter);
              },
            ),
          ),

          // --- BARRA DE CATEGORÍAS ---
          Container(
            color: Colors.white,
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final cat = _categories[index];
                final isSelected = _selectedCategory == cat;
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                  child: ChoiceChip(
                    label: Text(cat),
                    selected: isSelected,
                    selectedColor: const Color(0xFF6B4EFF),
                    labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black87),
                    onSelected: (selected) {
                      if (selected) {
                        setState(() => _selectedCategory = cat);
                        _savePreference(cat);
                        _loadOfertas(_currentCenter);
                      }
                    },
                  ),
                );
              },
            ),
          ),

          // --- SLIDER DE RADIO ---
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              children: [
                const Icon(Icons.radar, color: Color(0xFF6B4EFF)),
                const SizedBox(width: 8),
                Expanded(
                  child: Slider(
                    value: _radioMetros,
                    min: 500,
                    max: 5000,
                    divisions: 9,
                    label: '${_radioMetros.toInt()} m',
                    onChanged: (value) => setState(() => _radioMetros = value),
                    onChangeEnd: (value) => _loadOfertas(_currentCenter),
                  ),
                ),
                Text('${_radioMetros.toInt()}m', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2D3A5A))),
              ],
            ),
          ),
          
          // --- MAPA ---
          Expanded(
            child: Stack(
              children: [
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: _currentCenter,
                    initialZoom: 14.0,
                    onPositionChanged: (position, hasGesture) {
                      if (hasGesture) setState(() => _currentCenter = position.center);
                    },
                  ),
                  children: [
                    // Capas del mapa
                    if (_currentLayer == MapLayerType.osm)
                      TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', userAgentPackageName: 'com.ofve.app')
                    else if (_currentLayer == MapLayerType.relieve)
                      TileLayer(urlTemplate: 'https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', subdomains: const ['a', 'b', 'c'], userAgentPackageName: 'com.ofve.app')
                    else if (_currentLayer == MapLayerType.satelite)
                      TileLayer(urlTemplate: 'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', userAgentPackageName: 'com.ofve.app'),
                    
                    // Línea de la ruta
                    if (_routePoints.isNotEmpty)
                      PolylineLayer(
                        polylines: [
                          Polyline(
                            points: _routePoints,
                            strokeWidth: 5.0,
                            color: const Color(0xFF6B4EFF), // Morado de OfVe
                          ),
                        ],
                      ),

                    // Pines de las ofertas
                    MarkerLayer(markers: _markers),

                    // Pin de la ubicación del usuario (Opcional)
                    if (_userLocation != null)
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: _userLocation!,
                            width: 40,
                            height: 40,
                            child: const Icon(Icons.my_location, color: Colors.blue, size: 30),
                          ),
                        ],
                      ),
                  ],
                ),
                
                // Cargando ofertas
                if (_isLoading)
                  const Positioned(
                    top: 20, left: 0, right: 0,
                    child: Center(
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)),
                              SizedBox(width: 10),
                              Text('Buscando ofertas...'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                
                // Cargando ruta
                if (_isFetchingRoute)
                  Positioned(
                    bottom: 20, left: 0, right: 0,
                    child: Center(
                      child: Card(
                        color: const Color(0xFF2D3A5A),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)),
                              SizedBox(width: 10),
                              Text('Trazando ruta...', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                // Mensajes de error
                if (_errorMessage != null)
                  Positioned(
                    top: 10, left: 10, right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(10)),
                      child: Text(_errorMessage!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF6B4EFF),
        onPressed: () => _loadOfertas(_currentCenter),
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }
}
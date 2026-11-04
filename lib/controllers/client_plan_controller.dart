import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientPlanController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = false;
  String? errorMessage;
  
  List<Map<String, dynamic>> resultados = [];
  double totalEstimado = 0.0;

  Future<bool> generarPlanificacion({
    required List<Map<String, dynamic>> items,
    required double lat,
    required double lng,
    required DateTime fechaCompra,
    required String sectorTexto, // <-- NUEVO PARÁMETRO
  }) async {
    isLoading = true;
    errorMessage = null;
    resultados.clear();
    totalEstimado = 0.0;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;

      // 1. Guardar el plan en la base de datos
      await _supabase.from('planes_compra').insert({
        'usuario_id': userId,
        'items_solicitados': items,
        'estado': 'Buscando ofertas',
        'fecha_planificada': fechaCompra.toIso8601String(),
        'latitud_centro': lat,
        'longitud_centro': lng,
        'radio_metros': 5000, // Aumentado a 5KM para abarcar más
        'sector_busqueda': sectorTexto, // <-- SE GUARDA EL TEXTO
      });

      // 2. Obtener todas las ofertas cercanas usando la función RPC
      final ofertasCercanas = await _supabase.rpc('obtener_ofertas_cercanas', params: {
        'lat': lat,
        'lng': lng,
        'radio_metros': 5000,
      });

      if (ofertasCercanas == null || (ofertasCercanas as List).isEmpty) {
        throw Exception('No hay ofertas disponibles en un radio de 5KM desde esta ubicación.');
      }

      // 3. Cruzar los items solicitados con las ofertas encontradas (Búsqueda inteligente)
      for (var item in items) {
        final nombreBuscado = item['nombre'].toString().toLowerCase().trim();
        if (nombreBuscado.isEmpty) continue;

        final palabrasBusqueda = nombreBuscado.split(' ').where((p) => p.length > 2).toList();
        if (palabrasBusqueda.isEmpty) palabrasBusqueda.add(nombreBuscado);

        final mejoresOfertas = ofertasCercanas.where((o) {
          final nombreOferta = (o['nombre_oferta'] ?? '').toString().toLowerCase();
          return palabrasBusqueda.any((palabra) => nombreOferta.contains(palabra));
        }).toList();

        if (mejoresOfertas.isNotEmpty) {
          mejoresOfertas.sort((a, b) => (a['precio'] as num).compareTo(b['precio'] as num));
          
          final mejor = mejoresOfertas.first;
          final precio = (mejor['precio'] as num).toDouble();
          final cantidad = int.tryParse(item['cantidad'].toString()) ?? 1;

          resultados.add({
            'item_solicitado': item,
            'oferta': mejor,
            'subtotal': precio * cantidad,
          });

          totalEstimado += precio * cantidad;
        } else {
          resultados.add({
            'item_solicitado': item,
            'oferta': null, 
            'subtotal': 0.0,
          });
        }
      }

      return true;
    } catch (e) {
      errorMessage = e.toString().replaceAll('Exception: ', '');
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientPlanController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = false;
  String? errorMessage;
  
  // Resultados de la búsqueda
  List<Map<String, dynamic>> resultados = [];
  double totalEstimado = 0.0;

  Future<bool> generarPlanificacion({
    required List<Map<String, dynamic>> items,
    required double lat,
    required double lng,
    required DateTime fechaCompra,
  }) async {
    isLoading = true;
    errorMessage = null;
    resultados.clear();
    totalEstimado = 0.0;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;

      // 1. Guardar el plan en la base de datos (Opcional, para historial)
      await _supabase.from('planes_compra').insert({
        'usuario_id': userId,
        'items_solicitados': items,
        'estado': 'Buscando ofertas',
        'fecha_planificada': fechaCompra.toIso8601String(),
        'latitud_centro': lat,
        'longitud_centro': lng,
        'radio_metros': 1000,
      });

      // 2. Obtener todas las ofertas cercanas en 1KM usando nuestra función RPC
      final ofertasCercanas = await _supabase.rpc('obtener_ofertas_cercanas', params: {
        'lat': lat,
        'lng': lng,
        'radio_metros': 1000,
      });

      if (ofertasCercanas == null || (ofertasCercanas as List).isEmpty) {
        throw Exception('No hay ofertas disponibles en un radio de 1KM.');
      }

      // 3. Cruzar los items solicitados con las ofertas encontradas
      for (var item in items) {
        final nombreBuscado = item['nombre'].toString().toLowerCase();
        
        // Buscar la oferta más barata que coincida con el nombre
        final mejoresOfertas = ofertasCercanas.where((o) => 
          o['nombre_oferta'].toString().toLowerCase().contains(nombreBuscado)
        ).toList();

        if (mejoresOfertas.isNotEmpty) {
          // Como ya vienen ordenadas por precio desde el RPC, la primera es la más barata
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
            'oferta': null, // No se encontró
            'subtotal': 0.0,
          });
        }
      }

      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
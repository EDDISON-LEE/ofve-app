import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GuidedPurchaseController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = false;
  String? errorMessage;
  
  List<Map<String, dynamic>> optimizedBasket = [];
  List<Map<String, dynamic>> outOfBudgetItems = [];
  double totalSpent = 0.0;

  Future<bool> optimizeBasket({
    required double budget,
    required String category,
    required List<Map<String, dynamic>> requestedItems,
  }) async {
    isLoading = true;
    errorMessage = null;
    optimizedBasket.clear();
    outOfBudgetItems.clear();
    totalSpent = 0.0;
    notifyListeners();

    try {
      // 1. Obtener todas las ofertas activas de la categoría
      final response = await _supabase
          .from('ofertas')
          .select('*')
          .eq('estado', 'Activa')
          .eq('categoria', category);

      List<dynamic> allOffers = response;
      
      if (allOffers.isEmpty) {
        throw Exception('No hay ofertas disponibles en esta categoría.');
      }

      // 2. Encontrar la oferta más barata para cada producto solicitado
      List<Map<String, dynamic>> availableItems = [];

      for (var requested in requestedItems) {
        final productName = requested['nombre'].toString().toLowerCase();
        final quantity = int.tryParse(requested['cantidad'].toString()) ?? 1;

        // Filtrar ofertas que coincidan con el nombre
        final matches = allOffers.where((o) => 
          o['producto_nombre'].toString().toLowerCase().contains(productName)
        ).toList();

        if (matches.isNotEmpty) {
          // Ordenar para encontrar el más barato
          matches.sort((a, b) {
            final priceA = (a['precio_oferta'] as num?)?.toDouble() ?? (a['precio_regular'] as num).toDouble();
            final priceB = (b['precio_oferta'] as num?)?.toDouble() ?? (b['precio_regular'] as num).toDouble();
            return priceA.compareTo(priceB);
          });

          final cheapest = matches.first;
          final unitPrice = (cheapest['precio_oferta'] as num?)?.toDouble() ?? (cheapest['precio_regular'] as num).toDouble();
          final totalCost = unitPrice * quantity;

          availableItems.add({
            'oferta': cheapest,
            'requested_qty': quantity,
            'unit_price': unitPrice,
            'total_cost': totalCost,
          });
        }
      }

      // 3. Aplicar Algoritmo Voraz (Greedy): Ordenar por costo total (más baratos primero)
      availableItems.sort((a, b) => (a['total_cost'] as double).compareTo(b['total_cost'] as double));

      double currentSpent = 0.0;

      for (var item in availableItems) {
        final cost = item['total_cost'] as double;

        if (currentSpent + cost <= budget) {
          optimizedBasket.add(item);
          currentSpent += cost;
        } else {
          // Si no cabe, intentar comprar menos unidades
          final unitPrice = item['unit_price'] as double;
          int affordableQty = ((budget - currentSpent) / unitPrice).floor();

          if (affordableQty > 0) {
            item['requested_qty'] = affordableQty; // Reducir cantidad
            item['total_cost'] = unitPrice * affordableQty;
            optimizedBasket.add(item);
            currentSpent += (unitPrice * affordableQty);
          } else {
            outOfBudgetItems.add(item);
          }
        }
      }

      totalSpent = currentSpent;
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

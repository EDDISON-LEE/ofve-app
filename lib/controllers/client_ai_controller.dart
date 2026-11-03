import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientAiController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = false;
  String? aiMessage;
  List<dynamic> recommendedOffers = [];
  String? errorMessage;

  Future<void> askAssistant(String prompt) async {
    if (prompt.trim().isEmpty) return;

    isLoading = true;
    errorMessage = null;
    aiMessage = null;
    recommendedOffers.clear();
    notifyListeners();

    try {
      // 1. Llamar a la Edge Function
      final response = await _supabase.functions.invoke(
        'client-ai-assistant',
        body: {'prompt': prompt},
      );

      if (response.status != 200) {
        throw Exception('Error en el servidor');
      }

      final data = response.data;
      aiMessage = data['message'];
      final List<String> ids = List<String>.from(data['recommended_ids'] ?? []);

      // 2. Si la IA recomendó productos, los buscamos en la base de datos
      if (ids.isNotEmpty) {
        final offersRes = await _supabase
            .from('ofertas')
            .select('*')
            .inFilter('id', ids);
        recommendedOffers = offersRes;
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
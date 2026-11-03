import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AiAssistantController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = false;
  String? generatedDescription;
  String? errorMessage;

  Future<void> generateDescription({required String productName, required String category}) async {
    isLoading = true;
    errorMessage = null;
    generatedDescription = null;
    notifyListeners();

    try {
      final response = await _supabase.functions.invoke(
        'generate-offer-description',
        body: {
          'product_name': productName,
          'category': category,
        },
      );

      if (response.status == 200 && response.data != null) {
        generatedDescription = response.data['description'];
      } else {
        throw Exception('La IA no pudo generar el texto.');
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
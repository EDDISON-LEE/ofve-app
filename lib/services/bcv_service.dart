import 'dart:convert';
import 'package:http/http.dart' as http;

class BcvService {
  // Usamos DolarAPI que es más estable
  static const String _baseUrl = 'https://ve.dolarapi.com/v1/dolares/oficial';

  static Future<double> getDollarRate() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl)).timeout(
        const Duration(seconds: 10),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // La API devuelve: { "fuente": "oficial", "nombre": "Oficial", "promedio": 36.50, ... }
        final double rate = (data['promedio'] as num).toDouble();
        return rate;
      } else {
        throw Exception('Error HTTP: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('No se pudo conectar con la tasa BCV: $e');
    }
  }
}
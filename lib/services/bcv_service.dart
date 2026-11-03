import 'dart:convert';
import 'package:http/http.dart' as http;

class BcvService {
  // Endpoint público y gratuito de Crom Studio (sin API Key)
  static const String _baseUrl = 'https://datos.cromstudio.com.ve/tasa';

  /// Obtiene la tasa oficial del dólar (USD) según el BCV.
  /// Devuelve el valor numérico o lanza una excepción si falla.
  static Future<double> getDollarRate() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // La estructura es: { "tasas": { "USD": 857.8876, "EUR": ... } }
        final double rate = (data['tasas']['USD'] as num).toDouble();
        return rate;
      } else {
        throw Exception('Error al obtener la tasa BCV. Código: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('No se pudo conectar con el servicio de tasa BCV: $e');
    }
  }
}
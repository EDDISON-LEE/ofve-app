import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:supabase_flutter/supabase_flutter.dart';

class VoiceOfferController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;
  final stt.SpeechToText _speech = stt.SpeechToText();

  bool isListening = false;
  bool isLoading = false;
  String transcript = '';
  String? errorMessage;
  bool isSuccess = false;

  Future<void> startListening() async {
    errorMessage = null;
    isSuccess = false;
    
    bool available = await _speech.initialize(
      onError: (val) => debugPrint('Error en voz: $val'),
      onStatus: (val) {
        if (val == 'done' || val == 'notListening') {
          isListening = false;
          notifyListeners();
        }
      },
    );

    if (available) {
      isListening = true;
      notifyListeners();
      
      _speech.listen(
        onResult: (val) {
          transcript = val.recognizedWords;
          notifyListeners();
        },
        localeId: 'es_ES', // Idioma español
        listenMode: stt.ListenMode.dictation,
      );
    } else {
      errorMessage = 'El micrófono no está disponible o no se dieron permisos.';
      notifyListeners();
    }
  }

  void stopListening() {
    _speech.stop();
    isListening = false;
    notifyListeners();
  }

  Future<bool> publishFastOffer() async {
    if (transcript.trim().isEmpty) {
      errorMessage = 'No hay texto para publicar.';
      notifyListeners();
      return false;
    }

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      final comercioData = await _supabase.from('comercios').select('id, categoria').eq('usuario_id', userId).single();
      final comercioId = comercioData['id'];
      final categoria = comercioData['categoria'] ?? 'Otros';

      // Guardamos la transcripción como descripción y un nombre genérico por defecto
      await _supabase.from('ofertas').insert({
        'comercio_id': comercioId,
        'producto_nombre': 'Oferta por Voz (${DateTime.now().hour}:${DateTime.now().minute})',
        'descripcion': transcript.trim(),
        'categoria': categoria,
        'precio_regular': 0.0, // Por defecto, el comercio debe editarlo luego
        'precio_oferta': 0.0,
        'es_oferta': false, // Se crea como inventario hasta que se edite
        'stock': 1,
        'estado': 'Activo',
        'fecha_inicio': DateTime.now().toIso8601String(),
      });

      isSuccess = true;
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _speech.stop();
    super.dispose();
  }
}
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
    notifyListeners();
    
    try {
      bool available = await _speech.initialize(
        onError: (val) {
          errorMessage = 'Error de voz: ${val.errorMsg}';
          isListening = false;
          notifyListeners();
        },
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
        
        await _speech.listen(
          onResult: (val) {
            transcript = val.recognizedWords;
            notifyListeners();
          },
          // NUEVA API: Opciones encapsuladas
          listenOptions: stt.SpeechListenOptions(
            partialResults: true,
            cancelOnError: true,
            listenMode: stt.ListenMode.dictation,
          ),
          localeId: 'es_ES', 
        );
      } else {
        errorMessage = 'Permiso de micrófono denegado o no disponible.';
        notifyListeners();
      }
    } catch (e) {
      errorMessage = 'Error al iniciar el micrófono: $e';
      isListening = false;
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
      errorMessage = 'No hay texto para publicar. Dicta algo primero.';
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

      await _supabase.from('ofertas').insert({
        'comercio_id': comercioId,
        'producto_nombre': 'Oferta por Voz (${DateTime.now().hour}:${DateTime.now().minute})',
        'descripcion': transcript.trim(),
        'categoria': categoria,
        'precio_regular': 0.0,
        'precio_oferta': 0.0,
        'es_oferta': false,
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
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:web/web.dart' as web;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AsistenteIAScreen extends StatefulWidget {
  const AsistenteIAScreen({super.key});

  @override
  State<AsistenteIAScreen> createState() => _AsistenteIAScreenState();
}

class _AsistenteIAScreenState extends State<AsistenteIAScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [
    {'role': 'ai', 'text': '¡Hola! Soy tu asistente OfVe. ¿Qué producto estás buscando hoy?'}
  ];
  bool _isTyping = false;
  
  // Variable para mostrar el nombre de la IA activa
  String _currentProviderName = "IA";
  
  final _storage = const FlutterSecureStorage(); 
  final stt.SpeechToText _speech = stt.SpeechToText();
  final FlutterTts _flutterTts = FlutterTts();
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _initTts();
    _loadProviderName(); // Carga el nombre del proveedor al iniciar
  }

  Future<void> _initTts() async {
    await _flutterTts.setLanguage("es-MX");
    await _flutterTts.setSpeechRate(0.6);
    await _flutterTts.setPitch(1.1);
  }

  Future<void> _loadProviderName() async {
    final provider = await _storage.read(key: 'ai_provider') ?? 'gemini';
    if (mounted) {
      setState(() {
        if (provider == 'openai') _currentProviderName = "ChatGPT";
        else if (provider == 'anthropic') _currentProviderName = "Claude";
        else _currentProviderName = "Gemini";
      });
    }
  }

  Future<void> _speak(String text) async {
    if (kIsWeb) {
      final utterance = web.SpeechSynthesisUtterance(text);
      utterance.lang = 'es-MX';
      utterance.rate = 1.3;
      utterance.pitch = 1.1;
      utterance.volume = 1.0;
      
      web.window.speechSynthesis.cancel();
      web.window.speechSynthesis.speak(utterance);
    } else {
      await _flutterTts.speak(text);
    }
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _controller.text = val.recognizedWords;
          }),
          localeId: 'es_MX',
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  Future<void> _sendMessage() async {
    if (_controller.text.isEmpty) return;

    final userText = _controller.text;
    setState(() {
      _messages.add({'role': 'user', 'text': userText});
      _isTyping = true;
    });
    _controller.clear();

    try {
      // LEEMOS LA CONFIGURACIÓN DEL USUARIO
      final provider = await _storage.read(key: 'ai_provider') ?? 'gemini';
      final userApiKey = await _storage.read(key: 'ai_api_key');

      if (userApiKey == null || userApiKey.isEmpty) {
        setState(() {
          _messages.add({'role': 'ai', 'text': 'Por favor, toca el avatar en el inicio y configura tu API Key.'});
          _isTyping = false;
        });
        return;
      }

      final response = await http.post(
        Uri.parse("https://ofve-api.eddisongabrielrodriguez.workers.dev/chat"),
        headers: {
          "Content-Type": "application/json",
          "x-ai-provider": provider,
          "x-user-api-key": userApiKey,
        },
        body: jsonEncode({
          "mensaje": userText,
          "lat": 10.4806,
          "lon": -66.9036
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final respuestaIA = data['respuesta'];
        setState(() {
          _messages.add({'role': 'ai', 'text': respuestaIA});
        });
        await _speak(respuestaIA);
      } else {
        final errorData = jsonDecode(response.body);
        final errorMsg = errorData['error'] ?? 'Error desconocido';
        
        // Manejo de errores amigable para el usuario
        String userFriendlyError = errorMsg;
        if (errorMsg.contains("401") || errorMsg.toLowerCase().contains("api key") || errorMsg.toLowerCase().contains("invalid")) {
           userFriendlyError = "Tu API Key de $_currentProviderName parece ser inválida. Por favor, revísala en los ajustes.";
        }

        setState(() {
          _messages.add({'role': 'ai', 'text': '⚠️ $userFriendlyError'});
        });
      }
    } catch (e) {
      setState(() {
        _messages.add({'role': 'ai', 'text': 'Error de red. Revisa tu conexión.'});
      });
    } finally {
      setState(() => _isTyping = false);
    }
  }

  @override
  void dispose() {
    _speech.stop();
    _flutterTts.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asistente OfVe IA'),
        backgroundColor: const Color(0xFF2D3A5A),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isUser = msg['role'] == 'user';
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: isUser ? const Color(0xFF6B4EFF) : Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16),
                        topRight: const Radius.circular(16),
                        bottomLeft: isUser ? const Radius.circular(16) : const Radius.circular(0),
                        bottomRight: isUser ? const Radius.circular(0) : const Radius.circular(16),
                      ),
                      boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 5)],
                    ),
                    child: Text(
                      msg['text']!,
                      style: TextStyle(color: isUser ? Colors.white : Colors.black87, fontSize: 15),
                    ),
                  ),
                );
              },
            ),
          ),
          if (_isTyping)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$_currentProviderName está pensando...', 
                style: const TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)
              ),
            ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.white,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: _isListening ? Colors.red : Colors.grey.shade200,
                  child: IconButton(
                    icon: Icon(_isListening ? Icons.stop : Icons.mic, color: _isListening ? Colors.white : const Color(0xFF6B4EFF)),
                    onPressed: _listen,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Escribe o dicta tu pregunta...',
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: const Color(0xFF6B4EFF),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
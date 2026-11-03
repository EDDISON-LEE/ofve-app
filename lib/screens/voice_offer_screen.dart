import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/voice_offer_controller.dart';

class VoiceOfferScreen extends StatefulWidget {
  const VoiceOfferScreen({super.key});

  @override
  State<VoiceOfferScreen> createState() => _VoiceOfferScreenState();
}

class _VoiceOfferScreenState extends State<VoiceOfferScreen> {
  final _voiceController = VoiceOfferController();

  @override
  void dispose() {
    _voiceController.dispose();
    super.dispose();
  }

  Future<void> _publicar() async {
    final success = await _voiceController.publishFastOffer();
    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('¡Oferta creada por voz! Revísala y edítala en tu Inventario.'), backgroundColor: AppColors.success),
      );
      Navigator.pop(context);
    } else if (mounted && _voiceController.errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_voiceController.errorMessage!), backgroundColor: AppColors.error),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _voiceController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Publicar por Voz')),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const Text(
                  'Presiona el micrófono y dicta tu oferta.\nEjemplo: "Vendo harina PAN a 2 dólares, tengo 50 unidades".',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: AppColors.textLight, height: 1.5),
                ),
                const SizedBox(height: 30),

                // CONTENEDOR DE TRANSCRIPCIÓN
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15, offset: const Offset(0, 5))],
                      border: Border.all(color: _voiceController.isListening ? AppColors.primaryPurple : Colors.transparent, width: 2),
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        _voiceController.transcript.isEmpty 
                          ? 'El texto aparecerá aquí...' 
                          : _voiceController.transcript,
                        style: TextStyle(
                          fontSize: 20,
                          color: _voiceController.transcript.isEmpty ? Colors.grey[400] : AppColors.textDark,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 30),

                // BOTÓN DEL MICRÓFONO GIGANTE
                GestureDetector(
                  onTap: () {
                    if (_voiceController.isListening) {
                      _voiceController.stopListening();
                    } else {
                      _voiceController.startListening();
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: _voiceController.isListening ? AppColors.error : AppColors.primaryPurple,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: (_voiceController.isListening ? AppColors.error : AppColors.primaryPurple).withOpacity(0.4),
                          blurRadius: _voiceController.isListening ? 30 : 15,
                          spreadRadius: _voiceController.isListening ? 10 : 0,
                        )
                      ],
                    ),
                    child: Icon(
                      _voiceController.isListening ? Icons.stop : Icons.mic,
                      color: AppColors.white,
                      size: 50,
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                Text(
                  _voiceController.isListening ? 'Escuchando...' : 'Toca para dictar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: _voiceController.isListening ? AppColors.error : AppColors.primaryPurple,
                  ),
                ),

                const SizedBox(height: 30),

                // BOTÓN DE PUBLICAR
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton.icon(
                    onPressed: (_voiceController.isListening || _voiceController.isLoading || _voiceController.transcript.isEmpty)
                        ? null
                        : _publicar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.success,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    icon: _voiceController.isLoading 
                        ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2))
                        : const Icon(Icons.check_circle, color: AppColors.white),
                    label: Text(
                      _voiceController.isLoading ? 'Guardando...' : 'Publicar Oferta Rápida',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
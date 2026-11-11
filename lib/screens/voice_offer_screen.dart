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
    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('¡Oferta creada por voz! Revísala en tu Inventario.'), backgroundColor: AppColors.success),
      );
      Navigator.pop(context);
    } else if (_voiceController.errorMessage != null) {
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
          appBar: AppBar(title: const Text('Dictado Rápido')),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // 1. HEADER (NLP: Directo y motivador)
                const Text(
                  'Habla claro y vende rápido.\nNuestra IA extraerá los datos.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: AppColors.textDark, fontWeight: FontWeight.w600, height: 1.4),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Ejemplo: "Vendo harina PAN a 2 dólares, tengo 50 unidades".',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: AppColors.textLight, fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 30),

                // 2. CONTENEDOR DE TRANSCRIPCIÓN (Jerarquía Visual)
                Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: (_voiceController.isListening ? AppColors.primaryPurple : Colors.black).withValues(alpha: 0.1), 
                          blurRadius: _voiceController.isListening ? 25 : 10, 
                          offset: const Offset(0, 5)
                        )
                      ],
                      border: Border.all(
                        color: _voiceController.isListening ? AppColors.primaryPurple : Colors.transparent, 
                        width: 2
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        _voiceController.transcript.isEmpty 
                          ? 'Esperando tu voz...' 
                          : _voiceController.transcript,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: _voiceController.transcript.isEmpty ? FontWeight.normal : FontWeight.w600,
                          color: _voiceController.transcript.isEmpty ? Colors.grey[400] : AppColors.textDark,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 30),

                // 3. BOTÓN DEL MICRÓFONO (Psicología: Feedback claro)
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
                          color: (_voiceController.isListening ? AppColors.error : AppColors.primaryPurple).withValues(alpha: 0.5),
                          blurRadius: _voiceController.isListening ? 30 : 15,
                          spreadRadius: _voiceController.isListening ? 12 : 2,
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
                  _voiceController.isListening ? 'Grabando... toca para detener' : 'Toca para dictar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: _voiceController.isListening ? AppColors.error : AppColors.primaryPurple,
                  ),
                ),

                const SizedBox(height: 30),

                // 4. BOTÓN DE PUBLICAR (Jerarquía Visual / CTA)
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton.icon(
                    onPressed: (_voiceController.isListening || _voiceController.isLoading || _voiceController.transcript.isEmpty)
                        ? null
                        : _publicar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.success,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    icon: _voiceController.isLoading 
                        ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2))
                        : const Icon(Icons.rocket_launch, color: Colors.white),
                    label: Text(
                      _voiceController.isLoading ? 'Guardando...' : '🚀 Publicar y Vender',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
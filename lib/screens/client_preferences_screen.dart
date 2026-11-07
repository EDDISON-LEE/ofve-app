import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/client_preferences_controller.dart';

class ClientPreferencesScreen extends StatefulWidget {
  const ClientPreferencesScreen({super.key});

  @override
  State<ClientPreferencesScreen> createState() => _ClientPreferencesScreenState();
}

class _ClientPreferencesScreenState extends State<ClientPreferencesScreen> {
  final _controller = ClientPreferencesController();
  bool _isTestingPush = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Mis Preferencias')),
          body: _controller.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        '¿Qué te gustaría que te avisemos?',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textDark),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Selecciona tus categorías favoritas para recibir ofertas exclusivas y alertas de escasez cerca de tu ubicación.',
                        style: TextStyle(color: AppColors.textLight, fontSize: 14),
                      ),
                      const SizedBox(height: 24),

                      // LISTA DE CATEGORÍAS CON CHECKBOX
                      ..._controller.availableCategories.map((category) {
                        final isSelected = _controller.selectedCategories.contains(category);
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: isSelected ? AppColors.primaryPurple : Colors.transparent, width: 2),
                          ),
                          child: SwitchListTile(
                            title: Text(category, style: const TextStyle(fontWeight: FontWeight.w600)),
                            value: isSelected,
                            activeColor: AppColors.primaryPurple,
                            onChanged: (val) => _controller.togglePreference(category),
                          ),
                        );
                      }),

                      const SizedBox(height: 30),
                      const Divider(),
                      const SizedBox(height: 20),

                      // BOTÓN DE PRUEBA (PARA SIMULAR EL PUSH FOMO)
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.warning.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.warning),
                        ),
                        child: Column(
                          children: [
                            const Icon(Icons.radar, color: AppColors.warning, size: 40),
                            const SizedBox(height: 12),
                            const Text(
                              'Prueba la Magia (Alerta FOMO)',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Simula que estás a 500m de una oferta relámpago. Te enviaremos una notificación Push real a tu dispositivo.',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              height: 45,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.warning,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                ),
                                onPressed: _isTestingPush ? null : () async {
                                  setState(() => _isTestingPush = true);
                                  final success = await _controller.simularAlertaFomo();
                                  setState(() => _isTestingPush = false);
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text(success ? '¡Alerta Push enviada! Revisa tu celular.' : 'Error enviando alerta.'),
                                      backgroundColor: success ? AppColors.success : AppColors.error,
                                    ));
                                  }
                                },
                                icon: _isTestingPush 
                                    ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                                    : const Icon(Icons.notifications_active, color: Colors.white),
                                label: const Text('Simular Alerta Push Ahora', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
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
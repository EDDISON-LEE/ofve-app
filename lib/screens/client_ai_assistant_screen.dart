import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/client_ai_controller.dart';
import 'client_checkout_screen.dart';

class ClientAiAssistantScreen extends StatefulWidget {
  const ClientAiAssistantScreen({super.key});

  @override
  State<ClientAiAssistantScreen> createState() => _ClientAiAssistantScreenState();
}

class _ClientAiAssistantScreenState extends State<ClientAiAssistantScreen> {
  final _aiController = ClientAiController();
  final _promptController = TextEditingController();

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  void _enviarPregunta() {
    final text = _promptController.text.trim();
    if (text.isNotEmpty) {
      _aiController.askAssistant(text);
      _promptController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _aiController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(
            title: const Text('Asistente de Compras IA'),
            actions: [
              IconButton(
                icon: const Icon(Icons.info_outline, color: AppColors.textDark),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('¿Cómo usar el Asistente?'),
                      // CORRECCIÓN: Se escapó el $ con \
                      content: const Text('Pídeme recomendaciones como:\n\n- "Quiero hacer una cena romántica con 20\$"\n- "¿Qué me recomiendas para el desayuno de mañana?"\n- "Busco algo dulce para el postre"'),
                      actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Entendido'))],
                    ),
                  );
                },
              )
            ],
          ),
          body: Column(
            children: [
              // ÁREA DE CHAT / RESULTADOS
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Burbuja de bienvenida
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(0), topRight: Radius.circular(16), bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)
                          ),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
                        ),
                        child: const Text(
                          '¡Hola! Soy tu asistente personal. ¿Qué estás buscando o qué planes tienes hoy? Dime tu presupuesto y te armaré una recomendación perfecta.',
                          style: TextStyle(fontSize: 15, color: AppColors.textDark),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // LOADING
                      if (_aiController.isLoading)
                        const Center(
                          child: Column(
                            children: [
                              CircularProgressIndicator(color: AppColors.primaryPurple),
                              SizedBox(height: 12),
                              Text('Buscando las mejores ofertas para ti...', style: TextStyle(color: AppColors.textLight)),
                            ],
                          ),
                        ),

                      // RESPUESTA DE LA IA
                      if (_aiController.aiMessage != null) ...[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(backgroundColor: AppColors.primaryPurple, child: Icon(Icons.smart_toy, color: AppColors.white)),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryPurple.withOpacity(0.1),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16), topRight: Radius.circular(0), bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)
                                  ),
                                ),
                                child: Text(_aiController.aiMessage!, style: const TextStyle(fontSize: 15, color: AppColors.textDark)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                      ],

                      // TARJETAS DE OFERTAS RECOMENDADAS
                      if (_aiController.recommendedOffers.isNotEmpty)
                        ..._aiController.recommendedOffers.map((oferta) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 4))],
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(12),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: (oferta['imagen_url'] != null && oferta['imagen_url'].toString().isNotEmpty)
                                    ? Image.network(oferta['imagen_url'], width: 60, height: 60, fit: BoxFit.cover)
                                    : Container(width: 60, height: 60, color: Colors.grey[200], child: const Icon(Icons.image, color: Colors.grey)),
                              ),
                              title: Text(oferta['producto_nombre'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                              subtitle: Text('\$${oferta['precio_oferta'] ?? oferta['precio_regular']}', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold)),
                              trailing: IconButton(
                                icon: const Icon(Icons.shopping_cart, color: AppColors.primaryPurple),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => ClientCheckoutScreen(oferta: oferta)));
                                },
                              ),
                            ),
                          );
                        }),

                      if (_aiController.errorMessage != null)
                        Text(_aiController.errorMessage!, style: const TextStyle(color: AppColors.error)),
                    ],
                  ),
                ),
              ),

              // INPUT DE TEXTO INFERIOR
              Container(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, left: 16, right: 16, top: 16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _promptController,
                        textInputAction: TextInputAction.send,
                        onSubmitted: (_) => _enviarPregunta(),
                        decoration: InputDecoration(
                          hintText: 'Ej: Busco algo para cenar con \$10...',
                          filled: true,
                          fillColor: AppColors.bgTop,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      backgroundColor: AppColors.primaryPurple,
                      radius: 24,
                      child: IconButton(
                        icon: const Icon(Icons.send, color: AppColors.white, size: 20),
                        onPressed: _aiController.isLoading ? null : _enviarPregunta,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
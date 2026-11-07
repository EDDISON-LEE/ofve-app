import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:gal/gal.dart'; // Para guardar en la galería

class OfferFlyerScreen extends StatefulWidget {
  final Map<String, dynamic> oferta;
  final String nombreComercio;

  const OfferFlyerScreen({super.key, required this.oferta, required this.nombreComercio});

  @override
  State<OfferFlyerScreen> createState() => _OfferFlyerScreenState();
}

class _OfferFlyerScreenState extends State<OfferFlyerScreen> {
  final _screenshotController = ScreenshotController();

  Future<void> _descargarFlyer() async {
    final image = await _screenshotController.capture();
    if (image != null) {
      await Gal.putImageBytes(image, name: 'flyer_${widget.oferta['id']}');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('¡Flyer guardado en tu galería!'), backgroundColor: Colors.green));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flyer para Redes Sociales')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Screenshot(
                controller: _screenshotController,
                child: Container(
                  width: 350,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Color(0xFF7C5DFE), Color(0xFFE2D2FC)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(widget.nombreComercio, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(widget.oferta['imagen_url'], height: 200, fit: BoxFit.cover),
                      ),
                      const SizedBox(height: 16),
                      Text(widget.oferta['producto_nombre'], textAlign: TextAlign.center, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                        child: Text('\$${widget.oferta['precio_oferta'] ?? widget.oferta['precio_regular']}', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF7C5DFE))),
                      ),
                      const SizedBox(height: 16),
                      const Text('¡Pídelo ya en OfVe!', style: TextStyle(color: Colors.white70, fontSize: 16, fontStyle: FontStyle.italic)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: _descargarFlyer,
                icon: const Icon(Icons.download),
                label: const Text('Descargar Flyer'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:gal/gal.dart';

class OfferFlyerScreen extends StatefulWidget {
  final Map<String, dynamic> oferta;
  final String nombreComercio;

  const OfferFlyerScreen({
    super.key,
    required this.oferta,
    required this.nombreComercio,
  });

  @override
  State<OfferFlyerScreen> createState() => _OfferFlyerScreenState();
}

class _OfferFlyerScreenState extends State<OfferFlyerScreen> {
  final _screenshotController = ScreenshotController();

  bool _imagenLista = false;
  bool _guardando = false;

  // ────── Helpers de datos ──────
  String get _imagenUrl => (widget.oferta['imagen_url'] ?? '').toString();

  double _toDouble(dynamic v) {
    if (v == null) return 0;
    if (v is num) return v.toDouble();
    return double.tryParse(v.toString()) ?? 0;
  }

  String get _precioTexto {
    final po = _toDouble(widget.oferta['precio_oferta']);
    final pr = _toDouble(widget.oferta['precio_regular']);
    final precio = po > 0 ? po : pr;
    if (precio <= 0) return '—';
    return '\$${precio.toStringAsFixed(2)}';
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _precargarImagen());
  }

  /// Precarga la foto antes de permitir la captura.
  /// Sin esto, el primer tap puede capturar la foto en blanco.
  Future<void> _precargarImagen() async {
    if (_imagenUrl.isNotEmpty) {
      try {
        await precacheImage(NetworkImage(_imagenUrl), context);
      } catch (e) {
        debugPrint('⚠️ No se pudo precargar la imagen del flyer: $e');
      }
    }
    if (mounted) setState(() => _imagenLista = true);
  }

  Future<void> _descargarFlyer() async {
    if (!_imagenLista || _guardando) return;
    setState(() => _guardando = true);
    try {
      // 1) Permisos (crítico en iOS y Android < 29)
      final tieneAcceso = await Gal.hasAccess();
      if (!tieneAcceso) {
        final concedido = await Gal.requestAccess();
        if (!concedido) {
          throw Exception('Permiso de galería denegado. Actívalo en Ajustes.');
        }
      }

      // 2) Esperar a que el frame actual esté renderizado
      await WidgetsBinding.instance.endOfFrame;
      if (!mounted) return;

      // 3) Capturar en alta resolución (3.0× → nitidez para Instagram/WhatsApp)
      final image = await _screenshotController.capture(pixelRatio: 3.0);
      if (image == null) {
        throw Exception('No se pudo generar la imagen del flyer.');
      }

      // 4) Guardar en álbum "OfVe"
      final id = widget.oferta['id'] ??
          DateTime.now().millisecondsSinceEpoch.toString();
      await Gal.putImageBytes(image, name: 'flyer_$id', album: 'OfVe');

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('¡Flyer guardado en tu galería!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'No se pudo guardar: ${e.toString().replaceAll('Exception: ', '')}',
          ),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) setState(() => _guardando = false);
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
              child: !_imagenLista
                  ? const CircularProgressIndicator()
                  : SingleChildScrollView(
                      // Scroll por si el contenido es más alto que la pantalla
                      padding: const EdgeInsets.all(20),
                      child: Screenshot(
                        controller: _screenshotController,
                        child: Container(
                          width: 350,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF7C5DFE), Color(0xFFE2D2FC)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                widget.nombreComercio,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),

                              // FOTO con null-check + errorBuilder
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: _imagenUrl.isNotEmpty
                                    ? Image.network(
                                        _imagenUrl,
                                        height: 200,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        // FIX: (_, _, _) — wildcards Dart 3.7+
                                        errorBuilder: (_, _, _) => Container(
                                          height: 200,
                                          color: Colors.white24,
                                          child: const Icon(
                                            Icons.image_not_supported,
                                            color: Colors.white54,
                                            size: 60,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        height: 200,
                                        color: Colors.white24,
                                        child: const Icon(
                                          Icons.image,
                                          color: Colors.white54,
                                          size: 60,
                                        ),
                                      ),
                              ),
                              const SizedBox(height: 16),

                              Text(
                                widget.oferta['producto_nombre'] ?? 'Producto',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 12),

                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  _precioTexto,
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF7C5DFE),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),

                              const Text(
                                '¡Pídelo ya en OfVe!',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
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
                onPressed:
                    (!_imagenLista || _guardando) ? null : _descargarFlyer,
                icon: _guardando
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Icon(Icons.download),
                label: Text(_guardando ? 'Guardando...' : 'Descargar Flyer'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
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

  // NUEVO: Para técnica de Anclaje de Precios (NLP)
  String? get _precioRegularTachado {
    final po = _toDouble(widget.oferta['precio_oferta']);
    final pr = _toDouble(widget.oferta['precio_regular']);
    if (po > 0 && pr > po) {
      return '\$${pr.toStringAsFixed(2)}';
    }
    return null;
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
      backgroundColor: const Color(0xFFF5F3FF), // Fondo claro para que resalte el arte
      appBar: AppBar(
        title: const Text('Flyer para Redes Sociales'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: !_imagenLista
                  ? const CircularProgressIndicator()
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Screenshot(
                        controller: _screenshotController,
                        // DISEÑO CUADRADO (Ratio 1:1 Ideal para IG/WhatsApp)
                        child: Container(
                          width: 400,
                          height: 400,
                          decoration: BoxDecoration(
                            // Gradiente premium usando tus colores base
                            gradient: const LinearGradient(
                              colors: [Color(0xFF7C5DFE), Color(0xFF2D1B69)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF7C5DFE).withValues(alpha: 0.3),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              // 1. HEADER: Nombre del Comercio (Autoridad)
                              Padding(
                                padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.storefront, color: Colors.white70, size: 16),
                                    const SizedBox(width: 6),
                                    Text(
                                      widget.nombreComercio.toUpperCase(),
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // 2. IMAGEN DEL PRODUCTO (Atracción visual)
                              Expanded(
                                flex: 5,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 24),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withValues(alpha: 0.2),
                                            blurRadius: 10,
                                            offset: const Offset(0, 5),
                                          )
                                        ],
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: _imagenUrl.isNotEmpty
                                            ? Image.network(
                                                _imagenUrl,
                                                height: double.infinity,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                                // MANTENEMOS EL MANEJO DE ERRORES ORIGINAL
                                                errorBuilder: (_, _, _) => Container(
                                                  height: double.infinity,
                                                  color: Colors.white24,
                                                  child: const Icon(
                                                    Icons.image_not_supported,
                                                    color: Colors.white54,
                                                    size: 60,
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                height: double.infinity,
                                                color: Colors.white24,
                                                child: const Icon(
                                                  Icons.image,
                                                  color: Colors.white54,
                                                  size: 60,
                                                ),
                                              ),
                                      ),
                                    ),
                                    // BADGE DE ESCASEZ (FOMO - Gatillo mental)
                                    Positioned(
                                      top: 10,
                                      right: 24,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: Colors.redAccent,
                                          borderRadius: BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(color: Colors.red.withValues(alpha: 0.5), blurRadius: 8)
                                          ],
                                        ),
                                        child: const Text(
                                          '¡OFERTA!',
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // 3. TEXTOS Y PRECIO (Jerarquía visual y Anclaje)
                              Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Nombre del producto
                                      Text(
                                        widget.oferta['producto_nombre'] ?? 'Producto',
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                          height: 1.1,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      
                                      // Precio (Dorado para resaltar + Tachado para anclaje)
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              _precioTexto,
                                              style: const TextStyle(
                                                fontSize: 42,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFFFFD700), // Dorado
                                                letterSpacing: -1,
                                              ),
                                            ),
                                            if (_precioRegularTachado != null) ...[
                                              const SizedBox(width: 10),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 8),
                                                child: Text(
                                                  _precioRegularTachado!,
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white54,
                                                    decoration: TextDecoration.lineThrough,
                                                    decorationColor: Colors.white54,
                                                    decorationThickness: 2,
                                                  ),
                                                ),
                                              ),
                                            ]
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // 4. CTA (Call to action) Y BRANDING
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                                decoration: BoxDecoration(
                                  color: Colors.black.withValues(alpha: 0.2),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(24),
                                    bottomRight: Radius.circular(24),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      '¡Pídelo ya!',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Text(
                                        'OfVe',
                                        style: TextStyle(
                                          color: Color(0xFF7C5DFE),
                                          fontWeight: FontWeight.w900,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ),
          ),
          
          // Botón de descarga original
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7C5DFE),
                ),
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
                    : const Icon(Icons.download, color: Colors.white),
                label: Text(
                  _guardando ? 'Guardando...' : 'Descargar Flyer',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
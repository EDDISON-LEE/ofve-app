import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;

class OfferReviewScreen extends StatefulWidget {
  final String nombre;
  final String descripcion;
  final String categoria;
  final double precioRegular;
  final double precioOferta;
  final int stock;
  final Uint8List? imageBytes;
  final String? imageName;

  const OfferReviewScreen({
    super.key,
    required this.nombre,
    required this.descripcion,
    required this.categoria,
    required this.precioRegular,
    required this.precioOferta,
    required this.stock,
    this.imageBytes,
    this.imageName,
  });

  @override
  State<OfferReviewScreen> createState() => _OfferReviewScreenState();
}

class _OfferReviewScreenState extends State<OfferReviewScreen> {
  final _supabase = Supabase.instance.client;
  bool _isSaving = false;

  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

  Future<void> _publicarOferta() async {
    setState(() => _isSaving = true);
    final userId = _supabase.auth.currentUser!.id;

    try {
      // 1. Obtener el comercio
      final comercioData = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      final comercioId = comercioData['id'];

      // 2. Subir Imagen (si existe)
      String? imageUrl;
      if (widget.imageBytes != null && widget.imageName != null) {
        final ext = p.extension(widget.imageName!);
        final finalName = 'oferta_${DateTime.now().millisecondsSinceEpoch}$ext';
        final path = '$userId/$finalName';

        await _supabase.storage.from('productos_imagenes').uploadBinary(
          path, widget.imageBytes!, fileOptions: const FileOptions(upsert: true),
        );
        imageUrl = _supabase.storage.from('productos_imagenes').getPublicUrl(path);
      }

      // 3. Guardar en BD
      await _supabase.from('ofertas').insert({
        'comercio_id': comercioId,
        'producto_nombre': widget.nombre,
        'descripcion': widget.descripcion,
        'categoria': widget.categoria,
        'precio_regular': widget.precioRegular,
        'precio_oferta': widget.precioOferta,
        'stock': widget.stock,
        'imagen_url': imageUrl,
        'estado': 'Activa',
        'fecha_inicio': DateTime.now().toIso8601String(),
        'fecha_fin': DateTime.now().add(const Duration(days: 7)).toIso8601String(),
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('¡Oferta publicada con éxito!'), backgroundColor: Colors.green),
        );
        
        // 4. VOLVER AL DASHBOARD PRINCIPAL (Borrando el historial de estas pantallas)
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al publicar: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Paso 2: Resumen de Oferta', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Revisa cómo se verá tu oferta en la app antes de publicarla:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),

            // TARJETA DE PREVISUALIZACIÓN (Estilo Dashboard del Cliente)
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 15, offset: const Offset(0, 5))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Imagen
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: widget.imageBytes != null
                        ? Image.memory(widget.imageBytes!, height: 200, width: double.infinity, fit: BoxFit.cover)
                        : Container(height: 200, color: Colors.grey[200], child: const Icon(Icons.image, size: 80, color: Colors.grey)),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(color: primaryPurple.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                              child: Text(widget.categoria, style: TextStyle(color: primaryPurple, fontSize: 10, fontWeight: FontWeight.bold)),
                            ),
                            Text('Stock: ${widget.stock}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(widget.nombre, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text(
                          widget.descripcion.isEmpty ? 'Sin descripción' : widget.descripcion,
                          style: const TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Text('\$${widget.precioOferta.toStringAsFixed(2)}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: primaryPurple)),
                            const SizedBox(width: 12),
                            Text('\$${widget.precioRegular.toStringAsFixed(2)}', style: TextStyle(fontSize: 16, color: Colors.grey, decoration: TextDecoration.lineThrough)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // BOTONES DE ACCIÓN
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(color: primaryPurple),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: _isSaving ? null : () => Navigator.pop(context), // Vuelve al formulario
                    icon: Icon(Icons.edit, color: primaryPurple),
                    label: Text('Editar', style: TextStyle(color: primaryPurple, fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryPurple,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: _isSaving ? null : _publicarOferta,
                    icon: _isSaving 
                        ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                        : const Icon(Icons.check_circle, color: Colors.white),
                    label: Text(_isSaving ? 'Publicando...' : 'Publicar', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 
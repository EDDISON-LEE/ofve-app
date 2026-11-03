import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _supabase = Supabase.instance.client;
  
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();
  String _selectedCategory = 'Alimentos y Bebidas';
  
  Uint8List? _imageBytes;
  String? _imageName;
  bool _isSaving = false;

  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
        _imageName = pickedFile.name;
      });
    }
  }

  Future<void> _saveProduct() async {
    if (_nameController.text.isEmpty || _priceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('El nombre y precio son obligatorios.'), backgroundColor: Colors.red));
      return;
    }

    setState(() => _isSaving = true);
    final userId = _supabase.auth.currentUser!.id;

    try {
      final comercioData = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      final comercioId = comercioData['id'];

      String? imageUrl;
      if (_imageBytes != null && _imageName != null) {
        final ext = p.extension(_imageName!);
        final finalName = 'producto_${DateTime.now().millisecondsSinceEpoch}$ext';
        final path = '$userId/$finalName';

        await _supabase.storage.from('productos_imagenes').uploadBinary(
          path, _imageBytes!, fileOptions: const FileOptions(upsert: true),
        );
        imageUrl = _supabase.storage.from('productos_imagenes').getPublicUrl(path);
      }

      await _supabase.from('ofertas').insert({
        'comercio_id': comercioId,
        'producto_nombre': _nameController.text.trim(),
        'descripcion': _descController.text.trim(),
        'categoria': _selectedCategory,
        'precio_regular': double.parse(_priceController.text.trim()),
        'precio_oferta': null, // Al ser inventario, no tiene precio de oferta
        'es_oferta': false,    // Bandera para indicar que es un producto regular
        'stock': int.parse(_stockController.text.trim().isEmpty ? '1' : _stockController.text.trim()),
        'imagen_url': imageUrl,
        'estado': 'Activo',
        'fecha_inicio': DateTime.now().toIso8601String(),
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('¡Producto agregado al inventario!'), backgroundColor: Colors.green));
        Navigator.pop(context); 
      }
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error al guardar: $e'), backgroundColor: Colors.red));
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Agregar al Inventario', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: _imageBytes != null
                    ? ClipRRect(borderRadius: BorderRadius.circular(16), child: Image.memory(_imageBytes!, fit: BoxFit.cover, width: double.infinity))
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_photo_alternate, size: 50, color: primaryPurple),
                          const SizedBox(height: 8),
                          const Text('Subir foto del producto', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 20),

            _buildTextField(_nameController, 'Nombre del Producto', Icons.shopping_bag),
            const SizedBox(height: 12),
            _buildTextField(_descController, 'Descripción (Opcional)', Icons.description, maxLines: 3),
            const SizedBox(height: 12),
            
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: InputDecoration(
                labelText: 'Categoría',
                prefixIcon: const Icon(Icons.category),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
              items: ['Alimentos y Bebidas', 'Tecnología', 'Ropa y Calzado', 'Salud y Belleza', 'Hogar y Ferretería', 'Supermercado', 'Farmacia', 'Servicios', 'Otros']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) => setState(() => _selectedCategory = v!),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(child: _buildTextField(_priceController, 'Precio Regular', Icons.attach_money, isNumber: true)),
                const SizedBox(width: 12),
                Expanded(child: _buildTextField(_stockController, 'Stock Disponible', Icons.inventory, isNumber: true)),
              ],
            ),
            
            const SizedBox(height: 30),
            
            SizedBox(
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryPurple,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: _isSaving ? null : _saveProduct,
                child: _isSaving
                    ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                    : const Text('Guardar en Inventario', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {bool isNumber = false, int maxLines = 1}) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      ),
    );
  }
}
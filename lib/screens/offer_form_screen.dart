import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'offer_review_screen.dart'; // <-- NUEVA IMPORTACIÓN

class OfferFormScreen extends StatefulWidget {
  const OfferFormScreen({super.key});

  @override
  State<OfferFormScreen> createState() => _OfferFormScreenState();
}

class _OfferFormScreenState extends State<OfferFormScreen> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _priceRegController = TextEditingController();
  final _priceOfferController = TextEditingController();
  final _stockController = TextEditingController();
  String _selectedCategory = 'Alimentos y Bebidas';
  
  Uint8List? _imageBytes;
  String? _imageName;

  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _priceRegController.dispose();
    _priceOfferController.dispose();
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

  void _revisarOferta() {
    if (_nameController.text.isEmpty || _priceRegController.text.isEmpty || _priceOfferController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Por favor, llena los campos obligatorios.'), backgroundColor: Colors.red));
      return;
    }

    // Navegamos al resumen pasando todos los datos
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OfferReviewScreen(
          nombre: _nameController.text.trim(),
          descripcion: _descController.text.trim(),
          categoria: _selectedCategory,
          precioRegular: double.tryParse(_priceRegController.text.trim()) ?? 0.0,
          precioOferta: double.tryParse(_priceOfferController.text.trim()) ?? 0.0,
          stock: int.tryParse(_stockController.text.trim()) ?? 1,
          imageBytes: _imageBytes,
          imageName: _imageName,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Paso 1: Datos de la Oferta', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
                Expanded(child: _buildTextField(_priceRegController, 'Precio Regular', Icons.attach_money, isNumber: true)),
                const SizedBox(width: 12),
                Expanded(child: _buildTextField(_priceOfferController, 'Precio Oferta', Icons.local_offer, isNumber: true)),
              ],
            ),
            const SizedBox(height: 12),
            _buildTextField(_stockController, 'Stock Disponible', Icons.inventory, isNumber: true),
            
            const SizedBox(height: 30),
            
            SizedBox(
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryPurple,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: _revisarOferta,
                child: const Text('Revisar Oferta', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
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
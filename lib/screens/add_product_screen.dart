import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../core/theme/app_theme.dart';
import '../controllers/offer_controller.dart';
import '../controllers/categories_controller.dart'; // <-- NUEVA IMPORTACIÓN

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _offerController = OfferController();
  final _categoriesController = CategoriesController(); // <-- NUEVO CONTROLADOR
  
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();
  
  String? _selectedCategory; // <-- Inicializado en null hasta que carguen
  
  Uint8List? _imageBytes;
  String? _imageName;

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    _categoriesController.dispose();
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
    if (_selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, espera a que carguen las categorías y selecciona una.'), backgroundColor: Colors.orange),
      );
      return;
    }
    if (_nameController.text.isEmpty || _priceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('El nombre y precio son obligatorios.'), backgroundColor: Colors.red),
      );
      return;
    }

    final success = await _offerController.createInventoryProduct(
      nombre: _nameController.text,
      descripcion: _descController.text,
      categoria: _selectedCategory!,
      precioRegular: double.parse(_priceController.text.trim()),
      stock: int.parse(_stockController.text.trim().isEmpty ? '1' : _stockController.text.trim()),
      imageBytes: _imageBytes,
      imageName: _imageName,
    );

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('¡Producto agregado al inventario!'), backgroundColor: AppColors.success),
      );
      Navigator.pop(context);
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_offerController.errorMessage ?? 'Error al guardar'), backgroundColor: AppColors.error),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_offerController, _categoriesController]),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Agregar al Inventario')),
          body: _categoriesController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          height: 180,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: _imageBytes != null
                              ? ClipRRect(borderRadius: BorderRadius.circular(16), child: Image.memory(_imageBytes!, fit: BoxFit.cover, width: double.infinity))
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.add_photo_alternate, size: 50, color: AppColors.primaryPurple),
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
                      
                      // DROPDOWN DINÁMICO DE CATEGORÍAS
                      DropdownButtonFormField<String>(
                        value: _selectedCategory,
                        decoration: const InputDecoration(labelText: 'Categoría', prefixIcon: Icon(Icons.category)),
                        items: _categoriesController.categories
                            .map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                        onChanged: (v) => setState(() => _selectedCategory = v),
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
                          onPressed: _offerController.isLoading ? null : _saveProduct,
                          child: _offerController.isLoading
                              ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2))
                              : const Text('Guardar en Inventario'),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
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
      ),
    );
  }
}
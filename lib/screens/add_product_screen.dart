import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../core/theme/app_theme.dart';
import '../controllers/offer_controller.dart';
import '../controllers/categories_controller.dart'; 

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _offerController = OfferController();
  final _categoriesController = CategoriesController(); 
  
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();
  
  String? _selectedCategory; 
  Uint8List? _imageBytes;

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    _categoriesController.dispose();
    super.dispose();
  }

  void _mostrarAlertaElegante(String mensaje, {bool esError = true}) {
    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          title: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: (esError ? AppColors.error : AppColors.success).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  esError ? Icons.error_outline_rounded : Icons.check_circle_outline_rounded,
                  color: esError ? AppColors.error : AppColors.success,
                  size: 40,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                esError ? 'Atención' : '¡Éxito!',
                style: TextStyle(
                  color: esError ? AppColors.error : AppColors.success,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          content: Text(
            mensaje,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: AppColors.textDark),
          ),
          actions: [
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: esError ? AppColors.error : AppColors.success,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); 
                  if (!esError) Navigator.pop(context); 
                },
                child: const Text('Entendido', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 90, maxWidth: 1200);
    
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
      });
    }
  }

  Future<void> _saveProduct() async {
    if (_imageBytes == null) {
      _mostrarAlertaElegante('La foto del producto es obligatoria.');
      return;
    }
    if (_selectedCategory == null) {
      _mostrarAlertaElegante('Por favor, selecciona una categoría.');
      return;
    }
    if (_nameController.text.isEmpty || _priceController.text.isEmpty) {
      _mostrarAlertaElegante('El nombre y precio son obligatorios.');
      return;
    }

    final precio = double.tryParse(_priceController.text.replaceAll(',', '.').trim()) ?? 0.0;
    if (precio < 0.01) {
       _mostrarAlertaElegante('El precio debe ser mayor a 0.01.');
       return;
    }

    final success = await _offerController.createInventoryProduct(
      nombre: _nameController.text,
      descripcion: _descController.text,
      categoria: _selectedCategory!,
      precioRegular: precio,
      stock: int.tryParse(_stockController.text.trim()) ?? 1,
      imageBytes: _imageBytes!, // Ya no se envía imageName
    );

    if (success && mounted) {
      _mostrarAlertaElegante('¡Producto agregado al inventario!', esError: false);
    } else if (mounted) {
      _mostrarAlertaElegante(_offerController.errorMessage ?? 'Error al guardar');
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
                            border: Border.all(
                              color: _imageBytes != null ? AppColors.success : Colors.grey.shade300,
                              width: _imageBytes != null ? 2 : 1,
                            ),
                          ),
                          child: _imageBytes != null
                              ? ClipRRect(borderRadius: BorderRadius.circular(16), child: Image.memory(_imageBytes!, fit: BoxFit.cover, width: double.infinity))
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.add_photo_alternate, size: 50, color: AppColors.primaryPurple),
                                    const SizedBox(height: 8),
                                    const Text('Subir foto (Obligatorio)', style: TextStyle(color: Colors.grey)),
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
                          Expanded(child: _buildTextField(_stockController, 'Stock', Icons.inventory, isInteger: true)),
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

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {bool isNumber = false, bool isInteger = false, int maxLines = 1}) {
    List<TextInputFormatter>? formatters;
    if (isNumber && !isInteger) {
      formatters = [FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))];
    } else if (isInteger) {
      formatters = [FilteringTextInputFormatter.digitsOnly];
    }

    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.numberWithOptions(decimal: !isInteger) : TextInputType.text,
      inputFormatters: formatters,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
      ),
    );
  }
}
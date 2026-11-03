import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../core/theme/app_theme.dart';
import '../controllers/offer_controller.dart';
import '../controllers/categories_controller.dart';
import 'ai_assistant_screen.dart';

class CreateOfferScreen extends StatefulWidget {
  final String? initialNombre;
  final String? initialDescripcion;
  final String? solicitudAnimalId;

  const CreateOfferScreen({
    super.key,
    this.initialNombre,
    this.initialDescripcion,
    this.solicitudAnimalId,
  });

  @override
  State<CreateOfferScreen> createState() => _CreateOfferScreenState();
}

class _CreateOfferScreenState extends State<CreateOfferScreen> {
  final _offerController = OfferController();
  final _categoriesController = CategoriesController();

  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _priceRegController = TextEditingController();
  final _priceOfferController = TextEditingController();
  final _stockController = TextEditingController();

  String? _selectedCategory;
  Uint8List? _imageBytes;
  String? _imageName;

  String? _aiErrorMessage;

  @override
  void initState() {
    super.initState();
    if (widget.initialNombre != null) {
      _nameController.text = widget.initialNombre!;
    }
    if (widget.initialDescripcion != null) {
      _descController.text = widget.initialDescripcion!;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _priceRegController.dispose();
    _priceOfferController.dispose();
    _stockController.dispose();
    _categoriesController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
        _imageName = pickedFile.name;
      });
    }
  }

  Future<void> _generarDescripcionIA() async {
    final resultado = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (_) =>
            AiAssistantScreen(initialProductName: _nameController.text),
      ),
    );

    if (resultado != null && resultado.isNotEmpty) {
      setState(() {
        _descController.text = resultado;
      });
    }
  }

  Future<void> _saveOffer() async {
    setState(() => _aiErrorMessage = null);

    if (_selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Por favor, espera a que carguen las categorías y selecciona una.'),
            backgroundColor: Colors.orange),
      );
      return;
    }
    if (_nameController.text.isEmpty ||
        _priceRegController.text.isEmpty ||
        _priceOfferController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Por favor, llena los campos obligatorios.'),
            backgroundColor: Colors.red),
      );
      return;
    }

    final success = await _offerController.createOffer(
      nombre: _nameController.text,
      descripcion: _descController.text,
      categoria: _selectedCategory!,
      precioRegular: double.parse(_priceRegController.text.trim()),
      precioOferta: double.parse(_priceOfferController.text.trim()),
      stock: int.parse(_stockController.text.trim().isEmpty
          ? '1'
          : _stockController.text.trim()),
      imageBytes: _imageBytes,
      imageName: _imageName,
      solicitudAnimalId: widget.solicitudAnimalId,
    );

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('¡Oferta publicada con éxito!'),
            backgroundColor: AppColors.success),
      );
      Navigator.pop(context, true);
    } else if (mounted) {
      setState(() => _aiErrorMessage = _offerController.errorMessage);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(_offerController.errorMessage ?? 'Error al publicar'),
            backgroundColor: AppColors.error),
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
          appBar: AppBar(title: const Text('Nueva Oferta')),
          body: _categoriesController.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                      color: AppColors.primaryPurple))
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
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.memory(_imageBytes!,
                                      fit: BoxFit.cover,
                                      width: double.infinity))
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.add_photo_alternate,
                                        size: 50,
                                        color: AppColors.primaryPurple),
                                    const SizedBox(height: 8),
                                    const Text('Subir foto del producto',
                                        style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(_nameController, 'Nombre del Producto',
                          Icons.shopping_bag),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _descController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: 'Descripción (Opcional)',
                          prefixIcon: const Icon(Icons.description),
                          suffixIcon: IconButton(
                            tooltip: 'Generar con IA',
                            icon: const Icon(Icons.auto_awesome,
                                color: AppColors.primaryPurple),
                            onPressed: _generarDescripcionIA,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        value: _selectedCategory,
                        decoration: const InputDecoration(
                            labelText: 'Categoría',
                            prefixIcon: Icon(Icons.category)),
                        items: _categoriesController.categories
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (v) =>
                            setState(() => _selectedCategory = v),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                              child: _buildTextField(
                                  _priceRegController,
                                  'Precio Regular',
                                  Icons.attach_money,
                                  isNumber: true)),
                          const SizedBox(width: 12),
                          Expanded(
                              child: _buildTextField(
                                  _priceOfferController,
                                  'Precio Oferta',
                                  Icons.local_offer,
                                  isNumber: true)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _buildTextField(_stockController, 'Stock Disponible',
                          Icons.inventory,
                          isNumber: true),
                      if (_aiErrorMessage != null) ...[
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.error.withOpacity(0.1),
                            border: Border.all(color: AppColors.error),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.warning_amber_rounded,
                                  color: AppColors.error, size: 30),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  _aiErrorMessage!,
                                  style: const TextStyle(
                                      color: AppColors.error,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 55,
                        child: ElevatedButton(
                          onPressed:
                              _offerController.isLoading ? null : _saveOffer,
                          child: _offerController.isLoading
                              ? const SizedBox(
                                  width: 22,
                                  height: 22,
                                  child: CircularProgressIndicator(
                                      color: AppColors.white, strokeWidth: 2))
                              : const Text('Publicar Oferta'),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon,
      {bool isNumber = false, int maxLines = 1}) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      maxLines: maxLines,
      decoration: InputDecoration(labelText: label, prefixIcon: Icon(icon)),
    );
  }
}
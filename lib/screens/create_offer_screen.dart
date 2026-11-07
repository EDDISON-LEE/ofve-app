import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart'; // <-- NUEVO IMPORT
import '../core/theme/app_theme.dart';
import '../controllers/offer_controller.dart';
import '../controllers/categories_controller.dart';
import '../controllers/currency_controller.dart'; 
import 'ai_assistant_screen.dart';
import 'merchant_offers_list_screen.dart'; 

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
  final _currencyController = CurrencyController(); 

  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _priceRegController = TextEditingController();
  final _priceOfferController = TextEditingController();
  final _stockController = TextEditingController();

  String? _selectedCategory;
  Uint8List? _imageBytes;
  
  // --- NUEVAS VARIABLES PARA CADUCIDAD ---
  bool _esPerecedero = false;
  DateTime? _fechaCaducidad;
  // ---------------------------------------

  @override
  void initState() {
    super.initState();
    if (widget.initialNombre != null) _nameController.text = widget.initialNombre!;
    if (widget.initialDescripcion != null) _descController.text = widget.initialDescripcion!;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _priceRegController.dispose();
    _priceOfferController.dispose();
    _stockController.dispose();
    _categoriesController.dispose();
    _currencyController.dispose();
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
                  if (!esError) {
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (_) => const MerchantOffersListScreen())
                    );
                  }
                },
                child: const Text('Entendido', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        );
      },
    );
  }

  double _formatearPrecio(String texto) {
    if (texto.isEmpty) return 0.0;
    return double.tryParse(texto.replaceAll(',', '.').trim()) ?? 0.0;
  }

  int _formatearEntero(String texto) {
    if (texto.isEmpty) return 0;
    return int.tryParse(texto.replaceAll(RegExp(r'[^0-9]'), '').trim()) ?? 0;
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery, 
      imageQuality: 90, 
      maxWidth: 1200
    );

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
      });
    }
  }

  Future<void> _generarDescripcionIA() async {
    // Si hay imagen, la pasamos a la IA para que haga Vision
    final resultado = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (_) => AiAssistantScreen(
          initialProductName: _nameController.text,
          imageBytes: _imageBytes, // <-- PASAMOS LA IMAGEN
        ),
      ),
    );

    if (resultado != null && resultado.isNotEmpty) {
      setState(() {
        _descController.text = resultado;
      });
    }
  }

  Future<void> _saveOffer() async {
    if (_imageBytes == null) {
      _mostrarAlertaElegante('La foto del producto es obligatoria para que los clientes puedan verlo.');
      return;
    }

    if (_selectedCategory == null) {
      _mostrarAlertaElegante('Por favor, selecciona una categoría de la lista.');
      return;
    }

    if (_nameController.text.trim().isEmpty || 
        _priceRegController.text.trim().isEmpty || 
        _priceOfferController.text.trim().isEmpty ||
        _stockController.text.trim().isEmpty) {
      _mostrarAlertaElegante('Por favor, llena todos los campos del formulario.');
      return;
    }

    // --- VALIDACIÓN DE CADUCIDAD ---
    if (_esPerecedero && _fechaCaducidad == null) {
      _mostrarAlertaElegante('Debes seleccionar la fecha de caducidad para este producto.');
      return;
    }

    if (_esPerecedero && _fechaCaducidad != null) {
      final diasRestantes = _fechaCaducidad!.difference(DateTime.now()).inDays;
      if (diasRestantes < 5) {
        _mostrarAlertaElegante('No puedes publicar un producto que caduca en menos de 5 días. ¡Protege la salud de los clientes!');
        return;
      }
    }
    // ---------------------------------

    final precioRegular = _formatearPrecio(_priceRegController.text);
    final precioOferta = _formatearPrecio(_priceOfferController.text);
    final stock = _formatearEntero(_stockController.text);

    if (precioRegular < 0.01 || precioOferta < 0.01) {
      _mostrarAlertaElegante('Los precios deben ser mayores a 0.01 (Puedes usar coma o punto).');
      return;
    }
    
    if (stock < 1) {
      _mostrarAlertaElegante('El stock debe ser un número entero mayor a 0.');
      return;
    }

    final success = await _offerController.createOffer(
      nombre: _nameController.text,
      descripcion: _descController.text,
      categoria: _selectedCategory!,
      precioRegular: precioRegular,
      precioOferta: precioOferta,
      stock: stock,
      imageBytes: _imageBytes!,
      solicitudAnimalId: widget.solicitudAnimalId,
      fechaCaducidad: _fechaCaducidad, // <-- PASAMOS LA FECHA
    );

    if (success && mounted) {
      _mostrarAlertaElegante('¡Oferta publicada con éxito!', esError: false);
    } else if (mounted) {
      _mostrarAlertaElegante(_offerController.errorMessage ?? 'Ocurrió un error al publicar la oferta.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_offerController, _categoriesController, _currencyController]),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Nueva Oferta')),
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
                              color: _imageBytes != null ? AppColors.success : Colors.grey.shade400,
                              width: _imageBytes != null ? 2 : 1,
                            ),
                          ),
                          child: _imageBytes != null
                              ? Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(16), 
                                      child: Image.memory(_imageBytes!, fit: BoxFit.cover, width: double.infinity)
                                    ),
                                    Positioned(
                                      top: 8, right: 8,
                                      child: CircleAvatar(
                                        backgroundColor: AppColors.success,
                                        radius: 16,
                                        child: const Icon(Icons.check, color: Colors.white, size: 20),
                                      ),
                                    )
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.add_a_photo_outlined, size: 50, color: Colors.grey),
                                    const SizedBox(height: 8),
                                    const Text('Subir foto (Obligatorio)', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      _buildTextField(_nameController, 'Nombre del Producto', Icons.shopping_bag),
                      const SizedBox(height: 12),
                      
                      TextField(
                        controller: _descController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: 'Descripción (Opcional)',
                          prefixIcon: const Icon(Icons.description),
                          suffixIcon: IconButton(
                            tooltip: 'Generar con IA (Vision)',
                            icon: const Icon(Icons.auto_awesome, color: AppColors.primaryPurple),
                            onPressed: _generarDescripcionIA, // <-- LLAMADA ACTUALIZADA
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      DropdownButtonFormField<String>(
                        value: _selectedCategory,
                        decoration: const InputDecoration(labelText: 'Categoría', prefixIcon: Icon(Icons.category)),
                        items: _categoriesController.categories.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                        onChanged: (v) => setState(() => _selectedCategory = v),
                      ),
                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Expanded(
                            child: ValueListenableBuilder<TextEditingValue>(
                              valueListenable: _priceRegController,
                              builder: (context, value, child) {
                                final usd = double.tryParse(value.text.replaceAll(',', '.')) ?? 0.0;
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildTextField(
                                      _priceRegController, 
                                      'Precio Regular', 
                                      Icons.attach_money, 
                                      isNumber: true
                                    ),
                                    if (usd > 0)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4, left: 12),
                                        child: Text(
                                          '≈ ${_currencyController.formatBs(usd)}',
                                          style: const TextStyle(color: AppColors.success, fontSize: 12, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ValueListenableBuilder<TextEditingValue>(
                              valueListenable: _priceOfferController,
                              builder: (context, value, child) {
                                final usd = double.tryParse(value.text.replaceAll(',', '.')) ?? 0.0;
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildTextField(
                                      _priceOfferController, 
                                      'Precio Oferta', 
                                      Icons.local_offer, 
                                      isNumber: true
                                    ),
                                    if (usd > 0)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4, left: 12),
                                        child: Text(
                                          '≈ ${_currencyController.formatBs(usd)}',
                                          style: const TextStyle(color: AppColors.success, fontSize: 12, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      
                      _buildTextField(
                        _stockController, 
                        'Stock Disponible', 
                        Icons.inventory, 
                        isNumber: true,
                        isInteger: true,
                      ),

                      // --- NUEVA SECCIÓN DE CADUCIDAD ---
                      const SizedBox(height: 16),
                      SwitchListTile(
                        title: const Text('¿Es un producto perecedero?', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                        subtitle: const Text('Si es de consumo humano o animal, indica su caducidad.', style: TextStyle(fontSize: 12)),
                        value: _esPerecedero,
                        activeColor: AppColors.primaryPurple,
                        contentPadding: EdgeInsets.zero,
                        onChanged: (val) => setState(() {
                          _esPerecedero = val;
                          if (!val) _fechaCaducidad = null;
                        }),
                      ),
                      
                      if (_esPerecedero)
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(Icons.calendar_today, color: AppColors.warning),
                          title: const Text('Fecha de Caducidad', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          subtitle: Text(_fechaCaducidad != null ? DateFormat('dd/MM/yyyy').format(_fechaCaducidad!) : 'Seleccionar fecha'),
                          trailing: const Icon(Icons.edit, size: 20, color: Colors.grey),
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now().add(const Duration(days: 10)),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(const Duration(days: 365)),
                            );
                            if (date != null) setState(() => _fechaCaducidad = date);
                          },
                        ),
                      // ---------------------------------
                      
                      const SizedBox(height: 30),
                      
                      SizedBox(
                        height: 55,
                        child: ElevatedButton(
                          onPressed: _offerController.isLoading ? null : _saveOffer,
                          child: _offerController.isLoading
                              ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2))
                              : const Text('Publicar Oferta', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
      TextEditingController controller, 
      String label, 
      IconData icon,
      {bool isNumber = false, bool isInteger = false, int maxLines = 1}) {
    
    List<TextInputFormatter>? formatters;
    if (isNumber && !isInteger) {
      formatters = [FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))];
    } else if (isInteger) {
      formatters = [FilteringTextInputFormatter.digitsOnly];
    }

    return TextField(
      controller: controller,
      keyboardType: isNumber 
          ? TextInputType.numberWithOptions(decimal: !isInteger) 
          : TextInputType.text,
      inputFormatters: formatters,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label, 
        prefixIcon: Icon(icon),
        helperText: isNumber ? (isInteger ? 'Solo números enteros (Ej: 10)' : 'Usa coma o punto (Ej: 1,50)') : null,
      ),
    );
  }
}
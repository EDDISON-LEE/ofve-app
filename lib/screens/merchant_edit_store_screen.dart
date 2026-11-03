import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../core/theme/app_theme.dart';
import '../controllers/merchant_store_controller.dart';

class MerchantEditStoreScreen extends StatefulWidget {
  const MerchantEditStoreScreen({super.key});

  @override
  State<MerchantEditStoreScreen> createState() => _MerchantEditStoreScreenState();
}

class _MerchantEditStoreScreenState extends State<MerchantEditStoreScreen> {
  final _storeController = MerchantStoreController();
  
  final _nameCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _igCtrl = TextEditingController();
  final _tiktokCtrl = TextEditingController();
  final _fbCtrl = TextEditingController();
  final _waCtrl = TextEditingController();
  final _xCtrl = TextEditingController();

  String _selectedCategory = 'Otros';
  bool _aceptaDelivery = false;
  final List<String> _categoriasList = [
    'Alimentos y Bebidas', 'Tecnología', 'Ropa y Calzado', 'Salud y Belleza', 
    'Hogar y Ferretería', 'Supermercado', 'Farmacia', 'Servicios', 'Otros'
  ];

  @override
  void initState() {
    super.initState();
    // Sincronizamos los controladores cuando los datos terminen de cargar
    _storeController.addListener(_syncData);
  }

  void _syncData() {
    if (_storeController.isLoading) return;
    
    if (_nameCtrl.text.isEmpty && _storeController.nombre.isNotEmpty) {
      _nameCtrl.text = _storeController.nombre;
      _addressCtrl.text = _storeController.direccion;
      _phoneCtrl.text = _storeController.telefono;
      _emailCtrl.text = _storeController.email;
      _igCtrl.text = _storeController.instagram;
      _tiktokCtrl.text = _storeController.tiktok;
      _fbCtrl.text = _storeController.facebook;
      _waCtrl.text = _storeController.whatsapp;
      _xCtrl.text = _storeController.x;
      setState(() {
        _selectedCategory = _storeController.categoria;
        _aceptaDelivery = _storeController.aceptaDelivery;
      });
    }
  }

  @override
  void dispose() {
    _storeController.removeListener(_syncData);
    _nameCtrl.dispose();
    _addressCtrl.dispose();
    _phoneCtrl.dispose();
    _emailCtrl.dispose();
    _igCtrl.dispose();
    _tiktokCtrl.dispose();
    _fbCtrl.dispose();
    _waCtrl.dispose();
    _xCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickLogo() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      _storeController.setNewLogo(bytes, pickedFile.name);
    }
  }

  Future<void> _guardar() async {
    final success = await _storeController.saveChanges(
      newName: _nameCtrl.text,
      newCategory: _selectedCategory,
      newAddress: _addressCtrl.text,
      newPhone: _phoneCtrl.text,
      newEmail: _emailCtrl.text,
      newDelivery: _aceptaDelivery,
      newIg: _igCtrl.text,
      newTiktok: _tiktokCtrl.text,
      newFb: _fbCtrl.text,
      newWa: _waCtrl.text,
      newX: _xCtrl.text,
    );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(_storeController.successMessage ?? _storeController.errorMessage ?? ''),
        backgroundColor: success ? AppColors.success : AppColors.error,
      ));
      if (success) Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _storeController,
      builder: (context, child) {
        if (_storeController.isLoading) {
          return const Scaffold(body: Center(child: CircularProgressIndicator(color: AppColors.primaryPurple)));
        }

        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Mi Tienda')),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // LOGO
                Center(
                  child: GestureDetector(
                    onTap: _pickLogo,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: AppColors.white,
                          backgroundImage: _storeController.logoUrl.isNotEmpty 
                              ? NetworkImage(_storeController.logoUrl) 
                              : null,
                          child: _storeController.logoUrl.isEmpty 
                              ? const Icon(Icons.store, size: 50, color: AppColors.primaryPurple) 
                              : null,
                        ),
                        Positioned(
                          bottom: 0, right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(color: AppColors.primaryPurple, shape: BoxShape.circle),
                            child: const Icon(Icons.camera_alt, color: AppColors.white, size: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                TextField(controller: _nameCtrl, decoration: const InputDecoration(labelText: 'Nombre Comercial', prefixIcon: Icon(Icons.store))),
                const SizedBox(height: 12),
                
                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  decoration: const InputDecoration(labelText: 'Categoría', prefixIcon: Icon(Icons.category)),
                  items: _categoriasList.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                  onChanged: (v) => setState(() => _selectedCategory = v!),
                ),
                const SizedBox(height: 12),

                TextField(controller: _addressCtrl, decoration: const InputDecoration(labelText: 'Dirección Física', prefixIcon: Icon(Icons.location_on))),
                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(child: TextField(controller: _phoneCtrl, keyboardType: TextInputType.phone, decoration: const InputDecoration(labelText: 'Teléfono', prefixIcon: Icon(Icons.phone)))),
                    const SizedBox(width: 12),
                    Expanded(child: TextField(controller: _emailCtrl, decoration: const InputDecoration(labelText: 'Email Público', prefixIcon: Icon(Icons.email)))),
                  ],
                ),
                const SizedBox(height: 12),

                SwitchListTile(
                  title: const Text('¿Ofreces Delivery?', style: TextStyle(fontWeight: FontWeight.w600)),
                  value: _aceptaDelivery, activeColor: AppColors.primaryPurple,
                  onChanged: (v) => setState(() => _aceptaDelivery = v),
                  contentPadding: EdgeInsets.zero,
                ),
                
                const Divider(height: 30),
                const Text('Redes Sociales', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primaryPurple)),
                const SizedBox(height: 12),

                TextField(controller: _igCtrl, decoration: const InputDecoration(labelText: 'Instagram', prefixIcon: Icon(Icons.camera_alt))),
                const SizedBox(height: 12),
                TextField(controller: _tiktokCtrl, decoration: const InputDecoration(labelText: 'TikTok', prefixIcon: Icon(Icons.music_note))),
                const SizedBox(height: 12),
                TextField(controller: _fbCtrl, decoration: const InputDecoration(labelText: 'Facebook', prefixIcon: Icon(Icons.facebook))),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(child: TextField(controller: _waCtrl, decoration: const InputDecoration(labelText: 'WhatsApp', prefixIcon: Icon(Icons.chat)))),
                    const SizedBox(width: 12),
                    Expanded(child: TextField(controller: _xCtrl, decoration: const InputDecoration(labelText: 'X (Twitter)', prefixIcon: Icon(Icons.alternate_email)))),
                  ],
                ),
                
                const SizedBox(height: 30),

                SizedBox(
                  height: 55,
                  child: ElevatedButton(
                    onPressed: _storeController.isSaving ? null : _guardar,
                    child: _storeController.isSaving
                        ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2))
                        : const Text('Guardar Cambios'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
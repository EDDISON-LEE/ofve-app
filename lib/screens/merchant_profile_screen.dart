import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_selector/file_selector.dart'; // <-- FIX: Cambiado file_picker por file_selector
import '../core/theme/app_theme.dart';
import '../controllers/merchant_profile_controller.dart';
import '../controllers/categories_controller.dart'; 
import '../controllers/zones_controller.dart';
import 'map_picker_screen.dart';

class MerchantProfileScreen extends StatefulWidget {
  final VoidCallback onDocsUploaded;

  const MerchantProfileScreen({super.key, required this.onDocsUploaded});

  @override
  State<MerchantProfileScreen> createState() => _MerchantProfileScreenState();
}

class _MerchantProfileScreenState extends State<MerchantProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _profileController = MerchantProfileController();
  final _categoriesController = CategoriesController();
  final _zonesController = ZonesController();

  // Controladores de Texto
  final _nameCtrl = TextEditingController();
  final _rifCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _branchCtrl = TextEditingController();
  final _repNameCtrl = TextEditingController();
  final _repCedulaCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _igCtrl = TextEditingController();
  final _tiktokCtrl = TextEditingController();
  final _fbCtrl = TextEditingController();
  final _xCtrl = TextEditingController();
  final _waCtrl = TextEditingController();

  String? _tipoComercio;
  String? _categoria;
  bool _aceptaDelivery = false;

  @override
  void dispose() {
    _nameCtrl.dispose(); _rifCtrl.dispose(); _addressCtrl.dispose(); _branchCtrl.dispose();
    _repNameCtrl.dispose(); _repCedulaCtrl.dispose(); _phoneCtrl.dispose(); _emailCtrl.dispose();
    _igCtrl.dispose(); _tiktokCtrl.dispose(); _fbCtrl.dispose(); _xCtrl.dispose(); _waCtrl.dispose();
    _categoriesController.dispose();
    _zonesController.dispose();
    super.dispose();
  }

  Future<void> _abrirMapa() async {
    final result = await Navigator.push<Map<String, double>>(
      context,
      MaterialPageRoute(builder: (_) => MapPickerScreen(
        initialLat: _profileController.latitud,
        initialLng: _profileController.longitud,
      )),
    );

    if (result != null) {
      _profileController.setLocation(result['lat']!, result['lng']!);
    }
  }

  Future<void> _pickImage(String type) async {
    // FIX: Usando file_selector
    const typeGroup = XTypeGroup(label: 'imágenes', extensions: <String>['jpg', 'png', 'jpeg', 'webp']);
    try {
      final XFile? file = await openFile(acceptedTypeGroups: <XTypeGroup>[typeGroup]);
      if (file != null) {
        final bytes = await file.readAsBytes();
        _profileController.setImage(type, bytes, file.name);
      }
    } catch (e) {
      debugPrint('Error seleccionando imagen: $e');
    }
  }

  Future<void> _pickPdf(String type) async {
    // FIX: Usando file_selector
    const typeGroup = XTypeGroup(label: 'pdf', extensions: <String>['pdf']);
    try {
      final XFile? file = await openFile(acceptedTypeGroups: <XTypeGroup>[typeGroup]);
      if (file != null) {
        final bytes = await file.readAsBytes();
        _profileController.setPdf(type, bytes, file.name);
      }
    } catch (e) {
      debugPrint('Error seleccionando PDF: $e');
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    
    final parroquiaId = _zonesController.getSelectedParroquiaId();
    if (parroquiaId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debes seleccionar tu Estado, Municipio y Parroquia.'), backgroundColor: Colors.orange),
      );
      return;
    }

    if (_tipoComercio == null || _categoria == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona tipo y categoría.'), backgroundColor: Colors.orange),
      );
      return;
    }
    if (_profileController.latitud == null || _profileController.longitud == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debes ubicar tu comercio en el mapa.'), backgroundColor: Colors.red),
      );
      return;
    }
    if (_profileController.logoBytes == null || _profileController.fachadaBytes == null || _profileController.rifBytes == null || _profileController.legalBytes == null || _profileController.cedulasBytes == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Faltan imágenes o documentos.'), backgroundColor: Colors.red),
      );
      return;
    }

    final success = await _profileController.submitProfile(
      name: _nameCtrl.text, rif: _rifCtrl.text, address: _addressCtrl.text,
      branch: _branchCtrl.text, repName: _repNameCtrl.text, repCedula: _repCedulaCtrl.text,
      phone: _phoneCtrl.text, email: _emailCtrl.text, ig: _igCtrl.text, tiktok: _tiktokCtrl.text,
      fb: _fbCtrl.text, x: _xCtrl.text, wa: _waCtrl.text, tipoComercio: _tipoComercio!,
      categoria: _categoria!, aceptaDelivery: _aceptaDelivery,
      parroquiaId: parroquiaId,
    );

    if (success && mounted) {
      _showSuccessDialog();
    } else if (!success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_profileController.errorMessage ?? 'Error desconocido'), backgroundColor: Colors.red),
      );
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16), 
              decoration: BoxDecoration(color: AppColors.success.withValues(alpha: 0.1), shape: BoxShape.circle), 
              child: const Icon(Icons.verified, color: Colors.green, size: 60)
            ),
            const SizedBox(height: 24),
            const Text('¡Información Recibida!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text(
              'Tu información ha llegado de forma segura. Nuestro equipo (y nuestra IA) está revisando tus documentos. Este proceso tomará entre 24 y 48 horas hábiles.\n\n¡Prepárate para vender más!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54, height: 1.4),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity, height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(ctx);
                  widget.onDocsUploaded();
                  Navigator.pop(context);
                },
                child: const Text('Ir a mi Dashboard'),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_profileController, _categoriesController, _zonesController]),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Perfil del Comercio')),
          body: _profileController.isLoading || _categoriesController.isLoading || _zonesController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // NLP: "Información" suena a trámite. "Identidad" suena a marca.
                        _buildSectionTitle('1. Identidad de tu Marca'),
                        _buildTextField(_nameCtrl, 'Nombre Comercial', Icons.store, required: true),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(child: _buildDropdown('Tipo', ['empresa', 'emprendimiento', 'firma_personal'], _tipoComercio, (v) => setState(() => _tipoComercio = v))),
                            const SizedBox(width: 12),
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                initialValue: _categoria, // FIX: value -> initialValue
                                decoration: const InputDecoration(labelText: 'Categoría *'),
                                items: _categoriesController.categories.map((e) => DropdownMenuItem(value: e, child: Text(e, overflow: TextOverflow.ellipsis))).toList(),
                                onChanged: (v) => setState(() => _categoria = v),
                                validator: (v) => v == null ? 'Requerido' : null,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(child: _buildTextField(_rifCtrl, 'RIF', Icons.badge, required: true)),
                            const SizedBox(width: 12),
                            Expanded(child: _buildTextField(_branchCtrl, 'Rama / Sector', Icons.category, required: true)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(child: _buildTextField(_repNameCtrl, 'Representante', Icons.person, required: true)),
                            const SizedBox(width: 12),
                            Expanded(child: _buildTextField(_repCedulaCtrl, 'Cédula Rep.', Icons.badge, required: true)),
                          ],
                        ),
                        const SizedBox(height: 24),
                        
                        _buildSectionTitle('2. Ubicación y Cobertura'),
                        _buildTextField(_addressCtrl, 'Dirección Física', Icons.location_on, required: true),
                        const SizedBox(height: 12),
                        
                        // SELECTORES DE ZONA GEOGRÁFICA
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                initialValue: _zonesController.selectedEstado, // FIX: value -> initialValue
                                decoration: const InputDecoration(labelText: 'Estado *'),
                                items: _zonesController.estados.map((e) => DropdownMenuItem(value: e, child: Text(e, overflow: TextOverflow.ellipsis))).toList(),
                                onChanged: (v) => _zonesController.selectEstado(v),
                                validator: (v) => v == null ? 'Requerido' : null,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                initialValue: _zonesController.selectedMunicipio, // FIX: value -> initialValue
                                decoration: const InputDecoration(labelText: 'Municipio *'),
                                items: _zonesController.municipios.map((e) => DropdownMenuItem(value: e, child: Text(e, overflow: TextOverflow.ellipsis))).toList(),
                                onChanged: _zonesController.selectedEstado == null ? null : (v) => _zonesController.selectMunicipio(v),
                                validator: (v) => v == null ? 'Requerido' : null,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        DropdownButtonFormField<String>(
                          initialValue: _zonesController.selectedParroquia, // FIX: value -> initialValue
                          decoration: const InputDecoration(labelText: 'Parroquia *'),
                          items: _zonesController.parroquias.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                          onChanged: _zonesController.selectedMunicipio == null ? null : (v) => _zonesController.selectParroquia(v),
                          validator: (v) => v == null ? 'Requerido' : null,
                        ),
                        const SizedBox(height: 12),

                        InkWell(
                          onTap: _abrirMapa,
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: _profileController.latitud != null ? AppColors.success.withValues(alpha: 0.1) : AppColors.white,
                              border: Border.all(color: _profileController.latitud != null ? AppColors.success : Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Icon(_profileController.latitud != null ? Icons.check_circle : Icons.map, color: _profileController.latitud != null ? AppColors.success : AppColors.primaryPurple, size: 28),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(_profileController.latitud != null ? 'Ubicación GPS Asignada' : 'Asignar Ubicación GPS en el Mapa', style: const TextStyle(fontWeight: FontWeight.bold)),
                                      Text(
                                        _profileController.latitud != null ? 'Lat: ${_profileController.latitud!.toStringAsFixed(4)}, Lng: ${_profileController.longitud!.toStringAsFixed(4)}' : 'Requerido para aparecer en búsquedas cercanas', 
                                        style: TextStyle(fontSize: 12, color: _profileController.latitud != null ? AppColors.success : Colors.grey)
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(child: _buildTextField(_phoneCtrl, 'Teléfono', Icons.phone, isNumber: true, required: true)),
                            const SizedBox(width: 12),
                            Expanded(child: _buildTextField(_emailCtrl, 'Email Público', Icons.email, required: true)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        SwitchListTile(
                          title: const Text('¿Ofreces Delivery?', style: TextStyle(fontWeight: FontWeight.w600)),
                          value: _aceptaDelivery, 
                          activeThumbColor: AppColors.primaryPurple, // FIX: activeColor -> activeThumbColor
                          onChanged: (v) => setState(() => _aceptaDelivery = v),
                          contentPadding: EdgeInsets.zero,
                        ),
                        const SizedBox(height: 24),
                        
                        _buildSectionTitle('3. Conecta con tus Clientes'),
                        _buildTextField(_igCtrl, 'Instagram (Usuario o URL)', Icons.camera_alt),
                        const SizedBox(height: 12),
                        _buildTextField(_tiktokCtrl, 'TikTok (Usuario o URL)', Icons.music_note),
                        const SizedBox(height: 12),
                        _buildTextField(_fbCtrl, 'Facebook (Usuario o URL)', Icons.facebook),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(child: _buildTextField(_waCtrl, 'WhatsApp', Icons.chat)),
                            const SizedBox(width: 12),
                            Expanded(child: _buildTextField(_xCtrl, 'X (Twitter)', Icons.alternate_email)),
                          ],
                        ),
                        const SizedBox(height: 24),
                        
                        _buildSectionTitle('4. Escaparate Visual'),
                        Row(
                          children: [
                            Expanded(child: _buildImagePicker('Logo', _profileController.logoName, () => _pickImage('logo'))),
                            const SizedBox(width: 12),
                            Expanded(child: _buildImagePicker('Foto Fachada', _profileController.fachadaName, () => _pickImage('fachada'))),
                          ],
                        ),
                        const SizedBox(height: 24),
                        
                        _buildSectionTitle('5. Respaldo de Confianza'),
                        _buildFilePicker('1. Certificado de RIF', _profileController.rifName, () => _pickPdf('rif')),
                        const SizedBox(height: 12),
                        _buildFilePicker('2. Documento Legal (Acta/RNE)', _profileController.legalName, () => _pickPdf('legal')),
                        const SizedBox(height: 12),
                        _buildFilePicker('3. Cédula de los firmantes', _profileController.cedulasName, () => _pickPdf('cedulas')),
                        const SizedBox(height: 40),
                        
                        SizedBox(
                          height: 55,
                          child: ElevatedButton(
                            onPressed: _profileController.isLoading ? null : _submit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryPurple,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            ),
                            child: _profileController.isLoading
                                ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2))
                                : const Text('🚀 Enviar para Verificación', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12), 
      child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primaryPurple))
    );
  }

  Widget _buildTextField(TextEditingController ctrl, String label, IconData icon, {bool isNumber = false, bool required = false}) {
    return TextFormField(
      controller: ctrl,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(labelText: required ? '$label *' : label, prefixIcon: Icon(icon)),
      validator: required ? (v) => v!.isEmpty ? 'Requerido' : null : null,
    );
  }

  Widget _buildDropdown(String label, List<String> items, String? val, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      initialValue: val, // FIX: value -> initialValue
      decoration: InputDecoration(labelText: '$label *'),
      items: items.map((e) => DropdownMenuItem(value: e, child: Text(e, overflow: TextOverflow.ellipsis))).toList(),
      onChanged: onChanged,
      validator: (v) => v == null ? 'Requerido' : null,
    );
  }

  Widget _buildImagePicker(String label, String? fileName, VoidCallback onTap) {
    final hasFile = fileName != null;
    return InkWell(
      onTap: _profileController.isLoading ? null : onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: hasFile ? AppColors.success.withValues(alpha: 0.1) : AppColors.white, 
          border: Border.all(color: hasFile ? AppColors.success : Colors.grey.shade300), 
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(hasFile ? Icons.check_circle : Icons.add_photo_alternate, color: hasFile ? AppColors.success : Colors.grey, size: 30),
            const SizedBox(height: 8),
            Text(hasFile ? 'Subido' : label, style: TextStyle(fontWeight: FontWeight.bold, color: hasFile ? AppColors.success : AppColors.textDark)),
          ],
        ),
      ),
    );
  }

  Widget _buildFilePicker(String label, String? fileName, VoidCallback onTap) {
    final hasFile = fileName != null;
    return InkWell(
      onTap: _profileController.isLoading ? null : onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white, 
          border: Border.all(color: hasFile ? AppColors.success : Colors.grey.shade300), 
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          children: [
            Icon(hasFile ? Icons.check_circle : Icons.upload_file, color: hasFile ? AppColors.success : Colors.grey, size: 28),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(hasFile ? fileName! : 'Seleccionar archivo', style: TextStyle(fontSize: 12, color: hasFile ? AppColors.success : Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
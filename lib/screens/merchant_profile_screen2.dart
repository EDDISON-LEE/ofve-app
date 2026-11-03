import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;
import 'map_picker_screen.dart';

class MerchantProfileScreen extends StatefulWidget {
  final VoidCallback onDocsUploaded;

  const MerchantProfileScreen({super.key, required this.onDocsUploaded});

  @override
  State<MerchantProfileScreen> createState() => _MerchantProfileScreenState();
}

class _MerchantProfileScreenState extends State<MerchantProfileScreen> {
  final _supabase = Supabase.instance.client;
  final _formKey = GlobalKey<FormState>();

  // --- CONTROLADORES DE TEXTO ---
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

  // --- VARIABLES DE SELECCIÓN ---
  String? _tipoComercio;
  String? _categoria;
  bool _aceptaDelivery = false;
  final List<String> _categoriasList = [
    'Alimentos y Bebidas', 'Tecnología', 'Ropa y Calzado', 'Salud y Belleza', 
    'Hogar y Ferretería', 'Supermercado', 'Farmacia', 'Servicios', 'Otros'
  ];

  // --- GEOLOCALIZACIÓN ---
  double? _latitud;
  double? _longitud;

  // --- ARCHIVOS E IMÁGENES ---
  Uint8List? _logoBytes; String? _logoName;
  Uint8List? _fachadaBytes; String? _fachadaName;
  Uint8List? _rifBytes; String? _rifName;
  Uint8List? _legalBytes; String? _legalName;
  Uint8List? _cedulasBytes; String? _cedulasName;

  bool _isLoading = false;
  
  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

  @override
  void dispose() {
    _nameCtrl.dispose(); _rifCtrl.dispose(); _addressCtrl.dispose(); _branchCtrl.dispose();
    _repNameCtrl.dispose(); _repCedulaCtrl.dispose(); _phoneCtrl.dispose(); _emailCtrl.dispose();
    _igCtrl.dispose(); _tiktokCtrl.dispose(); _fbCtrl.dispose(); _xCtrl.dispose(); _waCtrl.dispose();
    super.dispose();
  }

  Future<void> _abrirMapa() async {
    final result = await Navigator.push<Map<String, double>>(
      context,
      MaterialPageRoute(
        builder: (_) => MapPickerScreen(
          initialLat: _latitud,
          initialLng: _longitud,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        _latitud = result['lat'];
        _longitud = result['lng'];
      });
    }
  }

  Future<void> _pickImage(String type) async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image, withData: true);
    if (result != null && result.files.single.bytes != null) {
      setState(() {
        if (type == 'logo') { _logoBytes = result.files.single.bytes; _logoName = result.files.single.name; }
        if (type == 'fachada') { _fachadaBytes = result.files.single.bytes; _fachadaName = result.files.single.name; }
      });
    }
  }

  Future<void> _pickPdf(String type) async {
    final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf'], withData: true);
    if (result != null && result.files.single.bytes != null) {
      setState(() {
        if (type == 'rif') { _rifBytes = result.files.single.bytes; _rifName = result.files.single.name; }
        if (type == 'legal') { _legalBytes = result.files.single.bytes; _legalName = result.files.single.name; }
        if (type == 'cedulas') { _cedulasBytes = result.files.single.bytes; _cedulasName = result.files.single.name; }
      });
    }
  }

  Future<String?> _uploadToBucket(Uint8List bytes, String fileName, String bucket, String prefix) async {
    try {
      final userId = _supabase.auth.currentUser!.id;
      final ext = p.extension(fileName);
      final finalName = '${prefix}_$userId$ext';
      final path = '$userId/$finalName';

      await _supabase.storage.from(bucket).uploadBinary(path, bytes, fileOptions: const FileOptions(upsert: true));

      if (bucket == 'comercios_assets') return _supabase.storage.from(bucket).getPublicUrl(path);
      return path;
    } catch (e) {
      debugPrint('❌ Error subiendo a $bucket: $e');
      return null;
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_tipoComercio == null || _categoria == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Selecciona tipo y categoría.'), backgroundColor: Colors.orange));
      return;
    }
    if (_latitud == null || _longitud == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Debes ubicar tu comercio en el mapa.'), backgroundColor: Colors.red));
      return;
    }
    if (_logoBytes == null || _fachadaBytes == null || _rifBytes == null || _legalBytes == null || _cedulasBytes == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Faltan imágenes o documentos.'), backgroundColor: Colors.red));
      return;
    }

    setState(() => _isLoading = true);
    final userId = _supabase.auth.currentUser!.id;

    try {
      final logoUrl = await _uploadToBucket(_logoBytes!, _logoName!, 'comercios_assets', 'logo');
      final fachadaUrl = await _uploadToBucket(_fachadaBytes!, _fachadaName!, 'comercios_assets', 'fachada');
      final docRifUrl = await _uploadToBucket(_rifBytes!, _rifName!, 'documentos_comercios', 'rif');
      final docLegalUrl = await _uploadToBucket(_legalBytes!, _legalName!, 'documentos_comercios', 'legal');
      final docCedulasUrl = await _uploadToBucket(_cedulasBytes!, _cedulasName!, 'documentos_comercios', 'cedulas');

      if (logoUrl == null || fachadaUrl == null || docRifUrl == null || docLegalUrl == null || docCedulasUrl == null) {
        throw Exception('No se pudieron subir todos los archivos.');
      }

      final redes = {
        'instagram': _igCtrl.text.trim(), 'tiktok': _tiktokCtrl.text.trim(),
        'facebook': _fbCtrl.text.trim(), 'x': _xCtrl.text.trim(), 'whatsapp': _waCtrl.text.trim(),
      };

      final pointWkt = 'POINT($_longitud $_latitud)'; 

      await _supabase.from('comercios').update({
        'nombre_comercial': _nameCtrl.text.trim(),
        'tipo_comercio': _tipoComercio,
        'categoria': _categoria,
        'rif': _rifCtrl.text.trim(),
        'direccion_texto': _addressCtrl.text.trim(),
        'rama': _branchCtrl.text.trim(),
        'representante': _repNameCtrl.text.trim(),
        'cedula': _repCedulaCtrl.text.trim(),
        'telefono_empresa': _phoneCtrl.text.trim(),
        'email_empresa': _emailCtrl.text.trim(),
        'acepta_delivery': _aceptaDelivery,
        'redes_sociales': redes,
        'logo_url': logoUrl,
        'foto_fachada_url': fachadaUrl,
        'doc_rif_url': docRifUrl,
        'doc_constitutivo_url': docLegalUrl,
        'doc_cedulas_url': docCedulasUrl,
        'estatus_verificacion': 'En Revision', 
        'latitud': _latitud,
        'longitud': _longitud,
        'ubicacion_fisica': pointWkt,
      }).eq('usuario_id', userId);

      // --- LLAMADA A LA EDGE FUNCTION DE VALIDACIÓN CON IA ---
      try {
        // Obtenemos el comercio_id para enviarlo a la función
        final comercioData = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
        
        await _supabase.functions.invoke(
          'validate-merchant-docs',
          body: {
            'merchant_id': comercioData['id'],
            'doc_rif_path': docRifUrl,
            'doc_legal_path': docLegalUrl,
            'doc_cedulas_path': docCedulasUrl,
            'form_data': {
              'rif': _rifCtrl.text.trim(),
              'nombre': _nameCtrl.text.trim(),
            }
          },
        );
        debugPrint('✅ Validación con IA iniciada.');
      } catch (e) {
        debugPrint('⚠️ Error al invocar la validación con IA: $e');
        // No lanzamos excepción para no bloquear al usuario si la IA falla
      }

      if (mounted) _showSuccessDialog();
      
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red));
    } finally {
      if (mounted) setState(() => _isLoading = false);
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
            Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), shape: BoxShape.circle), child: const Icon(Icons.verified, color: Colors.green, size: 60)),
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
                style: ElevatedButton.styleFrom(backgroundColor: primaryPurple, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                onPressed: () {
                  Navigator.pop(ctx);
                  widget.onDocsUploaded();
                  Navigator.pop(context);
                },
                child: const Text('Ir a mi Dashboard', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Completar Perfil', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSectionTitle('1. Información del Negocio'),
              _buildTextField(_nameCtrl, 'Nombre Comercial', Icons.store, required: true),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildDropdown('Tipo', ['empresa', 'emprendimiento', 'firma_personal'], _tipoComercio, (v) => setState(() => _tipoComercio = v))),
                  const SizedBox(width: 12),
                  Expanded(child: _buildDropdown('Categoría', _categoriasList, _categoria, (v) => setState(() => _categoria = v))),
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
              _buildSectionTitle('2. Contacto y Ubicación'),
              _buildTextField(_addressCtrl, 'Dirección Física', Icons.location_on, required: true),
              const SizedBox(height: 12),
              
              InkWell(
                onTap: _abrirMapa,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: _latitud != null ? Colors.green.withOpacity(0.1) : Colors.white,
                    border: Border.all(color: _latitud != null ? Colors.green : Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(_latitud != null ? Icons.check_circle : Icons.map, color: _latitud != null ? Colors.green : primaryPurple, size: 28),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_latitud != null ? 'Ubicación Asignada' : 'Asignar Ubicación en el Mapa', style: const TextStyle(fontWeight: FontWeight.bold)),
                            Text(_latitud != null ? 'Lat: ${_latitud!.toStringAsFixed(4)}, Lng: ${_longitud!.toStringAsFixed(4)}' : 'Requerido para aparecer en búsquedas cercanas', style: TextStyle(fontSize: 12, color: _latitud != null ? Colors.green : Colors.grey)),
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
                value: _aceptaDelivery, activeColor: primaryPurple,
                onChanged: (v) => setState(() => _aceptaDelivery = v),
                contentPadding: EdgeInsets.zero,
              ),

              const SizedBox(height: 24),
              _buildSectionTitle('3. Redes Sociales'),
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
              _buildSectionTitle('4. Imágenes del Comercio'),
              Row(
                children: [
                  Expanded(child: _buildImagePicker('Logo', _logoName, () => _pickImage('logo'))),
                  const SizedBox(width: 12),
                  Expanded(child: _buildImagePicker('Foto Fachada', _fachadaName, () => _pickImage('fachada'))),
                ],
              ),

              const SizedBox(height: 24),
              _buildSectionTitle('5. Documentos Legales (PDF)'),
              _buildFilePicker('1. Certificado de RIF', _rifName, () => _pickPdf('rif')),
              const SizedBox(height: 12),
              _buildFilePicker('2. Documento Legal (Acta/RNE)', _legalName, () => _pickPdf('legal')),
              const SizedBox(height: 12),
              _buildFilePicker('3. Cédula de los firmantes', _cedulasName, () => _pickPdf('cedulas')),

              const SizedBox(height: 40),
              SizedBox(
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: primaryPurple, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                  onPressed: _isLoading ? null : _submit,
                  child: _isLoading
                      ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                      : const Text('Guardar y Enviar a Revisión', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(padding: const EdgeInsets.only(bottom: 12), child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryPurple)));
  }

  Widget _buildTextField(TextEditingController ctrl, String label, IconData icon, {bool isNumber = false, bool required = false}) {
    return TextFormField(
      controller: ctrl,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(labelText: required ? '$label *' : label, prefixIcon: Icon(icon), filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none)),
      validator: required ? (v) => v!.isEmpty ? 'Requerido' : null : null,
    );
  }

  Widget _buildDropdown(String label, List<String> items, String? val, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      value: val,
      decoration: InputDecoration(labelText: '$label *', filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none)),
      items: items.map((e) => DropdownMenuItem(value: e, child: Text(e, overflow: TextOverflow.ellipsis))).toList(),
      onChanged: onChanged,
      validator: (v) => v == null ? 'Requerido' : null,
    );
  }

  Widget _buildImagePicker(String label, String? fileName, VoidCallback onTap) {
    final hasFile = fileName != null;
    return InkWell(
      onTap: _isLoading ? null : onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 100,
        decoration: BoxDecoration(color: hasFile ? Colors.green.withOpacity(0.1) : Colors.white, border: Border.all(color: hasFile ? Colors.green : Colors.grey.shade300), borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(hasFile ? Icons.check_circle : Icons.add_photo_alternate, color: hasFile ? Colors.green : Colors.grey, size: 30),
            const SizedBox(height: 8),
            Text(hasFile ? 'Subido' : label, style: TextStyle(fontWeight: FontWeight.bold, color: hasFile ? Colors.green : Colors.black87)),
          ],
        ),
      ),
    );
  }

  Widget _buildFilePicker(String label, String? fileName, VoidCallback onTap) {
    final hasFile = fileName != null;
    return InkWell(
      onTap: _isLoading ? null : onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, border: Border.all(color: hasFile ? Colors.green : Colors.grey.shade300), borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Icon(hasFile ? Icons.check_circle : Icons.upload_file, color: hasFile ? Colors.green : Colors.grey, size: 28),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(hasFile ? fileName! : 'Seleccionar archivo', style: TextStyle(fontSize: 12, color: hasFile ? Colors.green : Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
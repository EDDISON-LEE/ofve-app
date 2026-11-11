import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';

class MerchantProfileScreen extends StatefulWidget {
  final VoidCallback onDocsUploaded;

  const MerchantProfileScreen({super.key, required this.onDocsUploaded});

  @override
  State<MerchantProfileScreen> createState() => _MerchantProfileScreenState();
}

class _MerchantProfileScreenState extends State<MerchantProfileScreen> {
  final _supabase = Supabase.instance.client;
  String? _tipoComercio;
  
  // FIX: Usamos XFile en lugar de File para evitar problemas de permisos en Android
  XFile? _docRif;
  XFile? _docConstitutivo;
  XFile? _docCedulas;
  
  bool _isLoading = false;

  Future<XFile?> _pickFile({required bool isPdfOnly}) async {
    final typeGroup = XTypeGroup(
      label: isPdfOnly ? 'Documentos PDF' : 'Imágenes',
      extensions: isPdfOnly ? ['pdf'] : ['jpg', 'jpeg', 'png', 'webp'],
    );

    try {
      return await openFile(acceptedTypeGroups: [typeGroup]);
    } catch (e) {
      debugPrint('Error al seleccionar archivo: $e');
    }
    return null;
  }

  // FIX: Comprime imágenes en memoria (Bytes), no en disco
  Future<Uint8List> _processFile(XFile file) async {
    final ext = file.name.split('.').last.toLowerCase();
    
    // Si es PDF, lo leemos tal cual
    if (ext == 'pdf') {
      return await file.readAsBytes();
    }

    // Si es imagen, la comprimimos a WebP en memoria
    final bytes = await file.readAsBytes();
    try {
      final result = await FlutterImageCompress.compressWithList(
        bytes,
        minWidth: 800,
        minHeight: 800,
        quality: 80,
        format: CompressFormat.webp,
      );
      return result;
    } catch (e) {
      debugPrint('Error comprimiendo imagen: $e');
      return bytes; // Si falla, sube la original
    }
  }

  Future<String?> _uploadDocument(XFile file, String fileName) async {
    try {
      final processedBytes = await _processFile(file);
      final isPdf = file.name.split('.').last.toLowerCase() == 'pdf';
      final ext = isPdf ? 'pdf' : 'webp';
      final finalName = '$fileName.$ext';
      
      final userId = _supabase.auth.currentUser!.id;
      final path = '$userId/$finalName';

      // FIX: Subimos usando uploadBinary, que es a prueba de fallos de rutas
      await _supabase.storage.from('documentos_comercios').uploadBinary(
        path, 
        processedBytes,
        fileOptions: const FileOptions(
          upsert: true,
          contentType: 'application/octet-stream',
        ),
      );

      return path;
    } catch (e) {
      debugPrint('Error subiendo archivo: $e');
      return null;
    }
  }

  Future<void> _submitDocs() async {
    if (_tipoComercio == null || _docRif == null || _docConstitutivo == null || _docCedulas == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debes seleccionar el tipo y subir los 3 documentos.'), backgroundColor: Colors.orange),
      );
      return;
    }

    setState(() => _isLoading = true);
    final userId = _supabase.auth.currentUser!.id;

    try {
      final urlRif = await _uploadDocument(_docRif!, 'rif_$userId');
      final urlConst = await _uploadDocument(_docConstitutivo!, 'constitutivo_$userId');
      final urlCedulas = await _uploadDocument(_docCedulas!, 'cedulas_$userId');

      if (urlRif == null || urlConst == null || urlCedulas == null) {
        throw Exception('Error al subir los documentos al servidor. Revisa tu conexión.');
      }

      await _supabase.from('comercios').update({
        'tipo_comercio': _tipoComercio,
        'doc_rif_url': urlRif,
        'doc_constitutivo_url': urlConst,
        'doc_cedulas_url': urlCedulas,
        'estatus_verificacion': 'En Revision', 
      }).eq('usuario_id', userId);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('¡Documentos enviados! Tu cuenta está en revisión.'), backgroundColor: AppColors.success),
        );
        widget.onDocsUploaded();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgTop,
      appBar: AppBar(
        title: const Text('Verificación de Negocio', style: TextStyle(fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: false, 
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.red),
            tooltip: 'Cerrar Sesión',
            onPressed: () => _supabase.auth.signOut(),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primaryPurple.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primaryPurple.withValues(alpha: 0.3)),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.verified_user, color: AppColors.primaryPurple, size: 40),
                    SizedBox(height: 12),
                    Text(
                      'Estás a un paso de activar tu cuenta y empezar a vender.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Para garantizar la seguridad de los clientes, verifica tu identidad. Este proceso tarda menos de 48 horas.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, color: AppColors.textLight, height: 1.4),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              
              DropdownButtonFormField<String>(
                initialValue: _tipoComercio, 
                decoration: const InputDecoration(
                  labelText: 'Tipo de Comercio',
                  prefixIcon: Icon(Icons.store),
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'empresa', child: Text('Empresa')),
                  DropdownMenuItem(value: 'emprendimiento', child: Text('Emprendimiento')),
                  DropdownMenuItem(value: 'firma_personal', child: Text('Firma Personal')),
                ],
                onChanged: (v) => setState(() => _tipoComercio = v),
              ),
              const SizedBox(height: 20),

              _buildFilePicker(
                title: '1. RIF (Identidad Fiscal)',
                subtitle: 'Documento PDF emitido por el SENIAT',
                file: _docRif,
                onPick: () async {
                  final f = await _pickFile(isPdfOnly: true);
                  if (f != null) setState(() => _docRif = f);
                },
              ),
              const SizedBox(height: 12),

              if (_tipoComercio == 'empresa')
                _buildFilePicker(
                  title: '2. Acta Constitutiva',
                  subtitle: 'Documento legal de creación (PDF)',
                  file: _docConstitutivo,
                  onPick: () async {
                    final f = await _pickFile(isPdfOnly: true);
                    if (f != null) setState(() => _docConstitutivo = f);
                  },
                )
              else if (_tipoComercio == 'emprendimiento')
                _buildFilePicker(
                  title: '2. Certificado RNE',
                  subtitle: 'Registro Nacional de Emprendimiento (PDF)',
                  file: _docConstitutivo,
                  onPick: () async {
                    final f = await _pickFile(isPdfOnly: true);
                    if (f != null) setState(() => _docConstitutivo = f);
                  },
                )
              else if (_tipoComercio == 'firma_personal')
                _buildFilePicker(
                  title: '2. Documento Constitutivo',
                  subtitle: 'Documento que formalice la firma (PDF)',
                  file: _docConstitutivo,
                  onPick: () async {
                    final f = await _pickFile(isPdfOnly: true);
                    if (f != null) setState(() => _docConstitutivo = f);
                  },
                )
              else
                _buildFilePicker(
                  title: '2. Documento Legal',
                  subtitle: 'Selecciona primero el tipo de comercio (PDF)',
                  file: _docConstitutivo,
                  onPick: () {},
                ),
              const SizedBox(height: 12),

              _buildFilePicker(
                title: '3. Cédula de los firmantes',
                subtitle: 'Foto clara por ambos lados (JPG/PNG)',
                file: _docCedulas,
                onPick: () async {
                  final f = await _pickFile(isPdfOnly: false);
                  if (f != null) setState(() => _docCedulas = f);
                },
              ),

              const SizedBox(height: 30),
              
              SizedBox(
                height: 55,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submitDocs,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryPurple,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: _isLoading
                      ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                      : const Text('🚀 Solicitar Verificación', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilePicker({
    required String title,
    required String subtitle,
    required XFile? file,
    required VoidCallback onPick,
  }) {
    return InkWell(
      onTap: _isLoading ? null : onPick,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: file != null ? AppColors.success : Colors.grey.shade300, width: file != null ? 2 : 1),
          borderRadius: BorderRadius.circular(16),
          color: file != null ? AppColors.success.withValues(alpha: 0.05) : Colors.white,
        ),
        child: Row(
          children: [
            Icon(
              file != null ? Icons.check_circle : Icons.upload_file,
              color: file != null ? AppColors.success : Colors.grey,
              size: 32,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(height: 2),
                  Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  if (file != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      file.name, // En XFile, usamos .name en lugar de la ruta
                      style: const TextStyle(fontSize: 11, color: AppColors.success, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;

class MerchantProfileScreen extends StatefulWidget {
  final VoidCallback onDocsUploaded;

  const MerchantProfileScreen({super.key, required this.onDocsUploaded});

  @override
  State<MerchantProfileScreen> createState() => _MerchantProfileScreenState();
}

class _MerchantProfileScreenState extends State<MerchantProfileScreen> {
  final _supabase = Supabase.instance.client;
  String? _tipoComercio;
  
  File? _docRif;
  File? _docConstitutivo;
  File? _docCedulas;
  
  bool _isLoading = false;

  Future<File?> _pickFile({required bool isPdfOnly}) async {
    final result = await FilePicker.platform.pickFiles(
      type: isPdfOnly ? FileType.custom : FileType.image,
      allowedExtensions: isPdfOnly ? ['pdf'] : ['jpg', 'jpeg', 'png', 'webp'],
    );

    if (result != null && result.files.single.path != null) {
      return File(result.files.single.path!);
    }
    return null;
  }

  // Función Senior: Comprime imágenes a WebP. Los PDFs pasan intactos.
  Future<File> _processFile(File file) async {
    final extension = p.extension(file.path).toLowerCase();
    
    if (extension == '.pdf') return file;

    final targetPath = '${p.dirname(file.path)}/${p.basenameWithoutExtension(file.path)}.webp';
    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      format: CompressFormat.webp,
      quality: 80, // Calidad óptima
    );

    if (result != null) return File(result.path);
    return file;
  }

  Future<String?> _uploadDocument(File file, String fileName) async {
    try {
      final processedFile = await _processFile(file);
      final ext = p.extension(processedFile.path);
      final finalName = '$fileName$ext';
      
      final userId = _supabase.auth.currentUser!.id;
      final path = '$userId/$finalName';

      await _supabase.storage.from('documentos_comercios').upload(
        path, 
        processedFile,
        fileOptions: const FileOptions(upsert: true),
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
        const SnackBar(content: Text('Debes seleccionar el tipo y subir los 3 documentos.')),
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
        throw Exception('Error al subir los documentos al Storage.');
      }

      // Actualizamos la BD: cambia a 'En Revision' y guarda las rutas
      await _supabase.from('comercios').update({
        'tipo_comercio': _tipoComercio,
        'doc_rif_url': urlRif,
        'doc_constitutivo_url': urlConst,
        'doc_cedulas_url': urlCedulas,
        'estatus_verificacion': 'En Revision', 
      }).eq('usuario_id', userId);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Documentos enviados. Tu cuenta está en revisión.')),
        );
        // Avisamos al AuthGate que ya terminamos para que nos deje pasar
        widget.onDocsUploaded();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completa tu perfil'),
        automaticallyImplyLeading: false, // Bloquea el botón de regresar
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Cerrar Sesión',
            onPressed: () => _supabase.auth.signOut(),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Para proteger a los usuarios, necesitamos validar tu negocio. Sube los documentos requeridos para activar tu cuenta.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              
              DropdownButtonFormField<String>(
                value: _tipoComercio,
                decoration: const InputDecoration(
                  labelText: 'Tipo de Comercio',
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

              // 1. Certificado de RIF
              _buildFilePicker(
                title: '1. Certificado de RIF',
                subtitle: 'Documento PDF emitido por el SENIAT',
                file: _docRif,
                onPick: () async {
                  final f = await _pickFile(isPdfOnly: true);
                  if (f != null) setState(() => _docRif = f);
                },
              ),
              const SizedBox(height: 12),

              // 2. Documento Constitutivo / Acta
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

              // 3. Cédulas de firmantes
              _buildFilePicker(
                title: '3. Cédula de los firmantes',
                subtitle: 'Foto clara (se comprimirá a WebP)',
                file: _docCedulas,
                onPick: () async {
                  final f = await _pickFile(isPdfOnly: false);
                  if (f != null) setState(() => _docCedulas = f);
                },
              ),

              const SizedBox(height: 30),
              
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submitDocs,
                  child: _isLoading
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : const Text('Enviar a Revisión'),
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
    required File? file,
    required VoidCallback onPick,
  }) {
    return InkWell(
      onTap: _isLoading ? null : onPick,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: file != null ? Colors.green : Colors.grey),
          borderRadius: BorderRadius.circular(8),
          color: file != null ? Colors.green.withValues(alpha: 0.1) : null,
        ),
        child: Row(
          children: [
            Icon(
              file != null ? Icons.check_circle : Icons.upload_file,
              color: file != null ? Colors.green : Colors.grey,
              size: 32,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  if (file != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      p.basename(file.path),
                      style: const TextStyle(fontSize: 10, color: Colors.green, fontWeight: FontWeight.bold),
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
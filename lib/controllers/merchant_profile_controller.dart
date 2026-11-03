import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;

class MerchantProfileController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = false;
  String? errorMessage;
  bool isSuccess = false;

  // Archivos en memoria
  Uint8List? logoBytes; String? logoName;
  Uint8List? fachadaBytes; String? fachadaName;
  Uint8List? rifBytes; String? rifName;
  Uint8List? legalBytes; String? legalName;
  Uint8List? cedulasBytes; String? cedulasName;

  // Geolocalización
  double? latitud;
  double? longitud;

  void setImage(String type, Uint8List bytes, String name) {
    if (type == 'logo') { logoBytes = bytes; logoName = name; }
    if (type == 'fachada') { fachadaBytes = bytes; fachadaName = name; }
    notifyListeners();
  }

  void setPdf(String type, Uint8List bytes, String name) {
    if (type == 'rif') { rifBytes = bytes; rifName = name; }
    if (type == 'legal') { legalBytes = bytes; legalName = name; }
    if (type == 'cedulas') { cedulasBytes = bytes; cedulasName = name; }
    notifyListeners();
  }

  void setLocation(double lat, double lng) {
    latitud = lat;
    longitud = lng;
    notifyListeners();
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

  Future<bool> submitProfile({
    required String name,
    required String rif,
    required String address,
    required String branch,
    required String repName,
    required String repCedula,
    required String phone,
    required String email,
    required String ig,
    required String tiktok,
    required String fb,
    required String x,
    required String wa,
    required String tipoComercio,
    required String categoria,
    required bool aceptaDelivery,
    required int parroquiaId, // <-- NUEVO PARÁMETRO
  }) async {
    isLoading = true;
    errorMessage = null;
    isSuccess = false;
    notifyListeners();

    final userId = _supabase.auth.currentUser!.id;

    try {
      final logoUrl = await _uploadToBucket(logoBytes!, logoName!, 'comercios_assets', 'logo');
      final fachadaUrl = await _uploadToBucket(fachadaBytes!, fachadaName!, 'comercios_assets', 'fachada');
      final docRifUrl = await _uploadToBucket(rifBytes!, rifName!, 'documentos_comercios', 'rif');
      final docLegalUrl = await _uploadToBucket(legalBytes!, legalName!, 'documentos_comercios', 'legal');
      final docCedulasUrl = await _uploadToBucket(cedulasBytes!, cedulasName!, 'documentos_comercios', 'cedulas');

      if (logoUrl == null || fachadaUrl == null || docRifUrl == null || docLegalUrl == null || docCedulasUrl == null) {
        throw Exception('No se pudieron subir todos los archivos.');
      }

      final redes = {
        'instagram': ig.trim(), 'tiktok': tiktok.trim(),
        'facebook': fb.trim(), 'x': x.trim(), 'whatsapp': wa.trim(),
      };

      final pointWkt = 'POINT($longitud $latitud)';

      await _supabase.from('comercios').update({
        'nombre_comercial': name.trim(),
        'tipo_comercio': tipoComercio,
        'categoria': categoria,
        'rif': rif.trim(),
        'direccion_texto': address.trim(),
        'rama': branch.trim(),
        'representante': repName.trim(),
        'cedula': repCedula.trim(),
        'telefono_empresa': phone.trim(),
        'email_empresa': email.trim(),
        'acepta_delivery': aceptaDelivery,
        'redes_sociales': redes,
        'logo_url': logoUrl,
        'foto_fachada_url': fachadaUrl,
        'doc_rif_url': docRifUrl,
        'doc_constitutivo_url': docLegalUrl,
        'doc_cedulas_url': docCedulasUrl,
        'estatus_verificacion': 'En Revision', 
        'latitud': latitud,
        'longitud': longitud,
        'ubicacion_fisica': pointWkt,
        'parroquia_id': parroquiaId, // <-- GUARDAMOS LA PARROQUIA
      }).eq('usuario_id', userId);

      // Invocación a la IA en segundo plano
      try {
        final comercioData = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
        await _supabase.functions.invoke('validate-merchant-docs', body: {
          'merchant_id': comercioData['id'],
          'doc_rif_path': docRifUrl,
          'doc_legal_path': docLegalUrl,
          'doc_cedulas_path': docCedulasUrl,
          'form_data': {'rif': rif.trim(), 'nombre': name.trim()}
        });
      } catch (e) {
        debugPrint('⚠️ Error IA: $e');
      }

      isSuccess = true;
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
import 'dart:typed_data'; // <-- IMPORTACIÓN QUE FALTABA
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

class MerchantStoreController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  bool isSaving = false;
  String? errorMessage;
  String? successMessage;

  // Datos de la tienda
  String nombre = '';
  String categoria = 'Otros';
  String direccion = '';
  String telefono = '';
  String email = '';
  String logoUrl = '';
  bool aceptaDelivery = false;
  
  // Redes sociales
  String instagram = '';
  String tiktok = '';
  String facebook = '';
  String whatsapp = '';
  String x = '';

  Uint8List? _newLogoBytes;
  String? _newLogoName;

  MerchantStoreController() {
    loadStoreData();
  }

  Future<void> loadStoreData() async {
    isLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      final data = await _supabase
          .from('comercios')
          .select('*')
          .eq('usuario_id', userId)
          .single();

      nombre = data['nombre_comercial'] ?? '';
      categoria = data['categoria'] ?? 'Otros';
      direccion = data['direccion_texto'] ?? '';
      telefono = data['telefono_empresa'] ?? '';
      email = data['email_empresa'] ?? '';
      logoUrl = data['logo_url'] ?? '';
      aceptaDelivery = data['acepta_delivery'] ?? false;
      
      final redes = data['redes_sociales'] as Map<String, dynamic>? ?? {};
      instagram = redes['instagram'] ?? '';
      tiktok = redes['tiktok'] ?? '';
      facebook = redes['facebook'] ?? '';
      whatsapp = redes['whatsapp'] ?? '';
      x = redes['x'] ?? '';
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void setNewLogo(Uint8List bytes, String name) {
    _newLogoBytes = bytes;
    _newLogoName = name;
    notifyListeners();
  }

  Future<bool> saveChanges({
    required String newName,
    required String newCategory,
    required String newAddress,
    required String newPhone,
    required String newEmail,
    required bool newDelivery,
    required String newIg,
    required String newTiktok,
    required String newFb,
    required String newWa,
    required String newX,
  }) async {
    isSaving = true;
    errorMessage = null;
    successMessage = null;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;

      // 1. Si hay un logo nuevo, lo subimos a Storage
      String finalLogoUrl = logoUrl;
      if (_newLogoBytes != null && _newLogoName != null) {
        final ext = p.extension(_newLogoName!);
        final finalName = 'logo_${DateTime.now().millisecondsSinceEpoch}$ext';
        final path = '$userId/$finalName';

        await _supabase.storage.from('comercios_assets').uploadBinary(
          path, _newLogoBytes!, fileOptions: const FileOptions(upsert: true)
        );
        finalLogoUrl = _supabase.storage.from('comercios_assets').getPublicUrl(path);
      }

      // 2. Actualizamos la base de datos
      await _supabase.from('comercios').update({
        'nombre_comercial': newName.trim(),
        'categoria': newCategory,
        'direccion_texto': newAddress.trim(),
        'telefono_empresa': newPhone.trim(),
        'email_empresa': newEmail.trim(),
        'acepta_delivery': newDelivery,
        'logo_url': finalLogoUrl,
        'redes_sociales': {
          'instagram': newIg.trim(),
          'tiktok': newTiktok.trim(),
          'facebook': newFb.trim(),
          'whatsapp': newWa.trim(),
          'x': newX.trim(),
        }
      }).eq('usuario_id', userId);

      nombre = newName.trim();
      categoria = newCategory;
      direccion = newAddress.trim();
      telefono = newPhone.trim();
      email = newEmail.trim();
      aceptaDelivery = newDelivery;
      logoUrl = finalLogoUrl;

      successMessage = '¡Información actualizada con éxito!';
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isSaving = false;
      notifyListeners();
    }
  }
}
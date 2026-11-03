import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ZonesController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> allZones = [];

  // Listas filtradas para los dropdowns
  List<String> estados = [];
  List<String> municipios = [];
  List<String> parroquias = [];

  // Selecciones actuales
  String? selectedEstado;
  String? selectedMunicipio;
  String? selectedParroquia;

  ZonesController() {
    loadZones();
  }

  Future<void> loadZones() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _supabase
          .from('geo_zonas')
          .select('*')
          .order('estado', ascending: true)
          .order('municipio', ascending: true)
          .order('parroquia', ascending: true);
      
      allZones = response;
      
      // Extraer estados únicos
      estados = allZones.map((z) => z['estado'].toString()).toSet().toList();
    } catch (e) {
      debugPrint('Error cargando zonas: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void selectEstado(String? estado) {
    selectedEstado = estado;
    selectedMunicipio = null;
    selectedParroquia = null;
    parroquias.clear();

    if (estado != null) {
      municipios = allZones
          .where((z) => z['estado'] == estado)
          .map((z) => z['municipio'].toString())
          .toSet()
          .toList();
    } else {
      municipios.clear();
    }
    notifyListeners();
  }

  void selectMunicipio(String? municipio) {
    selectedMunicipio = municipio;
    selectedParroquia = null;

    if (municipio != null && selectedEstado != null) {
      parroquias = allZones
          .where((z) => z['estado'] == selectedEstado && z['municipio'] == municipio)
          .map((z) => z['parroquia'].toString())
          .toSet()
          .toList();
    } else {
      parroquias.clear();
    }
    notifyListeners();
  }

  void selectParroquia(String? parroquia) {
    selectedParroquia = parroquia;
    notifyListeners();
  }

  // Obtener el ID de la zona seleccionada para guardarlo en la BD
  int? getSelectedParroquiaId() {
    if (selectedEstado == null || selectedMunicipio == null || selectedParroquia == null) return null;
    
    final zone = allZones.firstWhere(
      (z) => z['estado'] == selectedEstado && 
             z['municipio'] == selectedMunicipio && 
             z['parroquia'] == selectedParroquia,
      orElse: () => null,
    );
    return zone != null ? zone['id'] : null;
  }
}
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminZonesController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> zones = [];
  String? errorMessage;

  AdminZonesController() {
    loadZones();
  }

  Future<void> loadZones() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await _supabase
          .from('geo_zonas')
          .select('*')
          .order('estado', ascending: true)
          .order('municipio', ascending: true);
      zones = response;
    } catch (e) {
      debugPrint('Error cargando zonas: $e');
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> addZone({
    required String estado,
    required String municipio,
    required String parroquia,
  }) async {
    try {
      await _supabase.from('geo_zonas').insert({
        'estado': estado.trim(),
        'municipio': municipio.trim(),
        'parroquia': parroquia.trim(),
      });
      await loadZones();
      return true;
    } catch (e) {
      debugPrint('Error creando zona: $e');
      errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<void> deleteZone(String id) async {
    try {
      await _supabase.from('geo_zonas').delete().eq('id', id);
      await loadZones();
    } catch (e) {
      debugPrint('Error eliminando zona: $e');
    }
  }
}
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NearbyOffersController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  String? errorMessage;
  List<dynamic> nearbyOffers = [];
  Position? currentPosition;

  NearbyOffersController() {
    loadNearbyOffers();
  }

  Future<void> loadNearbyOffers() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      // 1. Verificar permisos de GPS
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) throw Exception('Por favor, activa tu GPS.');

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) throw Exception('Permisos de ubicación denegados.');
      }

      // 2. Obtener posición actual
      currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // 3. Consultar ofertas en un radio de 5000 metros (5KM)
      final response = await _supabase.rpc('obtener_ofertas_cercanas', params: {
        'lat': currentPosition!.latitude,
        'lng': currentPosition!.longitude,
        'radio_metros': 5000, 
      });

      nearbyOffers = response;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
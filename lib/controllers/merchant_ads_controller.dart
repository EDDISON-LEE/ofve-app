import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MerchantAdsController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  bool isProcessing = false;
  List<dynamic> myOffers = [];
  List<dynamic> myCampaigns = [];
  
  String? errorMessage;
  String? successMessage;

  // Precios configurables (En producción, esto vendría de una tabla de configuración)
  final double precioPorDia = 1.0; // $1 por día

  MerchantAdsController() {
    loadData();
  }

  Future<void> loadData() async {
    isLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      final comercio = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      final comercioId = comercio['id'];

      // 1. Cargar ofertas activas del comercio
      final offersRes = await _supabase
          .from('ofertas')
          .select('*')
          .eq('comercio_id', comercioId)
          .eq('estado', 'Activa')
          .order('fecha_creacion', ascending: false);
      myOffers = offersRes;

      // 2. Cargar campañas activas del comercio
      final campaignsRes = await _supabase
          .from('campanas_publicidad')
          .select('*, ofertas(producto_nombre)')
          .eq('comercio_id', comercioId)
          .eq('estado', 'Activa')
          .order('fecha_fin', ascending: true);
      myCampaigns = campaignsRes;

    } catch (e) {
      debugPrint('Error cargando datos de anuncios: $e');
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> buyAd({required String offerId, required int days}) async {
    isProcessing = true;
    errorMessage = null;
    successMessage = null;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      final comercio = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      final comercioId = comercio['id'];

      // Calcular monto
      final total = precioPorDia * days;
      final fechaFin = DateTime.now().add(Duration(days: days));

      // Insertar la campaña
      await _supabase.from('campanas_publicidad').insert({
        'comercio_id': comercioId,
        'oferta_id': offerId,
        'dias_duracion': days,
        'monto_pagado': total,
        'estado': 'Activa',
        'fecha_fin': fechaFin.toIso8601String(),
      });

      successMessage = '¡Campaña creada con éxito! Tu oferta aparecerá destacada por $days días.';
      await loadData();
      return true;
    } catch (e) {
      debugPrint('Error al comprar anuncio: $e');
      errorMessage = e.toString();
      return false;
    } finally {
      isProcessing = false;
      notifyListeners();
    }
  }
}
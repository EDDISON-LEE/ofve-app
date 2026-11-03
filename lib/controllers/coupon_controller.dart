import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CouponController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> coupons = [];
  String? errorMessage;

  CouponController() {
    loadCoupons();
  }

  Future<void> loadCoupons() async {
    isLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      final comercio = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      final comercioId = comercio['id'];

      final response = await _supabase
          .from('cupones')
          .select('*')
          .eq('comercio_id', comercioId)
          .order('fecha_expiracion', ascending: true);

      coupons = response;
    } catch (e) {
      debugPrint('Error cargando cupones: $e');
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> createCoupon({
    required String code,
    required int discount,
    required int maxUses,
    required DateTime expirationDate,
  }) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      final comercio = await _supabase.from('comercios').select('id').eq('usuario_id', userId).single();
      final comercioId = comercio['id'];

      await _supabase.from('cupones').insert({
        'codigo': code.toUpperCase().trim(),
        'comercio_id': comercioId,
        'descuento_porcentaje': discount,
        'usos_maximos': maxUses,
        'fecha_expiracion': expirationDate.toIso8601String(),
      });

      await loadCoupons();
      return true;
    } catch (e) {
      debugPrint('Error creando cupón: $e');
      errorMessage = 'Error al crear el cupón. Asegúrate de que el código no exista.';
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteCoupon(String couponId) async {
    try {
      await _supabase.from('cupones').delete().eq('id', couponId);
      await loadCoupons();
    } catch (e) {
      debugPrint('Error eliminando cupón: $e');
    }
  }
}
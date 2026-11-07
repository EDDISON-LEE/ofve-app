import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientValidationController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> pendingValidations = [];

  ClientValidationController() {
    loadPendingValidations();
  }

  Future<void> loadPendingValidations() async {
    isLoading = true;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      
      // Buscamos compras completadas que NO hayan sido validadas por el cliente
      final response = await _supabase
          .from('compras')
          .select('*, comercios(nombre_comercial, logo_url)')
          .eq('usuario_id', userId)
          .eq('estado', 'Completado')
          .eq('validado_por_cliente', false)
          .order('fecha_compra', ascending: false);

      pendingValidations = response;
    } catch (e) {
      debugPrint('Error cargando validaciones: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // --- MÉTODO ACTUALIZADO CON LAS CALIFICACIONES ---
  Future<bool> submitValidation({
    required String compraId,
    required bool recibido,
    required bool buenEstado,
    DateTime? fechaCaducidad,
    required int calificacionEstado,   // <-- NUEVO PARÁMETRO
    required int calificacionAtencion, // <-- NUEVO PARÁMETRO
  }) async {
    isLoading = true;
    notifyListeners();

    try {
      await _supabase.rpc('validate_purchase', params: {
        'p_compra_id': compraId,
        'p_recibido': recibido,
        'p_buen_estado': buenEstado,
        'p_fecha_caducidad': fechaCaducidad?.toIso8601String().split('T')[0], // Solo la fecha YYYY-MM-DD
        'p_calificacion_estado': calificacionEstado,   // <-- ENVIAMOS A SUPABASE
        'p_calificacion_atencion': calificacionAtencion, // <-- ENVIAMOS A SUPABASE
      });

      await loadPendingValidations(); // Recargar la lista
      return true;
    } catch (e) {
      debugPrint('Error al validar compra: $e');
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
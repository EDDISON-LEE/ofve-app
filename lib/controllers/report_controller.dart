import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ReportController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = false;
  String? errorMessage;
  String? successMessage;

  Future<bool> submitReport({
    required String comercioId,
    required String motivo,
    required String descripcion,
  }) async {
    isLoading = true;
    errorMessage = null;
    successMessage = null;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;

      // 1. Obtener el usuario_id del dueño del comercio (para reportarlo a él)
      final comercio = await _supabase
          .from('comercios')
          .select('usuario_id')
          .eq('id', comercioId)
          .single();
      
      final reportadoId = comercio['usuario_id'];

      // 2. Insertar el reporte en la base de datos
      await _supabase.from('reportes_moderacion').insert({
        'reportante_id': userId,
        'reportado_id': reportadoId,
        'motivo': motivo,
        'descripcion': descripcion.trim(),
        'estado': 'Pendiente',
      });

      successMessage = 'Reporte enviado. Nuestro equipo de moderación lo revisará pronto.';
      return true;
    } catch (e) {
      debugPrint('Error al enviar reporte: $e');
      errorMessage = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
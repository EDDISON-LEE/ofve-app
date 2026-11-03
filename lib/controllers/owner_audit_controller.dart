import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OwnerAuditController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  List<dynamic> logs = [];
  String selectedFilter = 'Todos';

  final List<String> filters = ['Todos', 'Comercios', 'Ofertas', 'Pagos'];

  OwnerAuditController() {
    loadLogs();
  }

  Future<void> loadLogs() async {
    isLoading = true;
    notifyListeners();

    try {
      // 1. Iniciamos la consulta SIN el order ni limit todavía
      var query = _supabase
          .from('audit_logs')
          .select('*, usuarios(nombre, email)');

      // 2. Aplicamos el filtro si es necesario
      if (selectedFilter != 'Todos') {
        String tableName = '';
        if (selectedFilter == 'Comercios') tableName = 'comercios';
        if (selectedFilter == 'Ofertas') tableName = 'ofertas';
        if (selectedFilter == 'Pagos') tableName = 'solicitudes_suscripcion';
        
        query = query.eq('tabla_afectada', tableName);
      }

      // 3. AHORA SÍ, ordenamos y limitamos al final
      final response = await query
          .order('created_at', ascending: false)
          .limit(100);
          
      logs = response;
    } catch (e) {
      debugPrint('Error cargando auditoría: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void setFilter(String filter) {
    selectedFilter = filter;
    loadLogs();
  }
}
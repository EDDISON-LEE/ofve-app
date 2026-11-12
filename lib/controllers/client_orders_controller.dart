import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientOrdersController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;
  RealtimeChannel? _channel;

  bool isLoading = true;
  List<dynamic> orders = [];

  ClientOrdersController() {
    loadOrders();
    _setupRealtime();
  }

  Future<void> loadOrders() async {
    // Si no es la primera carga, no mostramos el spinner principal
    if (orders.isEmpty) {
      isLoading = true;
      notifyListeners();
    }

    try {
      final userId = _supabase.auth.currentUser!.id;
      final response = await _supabase
          .from('compras')
          .select('*, comercios(nombre_comercial)')
          .eq('usuario_id', userId)
          .order('fecha_compra', ascending: false);

      orders = response;
    } catch (e) {
      debugPrint('Error cargando historial de compras: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // ESCUCHA EN TIEMPO REAL: Cuando el comercio escanea, actualiza al instante
  void _setupRealtime() {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return;

    _channel = _supabase.channel('public:compras:cliente_$userId')
      ..onPostgresChanges(
        event: PostgresChangeEvent.update,
        schema: 'public',
        table: 'compras',
        filter: PostgresChangeFilter(
          type: PostgresChangeFilterType.eq,
          column: 'usuario_id',
          value: userId,
        ),
        callback: (payload) {
          debugPrint('🔄 Compra actualizada por el comercio en tiempo real');
          loadOrders(); // Recargamos la lista automáticamente
        },
      )
      ..subscribe();
  }

  @override
  void dispose() {
    _channel?.unsubscribe();
    super.dispose();
  }
}
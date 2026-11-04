import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MerchantBranchesController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  bool isLoading = true;
  bool isCreating = false;
  String? errorMessage;
  
  Map<String, dynamic>? parentStore;
  List<dynamic> branches = [];

  MerchantBranchesController() {
    loadBranches();
  }

  Future<void> loadBranches() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      
      // 1. Obtener el comercio matriz (el que tiene el usuario_id actual)
      final parentRes = await _supabase
          .from('comercios')
          .select('*')
          .eq('usuario_id', userId)
          .maybeSingle();
      
      if (parentRes == null) {
        throw Exception('No tienes un comercio registrado.');
      }
      
      parentStore = parentRes;

      // 2. Obtener todas las sucursales cuyo parent_id sea este comercio
      final branchesRes = await _supabase
          .from('comercios')
          .select('*')
          .eq('parent_id', parentStore!['id'])
          .order('fecha_registro', ascending: true);

      branches = branchesRes;
    } catch (e) {
      debugPrint('Error cargando sucursales: $e');
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> createBranch({
    required String nombre,
    required String direccion,
    required String telefono,
  }) async {
    isCreating = true;
    errorMessage = null;
    notifyListeners();

    try {
      final userId = _supabase.auth.currentUser!.id;
      
      // Generamos un RIF y Cédula temporal para la sucursal (ya que son únicos)
      final tempRif = 'RIF-SUC-${DateTime.now().millisecondsSinceEpoch}';
      final tempCedula = 'CED-SUC-${DateTime.now().millisecondsSinceEpoch}';

      await _supabase.from('comercios').insert({
        'usuario_id': userId, // El dueño sigue siendo el mismo usuario
        'nombre_comercial': nombre.trim(),
        'direccion_texto': direccion.trim(),
        'telefono_empresa': telefono.trim(),
        'categoria': parentStore!['categoria'], // Hereda la categoría
        'tipo_comercio': parentStore!['tipo_comercio'],
        'rif': tempRif,
        'cedula': tempCedula,
        'estatus_verificacion': 'Aprobado', // Se auto-aprueba por ser sucursal
        'parent_id': parentStore!['id'],
        'es_plan_libre': true, // Para que no pague un plan extra
        'plan_id': parentStore!['plan_id'],
      });

      await loadBranches();
      return true;
    } catch (e) {
      debugPrint('Error creando sucursal: $e');
      errorMessage = e.toString();
      return false;
    } finally {
      isCreating = false;
      notifyListeners();
    }
  }
}
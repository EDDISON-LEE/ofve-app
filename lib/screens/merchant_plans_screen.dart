import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../services/bcv_service.dart';
import 'payment_request_modal.dart'; // <-- NUEVA IMPORTACIÓN

class MerchantPlansScreen extends StatefulWidget {
  const MerchantPlansScreen({super.key});

  @override
  State<MerchantPlansScreen> createState() => _MerchantPlansScreenState();
}

class _MerchantPlansScreenState extends State<MerchantPlansScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  double _bcvRate = 0.0;
  
  List<dynamic> _planes = [];
  String? _currentPlanId;
  String _currentPlanName = '';

  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      // 1. Obtener la tasa del dólar (con manejo de error por si la API falla)
      try {
        _bcvRate = await BcvService.getDollarRate();
      } catch (e) {
        debugPrint('Error obteniendo tasa BCV: $e');
        _bcvRate = 0.0; // Fallback
      }

      final userId = _supabase.auth.currentUser!.id;

      // 2. Obtener el plan actual del comercio
      var comercioData = await _supabase
          .from('comercios')
          .select('plan_id')
          .eq('usuario_id', userId)
          .maybeSingle();
      
      _currentPlanId = comercioData?['plan_id'];

      // 3. Obtener todos los planes
      final planesRes = await _supabase
          .from('planes_suscripcion')
          .select('*, plan_caracteristicas(*)')
          .order('precio', ascending: true);

      // 4. AUTO-ASIGNACIÓN DEL PLAN BÁSICO
      if (_currentPlanId == null && planesRes.isNotEmpty) {
        final basico = planesRes.firstWhere(
          (p) => p['nombre'].toString().toLowerCase() == 'básico' || p['nombre'].toString().toLowerCase() == 'basico',
          orElse: () => planesRes.first,
        );
        
        if (basico != null) {
          await _supabase.from('comercios').update({'plan_id': basico['id']}).eq('usuario_id', userId);
          _currentPlanId = basico['id'];
        }
      }

      if (_currentPlanId != null) {
        final matches = planesRes.where((p) => p['id'] == _currentPlanId);
        _currentPlanName = matches.isNotEmpty ? (matches.first['nombre'] ?? 'Básico') : 'Básico';
      } else {
        _currentPlanName = 'Básico';
      }

      setState(() => _planes = planesRes);
    } catch (e) {
      debugPrint('Error cargando planes: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar los planes: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  // Generador de mensajes persuasivos según el plan
  String _getMarketingHook(String planName) {
    final name = planName.toLowerCase();
    if (name.contains('pro')) {
      return '🚀 Deja que la IA escriba tus ofertas. ¡Ahorra tiempo y vende más!';
    } else if (name.contains('élite') || name.contains('elite')) {
      return '🔥 Aparece primero en el mapa y usa Pools para vender al mayor. ¡Domina tu zona!';
    } else if (name.contains('corp')) {
      return '💎 Control total de tu franquicia con métricas geoespaciales.';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Planes y Suscripciones', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: primaryPurple))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // --- SECCIÓN: PLAN ACTUAL ---
                  const Text('Tu Plan Actual', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  if (_currentPlanId != null)
                    ..._planes.where((p) => p['id'] == _currentPlanId).map((plan) => _buildCurrentPlanCard(plan))
                  else
                    const Text('No tienes un plan asignado.', style: TextStyle(color: Colors.grey)),

                  const SizedBox(height: 30),

                  // --- SECCIÓN: OTROS PLANES DISPONIBLES ---
                  const Text('Mejora tu Plan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  ..._planes.where((p) => p['id'] != _currentPlanId).map((plan) => _buildOtherPlanCard(plan)),
                ],
              ),
            ),
    );
  }

  Widget _buildCurrentPlanCard(dynamic plan) {
    final features = plan['plan_caracteristicas'] as List<dynamic>;
    final precioUsd = (plan['precio'] as num).toDouble();
    final precioBs = precioUsd * _bcvRate;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryPurple, width: 2),
        boxShadow: [BoxShadow(color: primaryPurple.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(plan['nombre'], style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: primaryPurple)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                child: const Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green, size: 16),
                    SizedBox(width: 4),
                    Text('ACTIVO', style: TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold)),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Text(plan['descripcion'] ?? '', style: const TextStyle(color: Colors.black54)),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(precioUsd == 0 ? 'GRATIS' : '\$${precioUsd.toStringAsFixed(2)}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              if (precioUsd > 0) ...[
                const SizedBox(width: 8),
                Text('Bs. ${precioBs.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16, color: Colors.grey)),
              ]
            ],
          ),
          const SizedBox(height: 16),
          const Text('Incluye:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...features.map((f) => Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              children: [
                const Icon(Icons.check, color: Colors.green, size: 18),
                const SizedBox(width: 8),
                Expanded(child: Text(f['nombre_caracteristica'] ?? '')),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildOtherPlanCard(dynamic plan) {
    final features = plan['plan_caracteristicas'] as List<dynamic>;
    final precioUsd = (plan['precio'] as num).toDouble();
    final precioBs = precioUsd * _bcvRate;
    final hookText = _getMarketingHook(plan['nombre']);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner Persuasivo (Si existe)
          if (hookText.isNotEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: primaryPurple.withOpacity(0.1),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Text(
                hookText,
                style: TextStyle(color: primaryPurple, fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(plan['nombre'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(plan['descripcion'] ?? '', style: const TextStyle(color: Colors.black54)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text('\$${precioUsd.toStringAsFixed(2)}', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: primaryPurple)),
                    const SizedBox(width: 8),
                    Text('Bs. ${precioBs.toStringAsFixed(2)}', style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 12),
                ...features.map((f) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      const Icon(Icons.check, color: Colors.grey, size: 18),
                      const SizedBox(width: 8),
                      Expanded(child: Text(f['nombre_caracteristica'] ?? '')),
                    ],
                  ),
                )),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryPurple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      // ABRE EL MODAL DE PAGO
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (ctx) => PaymentRequestModal(
                          planName: plan['nombre'], 
                          amount: precioUsd
                        ),
                      );
                    },
                    child: Text('Solicitar ${plan['nombre']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
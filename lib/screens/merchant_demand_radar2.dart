import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MerchantDemandRadar extends StatefulWidget {
  final String categoriaComercio;
  final Color primaryPurple;
  final Color bgTop;

  const MerchantDemandRadar({
    super.key,
    required this.categoriaComercio,
    required this.primaryPurple,
    required this.bgTop,
  });

  @override
  State<MerchantDemandRadar> createState() => _MerchantDemandRadarState();
}

class _MerchantDemandRadarState extends State<MerchantDemandRadar> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _busquedas = [];

  @override
  void initState() {
    super.initState();
    _cargarRadar();
  }

  Future<void> _cargarRadar() async {
    try {
      // Agrupamos las búsquedas por término para ver cuáles son las más repetidas
      final response = await _supabase
          .from('busquedas_fallidas')
          .select('termino_busqueda')
          .eq('categoria_ia', widget.categoriaComercio); // Filtro por su ramo
          
      // En un entorno real, usarías una función RPC en Postgres para agrupar y contar.
      // Aquí lo hacemos en cliente para la demostración:
      final Map<String, int> conteo = {};
      for (var item in response) {
        final term = item['termino_busqueda'].toString().toLowerCase();
        conteo[term] = (conteo[term] ?? 0) + 1;
      }

      final sortedList = conteo.entries.toList()..sort((a, b) => b.value.compareTo(a.value));

      setState(() {
        _busquedas = sortedList.take(10).map((e) => {'termino': e.key, 'cantidad': e.value}).toList();
      });
    } catch (e) {
      debugPrint('Error cargando radar: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.bgTop,
      appBar: AppBar(
        title: const Text('Radar de Demanda', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: widget.primaryPurple))
          : Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.radar, color: widget.primaryPurple, size: 40),
                      const SizedBox(height: 12),
                      Text(
                        'Esto es lo que buscan tus clientes en ${widget.categoriaComercio}:',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Si agregas estos productos a tu inventario, ¡podrías captar ventas inmediatas!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: _busquedas.isEmpty
                      ? const Center(child: Text('Aún no hay búsquedas insatisfechas en tu ramo.'))
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: _busquedas.length,
                          itemBuilder: (context, index) {
                            final item = _busquedas[index];
                            return Card(
                              margin: const EdgeInsets.only(bottom: 10),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: widget.primaryPurple.withOpacity(0.1),
                                  child: Text('${index + 1}', style: TextStyle(color: widget.primaryPurple, fontWeight: FontWeight.bold)),
                                ),
                                title: Text(item['termino'].toString().toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold)),
                                trailing: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(color: Colors.red.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                                  child: Text('${item['cantidad']} búsquedas', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12)),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
    );
  }
}
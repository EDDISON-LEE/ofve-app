import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminMarketIntelligence extends StatefulWidget {
  const AdminMarketIntelligence({super.key});

  @override
  State<AdminMarketIntelligence> createState() => _AdminMarketIntelligenceState();
}

class _AdminMarketIntelligenceState extends State<AdminMarketIntelligence> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _globalSearches = [];

  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

  @override
  void initState() {
    super.initState();
    _loadGlobalData();
  }

  Future<void> _loadGlobalData() async {
    try {
      final response = await _supabase.from('busquedas_fallidas').select('termino_busqueda, categoria_ia');
      
      final Map<String, int> conteo = {};
      for (var item in response) {
        final term = item['termino_busqueda'].toString().toLowerCase();
        conteo[term] = (conteo[term] ?? 0) + 1;
      }

      final sortedList = conteo.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
      setState(() {
        _globalSearches = sortedList.take(20).map((e) => {'termino': e.key, 'cantidad': e.value}).toList();
      });
    } catch (e) {
      debugPrint('Error cargando inteligencia: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Inteligencia de Mercado', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: primaryPurple))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Top Búsquedas Insatisfechas Globales', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text('Estos son los productos que los clientes buscan pero no encuentran en la app.', style: TextStyle(color: Colors.black54)),
                  const SizedBox(height: 20),
                  
                  if (_globalSearches.isEmpty)
                    const Center(child: Text('No hay datos suficientes aún.'))
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _globalSearches.length,
                      itemBuilder: (context, index) {
                        final item = _globalSearches[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 8, offset: const Offset(0, 4))],
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: primaryPurple.withValues(alpha: 0.1),
                              child: Text('#${index + 1}', style: TextStyle(color: primaryPurple, fontWeight: FontWeight.bold)),
                            ),
                            title: Text(item['termino'].toString().toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold)),
                            trailing: Text('${item['cantidad']} búsquedas', style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                          ),
                        );
                      },
                    )
                ],
              ),
            ),
    );
  }
}
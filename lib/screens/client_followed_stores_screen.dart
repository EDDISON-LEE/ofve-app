import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';
import 'client_store_profile_screen.dart';

class ClientFollowedStoresScreen extends StatefulWidget {
  const ClientFollowedStoresScreen({super.key});

  @override
  State<ClientFollowedStoresScreen> createState() => _ClientFollowedStoresScreenState();
}

class _ClientFollowedStoresScreenState extends State<ClientFollowedStoresScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<dynamic> _stores = [];

  @override
  void initState() {
    super.initState();
    _loadStores();
  }

  Future<void> _loadStores() async {
    setState(() => _isLoading = true);
    try {
      final userId = _supabase.auth.currentUser!.id;
      final response = await _supabase
          .from('seguidores_comercios')
          .select('comercio_id, comercios(*)')
          .eq('usuario_id', userId);
      
      // Extraemos la info de la tienda
      _stores = response.map((f) => f['comercios']).toList();
    } catch (e) {
      debugPrint('Error cargando tiendas seguidas: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgTop,
      appBar: AppBar(title: const Text('Tiendas que sigo')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
          : _stores.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.storefront, size: 80, color: Colors.grey),
                      SizedBox(height: 16),
                      Text('Aún no sigues ninguna tienda.', style: TextStyle(fontSize: 18, color: AppColors.textLight)),
                      Text('¡Explora las ofertas y sigue a tus favoritas!', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _stores.length,
                  itemBuilder: (context, index) {
                    final store = _stores[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(12),
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: AppColors.bgTop,
                          backgroundImage: (store['logo_url'] != null && store['logo_url'].toString().isNotEmpty) ? NetworkImage(store['logo_url']) : null,
                          child: (store['logo_url'] == null || store['logo_url'].toString().isEmpty) ? const Icon(Icons.store, color: AppColors.primaryPurple) : null,
                        ),
                        title: Text(store['nombre_comercial'], style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(store['categoria'] ?? ''),
                        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                        onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (_) => ClientStoreProfileScreen(comercioId: store['id']))
                          ).then((_) => _loadStores()); // Recargar al volver por si dejó de seguir
                        },
                      ),
                    );
                  },
                ),
    );
  }
}
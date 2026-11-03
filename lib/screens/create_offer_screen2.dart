import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'merchant_profile_screen.dart';
import 'offer_form_screen.dart'; // <-- NUEVA IMPORTACIÓN

class CreateOfferScreen extends StatefulWidget {
  const CreateOfferScreen({super.key});

  @override
  State<CreateOfferScreen> createState() => _CreateOfferScreenState();
}

class _CreateOfferScreenState extends State<CreateOfferScreen> {
  final _supabase = Supabase.instance.client;
  bool _isLoading = true;
  String _status = 'Pendiente';

  final Color primaryPurple = const Color(0xFF7C5DFE);
  final Color bgTop = const Color(0xFFECE2FC);

  @override
  void initState() {
    super.initState();
    _verificarEstadoComercio();
  }

  Future<void> _verificarEstadoComercio() async {
    final user = _supabase.auth.currentUser;
    if (user == null) return;

    try {
      final comercio = await _supabase
          .from('comercios')
          .select('estatus_verificacion')
          .eq('usuario_id', user.id)
          .maybeSingle();

      if (comercio != null) {
        setState(() => _status = comercio['estatus_verificacion'] ?? 'Pendiente');
      }
    } catch (e) {
      debugPrint('Error al verificar estado: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Crear Oferta', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: primaryPurple))
          : _status == 'Aprobado'
              ? _buildFormularioUI()
              : _status == 'En Revision'
                  ? _buildEnRevisionUI()
                  : _buildCompletarPerfilUI(),
    );
  }

  Widget _buildCompletarPerfilUI() {
    bool isRechazado = _status == 'Rechazado';
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(isRechazado ? Icons.error_outline : Icons.storefront, size: 100, color: isRechazado ? Colors.red : Colors.orange),
            const SizedBox(height: 24),
            Text(
              isRechazado ? 'Documentación Rechazada' : '¡Estás a un paso de vender!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              isRechazado 
                ? 'Tus documentos anteriores no fueron válidos. Por favor, vuelve a subirlos para poder publicar ofertas.'
                : 'Para publicar ofertas y llegar a miles de clientes, primero necesitamos verificar tu negocio. Completa tu perfil ahora.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, color: Colors.black54),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryPurple,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              icon: const Icon(Icons.upload_file, color: Colors.white),
              label: Text(isRechazado ? 'Volver a subir documentos' : 'Completar mi Perfil', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MerchantProfileScreen(
                      onDocsUploaded: () {
                        setState(() => _isLoading = true);
                        _verificarEstadoComercio();
                      },
                    ),
                  ),
                );
                _verificarEstadoComercio();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEnRevisionUI() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.hourglass_top, size: 100, color: Colors.blue),
            const SizedBox(height: 24),
            const Text('Documentos en Revisión', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text(
              'Nuestro equipo está verificando tu negocio. Este proceso tarda menos de 48 horas. Te notificaremos pronto.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: () {
                setState(() => _isLoading = true);
                _verificarEstadoComercio();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Actualizar Estado'),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFormularioUI() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 100, color: Colors.green),
            const SizedBox(height: 24),
            const Text('¡Todo listo para vender!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text('Tu cuenta está verificada. Procede a llenar los datos de tu oferta.', textAlign: TextAlign.center),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: primaryPurple),
                onPressed: () async {
                  // NAVEGAMOS AL FORMULARIO REAL
                  await Navigator.push(context, MaterialPageRoute(builder: (_) => const OfferFormScreen()));
                  // Al volver del formulario, recargamos para limpiar el estado si es necesario
                  _verificarEstadoComercio();
                },
                child: const Text('Llenar Formulario de Oferta', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
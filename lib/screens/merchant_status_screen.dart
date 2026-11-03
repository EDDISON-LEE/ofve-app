import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'merchant_profile_screen.dart';

class MerchantStatusScreen extends StatefulWidget {
  final String status;
  const MerchantStatusScreen({super.key, required this.status});

  @override
  State<MerchantStatusScreen> createState() => _MerchantStatusScreenState();
}

class _MerchantStatusScreenState extends State<MerchantStatusScreen> {
  final Color primaryPurple = const Color(0xFF6B4EFF);
  final Color bgTop = const Color(0xFFECE2FC);

  @override
  Widget build(BuildContext context) {
    final isRejected = widget.status == 'Rechazado';

    return Scaffold(
      backgroundColor: bgTop,
      appBar: AppBar(
        title: const Text('Estado de Verificación'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Supabase.instance.client.auth.signOut(),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isRejected ? Icons.cancel : Icons.hourglass_top,
                size: 100,
                color: isRejected ? Colors.red : Colors.orange,
              ),
              const SizedBox(height: 24),
              Text(
                isRejected ? 'Documentación Rechazada' : 'Documentación en Revisión',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                isRejected 
                  ? 'Lamentablemente tus documentos no pudieron ser validados. Por favor, vuelve a subirlos asegurándote de que sean legibles y correctos.'
                  : 'Nuestro equipo está revisando tus documentos. Este proceso puede tardar hasta 24 horas hábiles. Te notificaremos cuando tu cuenta esté activa.',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 32),
              if (isRejected)
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryPurple,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  icon: const Icon(Icons.upload_file, color: Colors.white),
                  label: const Text('Volver a subir documentos', style: TextStyle(color: Colors.white)),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MerchantProfileScreen(
                          onDocsUploaded: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    );
                  },
                ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SizedBox())); 
                },
                child: const Text('Actualizar estado'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
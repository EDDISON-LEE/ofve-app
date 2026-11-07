import 'package:flutter/material.dart';
import 'create_offer_screen.dart';

class MerchantOffersTab extends StatelessWidget {
  const MerchantOffersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel de Comercio'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Tarjeta de resumen
            Card(
              color: const Color(0xFF6B4EFF).withValues(alpha: 0.1),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Tus Ventas Hoy',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '\$ 0.00',
                      style: TextStyle(
                        fontSize: 32, 
                        fontWeight: FontWeight.bold, 
                        color: Color(0xFF6B4EFF)
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Botón principal para crear oferta
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6B4EFF),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              icon: const Icon(Icons.add_circle_outline, color: Colors.white),
              label: const Text(
                'Crear Nueva Oferta',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onPressed: () {
                // Navegamos a la pantalla que valida los documentos
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CreateOfferScreen()),
                );
              },
            ),
            
            const SizedBox(height: 24),
            const Text(
              'Tus Ofertas Activas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Expanded(
              child: Center(
                child: Text('No tienes ofertas activas aún.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
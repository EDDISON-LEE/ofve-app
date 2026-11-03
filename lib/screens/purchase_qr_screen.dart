import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart'; // <-- Necesitamos esta dependencia
import '../core/theme/app_theme.dart';

class PurchaseQrScreen extends StatelessWidget {
  final String qrToken;
  final double total;
  final String nombreComercio;

  const PurchaseQrScreen({
    super.key,
    required this.qrToken,
    required this.total,
    required this.nombreComercio,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgTop,
      appBar: AppBar(title: const Text('Tu Código de Compra')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, color: AppColors.success, size: 80),
              const SizedBox(height: 16),
              const Text(
                '¡Compra Registrada!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textDark),
              ),
              const SizedBox(height: 8),
              Text(
                'Muestra este código en $nombreComercio para retirar tu producto.',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: AppColors.textLight),
              ),
              const SizedBox(height: 32),
              
              // CONTENEDOR DEL QR
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 10))],
                ),
                child: Column(
                  children: [
                    QrImageView(
                      data: qrToken,
                      version: QrVersions.auto,
                      size: 200.0,
                      backgroundColor: Colors.white,
                      eyeStyle: const QrEyeStyle(
                        eyeShape: QrEyeShape.square,
                        color: AppColors.darkCardColor,
                      ),
                      dataModuleStyle: const QrDataModuleStyle(
                        dataModuleShape: QrDataModuleShape.square,
                        color: AppColors.darkCardColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Total: \$${total.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryPurple),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              const Text(
                'Este código es único y personal. No lo compartas con nadie más.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst); // Volver al dashboard
                },
                child: const Text('Volver al Inicio'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
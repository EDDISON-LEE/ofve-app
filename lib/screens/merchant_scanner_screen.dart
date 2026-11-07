import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../core/theme/app_theme.dart';
import '../controllers/merchant_scan_controller.dart';

class MerchantScannerScreen extends StatefulWidget {
  const MerchantScannerScreen({super.key});

  @override
  State<MerchantScannerScreen> createState() => _MerchantScannerScreenState();
}

class _MerchantScannerScreenState extends State<MerchantScannerScreen> {
  final _scanController = MerchantScanController();
  final MobileScannerController _cameraController = MobileScannerController();
  
  bool _isProcessing = false;

  void _onDetect(BarcodeCapture capture) async {
    if (_isProcessing) return; // Evitar escaneos múltiples

    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isEmpty) return;

    final String? code = barcodes.first.rawValue;
    if (code == null) return;

    setState(() => _isProcessing = true);
    _cameraController.stop(); // Detener la cámara mientras procesa

    await _scanController.processScan(code);

    if (!mounted) return;

    if (_scanController.isSuccess) {
      _showSuccessDialog();
    } else {
      _showErrorDialog();
    }
  }

  void _showSuccessDialog() {
    // Detectamos si fue guardado offline o procesado online
    final isOffline = _scanController.isQueuedOffline;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isOffline ? Icons.cloud_off : Icons.check_circle, 
              color: isOffline ? AppColors.warning : AppColors.success, 
              size: 80
            ),
            const SizedBox(height: 16),
            Text(
              isOffline ? '¡Guardado Offline!' : '¡Venta Completada!', 
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
            ),
            const SizedBox(height: 8),
            Text(
              isOffline
                  ? 'No hay conexión a internet. El código QR se ha guardado en la memoria del teléfono y se validará automáticamente cuando recuperes la señal.'
                  : 'Cliente: ${_scanController.purchaseData?['usuarios']?['nombre'] ?? 'Anónimo'}\n'
                    'Total: \$${(_scanController.purchaseData?['total_pagado'] as num).toStringAsFixed(2)}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Text(
              isOffline
                  ? 'Puedes seguir escaneando más códigos. No cierres la app.'
                  : 'Se ha notificado al cliente para que valide su compra en la app.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, color: AppColors.textLight),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx); // Cerrar diálogo
              Navigator.pop(context); // Volver al dashboard
            },
            child: const Text('Cerrar', style: TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Error de Escaneo'),
        content: Text(_scanController.errorMessage ?? 'QR no válido.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              setState(() => _isProcessing = false);
              _cameraController.start(); // Reanudar cámara para intentar de nuevo
            },
            child: const Text('Intentar de nuevo'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _scanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgTop,
      appBar: AppBar(
        title: const Text('Escanear QR de Compra'),
      ),
      body: Stack(
        children: [
          // Cámara
          MobileScanner(
            controller: _cameraController,
            onDetect: _onDetect,
          ),
          
          // Marco de escaneo (Overlay)
          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryPurple, width: 4),
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),

          // Texto instructivo
          const Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Text(
              'Apunta la cámara al código QR del cliente',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold, shadows: [Shadow(color: Colors.black, blurRadius: 4)]),
            ),
          ),

          // Indicador de carga
          if (_isProcessing)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(color: AppColors.primaryPurple),
              ),
            ),
        ],
      ),
    );
  }
}
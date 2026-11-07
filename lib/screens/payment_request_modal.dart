import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/theme/app_theme.dart';
import '../controllers/subscription_request_controller.dart';

class PaymentRequestModal extends StatefulWidget {
  final String planName;
  final double amount;
  const PaymentRequestModal({super.key, required this.planName, required this.amount});

  @override
  State<PaymentRequestModal> createState() => _PaymentRequestModalState();
}

class _PaymentRequestModalState extends State<PaymentRequestModal> {
  final _requestController = SubscriptionRequestController();
  String _selectedMethod = 'Stripe';
  final _referenceCtrl = TextEditingController();
  Uint8List? _imageBytes;
  String? _imageName;
  bool _isStripeLoading = false;

  @override
  void dispose() {
    _referenceCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (picked != null) {
      final bytes = await picked.readAsBytes();
      if (!mounted) return;
      setState(() {
        _imageBytes = bytes;
        _imageName = picked.name;
      });
    }
  }

  void _mostrarResultado(String titulo, String mensaje, Color color) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Column(
          children: [
            Icon(
              color == AppColors.success
                  ? Icons.check_circle
                  : (color == AppColors.error ? Icons.cancel : Icons.hourglass_top),
              color: color,
              size: 60,
            ),
            const SizedBox(height: 12),
            Text(titulo,
                textAlign: TextAlign.center,
                style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 20)),
          ],
        ),
        content: Text(mensaje, textAlign: TextAlign.center, style: const TextStyle(fontSize: 15)),
        actions: [
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              onPressed: () {
                Navigator.pop(ctx);
                Navigator.pop(context);
              },
              child: const Text('Entendido',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _pagarConStripe() async {
    setState(() => _isStripeLoading = true);
    try {
      final user = Supabase.instance.client.auth.currentUser!;
      final response = await Supabase.instance.client.functions.invoke(
        'create-stripe-session',
        body: {
          'planName': widget.planName,
          'amount': widget.amount,
          'userId': user.id,
          'userEmail': user.email,
        },
      );

      if (response.status == 200 && response.data['url'] != null) {
        final url = Uri.parse(response.data['url']);
        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
          if (!mounted) return;
          Navigator.pop(context);
        }
      } else {
        throw Exception('Error al crear la sesión de pago.');
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e'), backgroundColor: AppColors.error),
      );
    } finally {
      if (mounted) setState(() => _isStripeLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _requestController,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom, top: 24, left: 20, right: 20),
          decoration: const BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Pagar Plan ${widget.planName}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Monto: \$${widget.amount}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18,
                        color: AppColors.primaryPurple,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  // FIX: value → initialValue (deprecado en Flutter 3.33+)
                  initialValue: _selectedMethod,
                  decoration: const InputDecoration(
                      labelText: 'Método de Pago', prefixIcon: Icon(Icons.payment)),
                  items: ['Stripe', 'Pago Movil', 'Transferencia', 'Efectivo']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (v) => setState(() => _selectedMethod = v!),
                ),
                const SizedBox(height: 12),
                if (_selectedMethod == 'Stripe') ...[
                  const Text(
                    'Serás redirigido a la pasarela segura de Stripe para completar tu pago con tarjeta de crédito o débito.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6772E5)),
                      onPressed: _isStripeLoading ? null : _pagarConStripe,
                      icon: _isStripeLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                  color: Colors.white, strokeWidth: 2))
                          : const Icon(Icons.credit_card, color: Colors.white),
                      label: Text(
                        _isStripeLoading ? 'Conectando...' : 'Pagar con Tarjeta',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ] else ...[
                  TextField(
                      controller: _referenceCtrl,
                      decoration: const InputDecoration(
                          labelText: 'Número de Referencia / Ticket',
                          prefixIcon: Icon(Icons.numbers))),
                  const SizedBox(height: 12),
                  if (_selectedMethod == 'Efectivo' ||
                      _selectedMethod == 'Transferencia' ||
                      _selectedMethod == 'Pago Movil')
                    InkWell(
                      onTap: _pickImage,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: AppColors.bgTop,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade300)),
                        child: Row(
                          children: [
                            Icon(
                                _imageBytes != null
                                    ? Icons.check_circle
                                    : Icons.upload_file,
                                color: _imageBytes != null ? AppColors.success : Colors.grey),
                            const SizedBox(width: 12),
                            Expanded(
                                child: Text(
                                    _imageBytes != null
                                        ? 'Comprobante subido'
                                        : 'Subir foto del comprobante',
                                    style: TextStyle(
                                        color: _imageBytes != null
                                            ? AppColors.success
                                            : Colors.grey))),
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _requestController.isLoading
                          ? null
                          : () async {
                              final messenger = ScaffoldMessenger.of(context);
                              final success = await _requestController.submitRequest(
                                planName: widget.planName,
                                method: _selectedMethod,
                                amount: widget.amount,
                                reference: _referenceCtrl.text.trim(),
                                imageBytes: _imageBytes,
                                imageName: _imageName,
                              );
                              if (!mounted) return;
                              if (success) {
                                final status = _requestController.verificationStatus;
                                final msg = _requestController.successMessage ?? '';
                                if (status == 'Automatico') {
                                  _mostrarResultado('¡Pago Aprobado Automáticamente!', msg,
                                      AppColors.success);
                                } else if (status == 'Manual') {
                                  _mostrarResultado(
                                      'Pago en Revisión', msg, AppColors.warning);
                                } else {
                                  _mostrarResultado('Pago Rechazado', msg, AppColors.error);
                                }
                              } else {
                                messenger.showSnackBar(SnackBar(
                                  content: Text(_requestController.errorMessage ?? 'Error'),
                                  backgroundColor: AppColors.error,
                                ));
                              }
                            },
                      child: _requestController.isLoading
                          ? const CircularProgressIndicator(color: AppColors.white)
                          : const Text('Enviar Solicitud'),
                    ),
                  ),
                ],
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
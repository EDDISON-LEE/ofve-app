import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/purchase_controller.dart';
import 'purchase_qr_screen.dart';

class ClientCheckoutScreen extends StatefulWidget {
  final Map<String, dynamic> oferta;

  const ClientCheckoutScreen({super.key, required this.oferta});

  @override
  State<ClientCheckoutScreen> createState() => _ClientCheckoutScreenState();
}

class _ClientCheckoutScreenState extends State<ClientCheckoutScreen> {
  final _purchaseController = PurchaseController();
  final _couponController = TextEditingController();

  double _precioOriginal = 0.0;
  double _precioFinal = 0.0;
  bool _cuponAplicado = false;
  int _porcentajeDescuento = 0;
  bool _isValidatingCoupon = false;

  // Variables de Delivery
  bool _requiereDelivery = false;
  final double _costoDelivery = 1.50; // Costo fijo de ejemplo

  @override
  void initState() {
    super.initState();
    _precioOriginal = widget.oferta['precio_oferta'] != null 
        ? (widget.oferta['precio_oferta'] as num).toDouble()
        : (widget.oferta['precio_regular'] as num).toDouble();
    _precioFinal = _precioOriginal;
  }

  @override
  void dispose() {
    _couponController.dispose();
    super.dispose();
  }

  void _recalcularTotal() {
    setState(() {
      _precioFinal = _precioOriginal;
      if (_cuponAplicado) {
        _precioFinal -= (_precioOriginal * (_porcentajeDescuento / 100));
      }
      if (_requiereDelivery) {
        _precioFinal += _costoDelivery;
      }
    });
  }

  Future<void> _aplicarCupon() async {
    final codigo = _couponController.text.trim();
    if (codigo.isEmpty) return;

    setState(() => _isValidatingCoupon = true);

    final descuento = await _purchaseController.validarCupon(codigo, widget.oferta['comercio_id']);

    if (mounted) {
      setState(() => _isValidatingCoupon = false);

      if (descuento != null) {
        setState(() {
          _porcentajeDescuento = descuento;
          _cuponAplicado = true;
        });
        _recalcularTotal();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('¡Cupón aplicado! $descuento% de descuento.'), backgroundColor: AppColors.success),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_purchaseController.errorMessage ?? 'Cupón inválido'), backgroundColor: AppColors.error),
        );
      }
    }
  }

  Future<void> _confirmarCompra() async {
    final success = await _purchaseController.createPurchase(
      comercioId: widget.oferta['comercio_id'],
      ofertaId: widget.oferta['id'],
      montoFinal: _precioFinal,
      requiereDelivery: _requiereDelivery,
      costoDelivery: _requiereDelivery ? _costoDelivery : 0.0,
    );

    if (success && mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => PurchaseQrScreen(
            qrToken: _purchaseController.purchaseData!['qr_token'],
            total: _precioFinal,
            nombreComercio: 'el Comercio',
          ),
        ),
      );
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_purchaseController.errorMessage ?? 'Error al generar compra'), backgroundColor: AppColors.error),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _purchaseController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Finalizar Compra')),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // TARJETA DEL PRODUCTO
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))]),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: (widget.oferta['imagen_url'] != null && widget.oferta['imagen_url'].toString().isNotEmpty)
                            ? Image.network(widget.oferta['imagen_url'], width: 80, height: 80, fit: BoxFit.cover)
                            : Container(width: 80, height: 80, color: Colors.grey[200], child: const Icon(Icons.image, color: Colors.grey)),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.oferta['producto_nombre'] ?? 'Producto', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            const SizedBox(height: 8),
                            Text('\$${_precioOriginal.toStringAsFixed(2)}', style: const TextStyle(color: AppColors.textLight, fontSize: 14)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // DELIVERY SWITCH
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
                  child: SwitchListTile(
                    title: const Text('¿Deseas Delivery?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    subtitle: Text('Costo adicional: \$${_costoDelivery.toStringAsFixed(2)}', style: const TextStyle(fontSize: 12)),
                    value: _requiereDelivery,
                    activeColor: AppColors.primaryPurple,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (val) {
                      setState(() => _requiereDelivery = val);
                      _recalcularTotal();
                    },
                  ),
                ),

                const SizedBox(height: 30),
                const Text('¿Tienes un cupón de descuento?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                
                // INPUT DE CUPÓN
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _couponController,
                        textCapitalization: TextCapitalization.characters,
                        enabled: !_cuponAplicado,
                        decoration: InputDecoration(
                          labelText: 'Código del Cupón',
                          prefixIcon: const Icon(Icons.local_activity),
                          filled: true,
                          fillColor: _cuponAplicado ? Colors.green.withOpacity(0.1) : AppColors.white,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _cuponAplicado ? AppColors.success : AppColors.primaryPurple,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: (_cuponAplicado || _isValidatingCoupon) ? null : _aplicarCupon,
                        child: _isValidatingCoupon 
                          ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2))
                          : Icon(_cuponAplicado ? Icons.check : Icons.local_offer, color: AppColors.white),
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 40),
                const Divider(),
                const SizedBox(height: 20),

                // RESUMEN DE PAGO
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Subtotal:', style: TextStyle(fontSize: 16)),
                    Text('\$${_precioOriginal.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
                  ],
                ),
                if (_cuponAplicado) ...[
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Descuento ($_porcentajeDescuento%):', style: const TextStyle(fontSize: 16, color: AppColors.success)),
                      Text('-\$${(_precioOriginal * (_porcentajeDescuento / 100)).toStringAsFixed(2)}', style: const TextStyle(fontSize: 16, color: AppColors.success)),
                    ],
                  ),
                ],
                if (_requiereDelivery) ...[
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Delivery:', style: TextStyle(fontSize: 16, color: AppColors.primaryPurple)),
                      Text('\$${_costoDelivery.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16, color: AppColors.primaryPurple)),
                    ],
                  ),
                ],
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total a Pagar:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('\$${_precioFinal.toStringAsFixed(2)}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primaryPurple)),
                  ],
                ),

                const SizedBox(height: 40),

                // BOTÓN FINAL
                SizedBox(
                  height: 55,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryPurple,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: _purchaseController.isLoading ? null : _confirmarCompra,
                    icon: _purchaseController.isLoading 
                        ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2))
                        : const Icon(Icons.qr_code, color: AppColors.white),
                    label: Text(
                      _purchaseController.isLoading ? 'Generando QR...' : 'Confirmar y Generar QR',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
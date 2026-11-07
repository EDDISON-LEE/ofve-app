import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import '../controllers/coupon_controller.dart';

class MerchantCouponsScreen extends StatefulWidget {
  const MerchantCouponsScreen({super.key});

  @override
  State<MerchantCouponsScreen> createState() => _MerchantCouponsScreenState();
}

class _MerchantCouponsScreenState extends State<MerchantCouponsScreen> {
  final _couponController = CouponController();

  void _mostrarFormularioCreacion() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _CreateCouponSheet(controller: _couponController),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _couponController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Mis Cupones')),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: _mostrarFormularioCreacion,
            backgroundColor: AppColors.primaryPurple,
            icon: const Icon(Icons.add, color: AppColors.white),
            label: const Text('Crear Cupón', style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold)),
          ),
          body: _couponController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : _couponController.coupons.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_activity, size: 80, color: Colors.grey),
                          SizedBox(height: 16),
                          Text('No tienes cupones activos.', style: TextStyle(fontSize: 18, color: AppColors.textLight)),
                          Text('¡Crea uno para atraer más clientes!', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _couponController.coupons.length,
                      itemBuilder: (context, index) {
                        final coupon = _couponController.coupons[index];
                        final expiration = DateTime.parse(coupon['fecha_expiracion']).toLocal();
                        final isExpired = expiration.isBefore(DateTime.now());
                        final isMaxedOut = (coupon['usos_actuales'] ?? 0) >= (coupon['usos_maximos'] ?? 0);
                        final isActive = !isExpired && !isMaxedOut;

                        return Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: isActive ? AppColors.success.withValues(alpha: 0.1) : AppColors.error.withValues(alpha: 0.1),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: isActive ? AppColors.success : AppColors.error),
                                      ),
                                      child: Text(
                                        coupon['codigo'],
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2,
                                          color: isActive ? AppColors.success : AppColors.error,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete, color: AppColors.error),
                                      onPressed: () => _couponController.deleteCoupon(coupon['id']),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  '${coupon['descuento_porcentaje']}% de Descuento',
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primaryPurple),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Vence: ${DateFormat('dd/MM/yyyy').format(expiration)}',
                                      style: TextStyle(color: isExpired ? AppColors.error : AppColors.textLight, fontWeight: isExpired ? FontWeight.bold : FontWeight.normal),
                                    ),
                                    Text('Usos: ${coupon['usos_actuales']} / ${coupon['usos_maximos']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                LinearProgressIndicator(
                                  value: (coupon['usos_actuales'] ?? 0) / (coupon['usos_maximos'] ?? 1),
                                  backgroundColor: Colors.grey[200],
                                  color: isActive ? AppColors.primaryPurple : Colors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                  minHeight: 8,
                                ),
                                if (isExpired)
                                  const Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Text('⚠️ Este cupón ha expirado', style: TextStyle(color: AppColors.error, fontSize: 12, fontWeight: FontWeight.bold)),
                                  )
                                else if (isMaxedOut)
                                  const Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Text('⚠️ Límite de usos alcanzado', style: TextStyle(color: AppColors.warning, fontSize: 12, fontWeight: FontWeight.bold)),
                                  )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
        );
      },
    );
  }
}

class _CreateCouponSheet extends StatefulWidget {
  final CouponController controller;

  const _CreateCouponSheet({required this.controller});

  @override
  State<_CreateCouponSheet> createState() => _CreateCouponSheetState();
}

class _CreateCouponSheetState extends State<_CreateCouponSheet> {
  final _codeCtrl = TextEditingController();
  final _discountCtrl = TextEditingController();
  final _maxUsesCtrl = TextEditingController();
  DateTime _expirationDate = DateTime.now().add(const Duration(days: 30));
  bool _isSaving = false;

  Future<void> _seleccionarFecha() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _expirationDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) setState(() => _expirationDate = date);
  }

  Future<void> _submit() async {
    if (_codeCtrl.text.isEmpty || _discountCtrl.text.isEmpty || _maxUsesCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Llena todos los campos.'), backgroundColor: AppColors.error));
      return;
    }

    setState(() => _isSaving = true);
    final success = await widget.controller.createCoupon(
      code: _codeCtrl.text,
      discount: int.parse(_discountCtrl.text),
      maxUses: int.parse(_maxUsesCtrl.text),
      expirationDate: _expirationDate,
    );

    if (mounted) {
      Navigator.pop(context);
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('¡Cupón creado con éxito!'), backgroundColor: AppColors.success));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(widget.controller.errorMessage ?? 'Error al crear'), backgroundColor: AppColors.error));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, top: 20, left: 20, right: 20),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Nuevo Cupón', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextField(
              controller: _codeCtrl,
              textCapitalization: TextCapitalization.characters,
              decoration: const InputDecoration(labelText: 'Código (Ej: VERANO20)', prefixIcon: Icon(Icons.local_activity)),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: TextField(controller: _discountCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: '% Descuento', prefixIcon: Icon(Icons.percent)))),
                const SizedBox(width: 12),
                Expanded(child: TextField(controller: _maxUsesCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Usos Máximos', prefixIcon: Icon(Icons.numbers)))),
              ],
            ),
            const SizedBox(height: 12),
            ListTile(
              leading: const Icon(Icons.calendar_today, color: AppColors.primaryPurple),
              title: const Text('Fecha de Expiración'),
              subtitle: Text(DateFormat('dd/MM/yyyy').format(_expirationDate)),
              trailing: const Icon(Icons.edit, size: 20, color: Colors.grey),
              onTap: _seleccionarFecha,
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: _isSaving ? null : _submit,
                child: _isSaving 
                    ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2))
                    : const Text('Guardar Cupón'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
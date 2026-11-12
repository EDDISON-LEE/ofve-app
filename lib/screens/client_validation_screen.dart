import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_theme.dart';
import '../controllers/client_validation_controller.dart';

class ClientValidationScreen extends StatefulWidget {
  const ClientValidationScreen({super.key});

  @override
  State<ClientValidationScreen> createState() => _ClientValidationScreenState();
}

class _ClientValidationScreenState extends State<ClientValidationScreen> {
  final _validationController = ClientValidationController();

  void _abrirFormularioValidacion(Map<String, dynamic> compra) async {
    final result = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _ValidationFormSheet(
        compra: compra,
        controller: _validationController,
      ),
    );

    if (result == true) {
      _validationController.loadPendingValidations();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _validationController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Validar mis Compras')),
          body: _validationController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : _validationController.pendingValidations.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check_circle_outline, size: 80, color: AppColors.success),
                          SizedBox(height: 16),
                          Text('¡Todo al día!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          Text('No tienes compras pendientes por validar.', style: TextStyle(color: AppColors.textLight)),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [Colors.orange.withValues(alpha: 0.2), Colors.amber.withValues(alpha: 0.1)]),
                            border: Border.all(color: Colors.orange.withValues(alpha: 0.5)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.stars, color: Colors.orange, size: 36),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tienes ${_validationController.pendingValidations.length} compra(s) por validar.',
                                      style: const TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold, fontSize: 14),
                                    ),
                                    const SizedBox(height: 4),
                                    const Text(
                                      'Califica tu experiencia para reclamar tus +5 puntos de fidelidad.',
                                      style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w600, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemCount: _validationController.pendingValidations.length,
                            itemBuilder: (context, index) {
                              final compra = _validationController.pendingValidations[index];
                              final fecha = DateTime.parse(compra['fecha_compra']).toLocal();
                              final fechaStr = DateFormat('dd/MM/yyyy HH:mm').format(fecha);
                              final nombreComercio = compra['comercios']?['nombre_comercial'] ?? 'Comercio';

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
                                          Expanded(
                                            child: Text(nombreComercio, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                            decoration: BoxDecoration(color: Colors.orange.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
                                            child: const Text('POR VALIDAR', style: TextStyle(color: Colors.orange, fontSize: 10, fontWeight: FontWeight.bold)),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Text('Compra: $fechaStr', style: const TextStyle(color: AppColors.textLight, fontSize: 12)),
                                      Text('Total: \$${compra['total_pagado']}', style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold, fontSize: 14)),
                                      const SizedBox(height: 16),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.primaryPurple,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                          ),
                                          onPressed: () => _abrirFormularioValidacion(compra),
                                          icon: const Icon(Icons.rate_review, color: AppColors.white),
                                          label: const Text('Calificar y Reclamar Puntos', style: TextStyle(fontWeight: FontWeight.bold)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
        );
      },
    );
  }
}

class _ValidationFormSheet extends StatefulWidget {
  final Map<String, dynamic> compra;
  final ClientValidationController controller;

  const _ValidationFormSheet({required this.compra, required this.controller});

  @override
  State<_ValidationFormSheet> createState() => _ValidationFormSheetState();
}

class _ValidationFormSheetState extends State<_ValidationFormSheet> {
  bool _recibido = true;
  bool _buenEstado = true;
  DateTime? _fechaCaducidad;
  bool _isSaving = false;
  
  int _ratingEstado = 0;
  int _ratingAtencion = 0;

  @override
  void initState() {
    super.initState();
    // Imprimimos el ID en la consola al abrir el formulario
    debugPrint('🆔 ID DE LA COMPRA: ${widget.compra['id']}');
  }

  Future<void> _seleccionarFecha() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 10)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      helpText: 'Selecciona la fecha de caducidad',
    );
    if (date != null) setState(() => _fechaCaducidad = date);
  }

  Future<void> _submit() async {
    // DEBUG: Para saber si el botón está capturando el toque
    debugPrint('👆 Botón presionado. Iniciando validación...');

    if (_ratingEstado == 0 || _ratingAtencion == 0) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Debes calificar ambas categorías con estrellas.'),
        backgroundColor: AppColors.warning,
      ));
      return;
    }

    setState(() => _isSaving = true);
    final messenger = ScaffoldMessenger.of(context);
    
    try {
      final success = await widget.controller.submitValidation(
        compraId: widget.compra['id'],
        recibido: _recibido,
        buenEstado: _buenEstado,
        fechaCaducidad: _fechaCaducidad,
        calificacionEstado: _ratingEstado,
        calificacionAtencion: _ratingAtencion,
      );

      if (!mounted) return;

      if (success) {
        Navigator.pop(context, true);
        messenger.showSnackBar(const SnackBar(
          content: Text('¡Gracias por tu validación! Has ganado +5 puntos.'),
          backgroundColor: AppColors.success,
        ));
      } else {
        setState(() => _isSaving = false);
        // MOSTRAMOS EL ERROR EXACTO DE SUPABASE
        messenger.showSnackBar(SnackBar(
          content: Text('Fallo en BD: ${widget.controller.errorMessage ?? "Desconocido"}'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 8), // 8 segundos para leer el error
        ));
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => _isSaving = false);
      messenger.showSnackBar(SnackBar(
        content: Text('Error local: $e'),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 8),
      ));
    }
  }

  Widget _buildStars(String label, int currentRating, Function(int) onRatingChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return IconButton(
              icon: Icon(
                index < currentRating ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 36,
              ),
              onPressed: () => onRatingChanged(index + 1),
            );
          }),
        ),
        const Divider(),
      ],
    );
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
            const Text('Validación de Compra', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Para recibir tus puntos, es obligatorio calificar tu experiencia.', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, color: Colors.grey)),
            
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.timer, color: AppColors.warning, size: 16),
                SizedBox(width: 4),
                Text(
                  'Valida antes de 7 días para recibir tus puntos.',
                  style: TextStyle(fontSize: 12, color: AppColors.warning, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            
            const SizedBox(height: 20),
            
            SwitchListTile(
              title: const Text('¿Recibiste el producto?'),
              value: _recibido,
              activeThumbColor: AppColors.primaryPurple,
              onChanged: (v) => setState(() => _recibido = v),
            ),
            
            SwitchListTile(
              title: const Text('¿El producto estaba en buen estado?'),
              value: _buenEstado,
              activeThumbColor: AppColors.primaryPurple,
              onChanged: (v) => setState(() => _buenEstado = v),
            ),

            const Divider(),

            _buildStars('Calidad del Producto', _ratingEstado, (val) => setState(() => _ratingEstado = val)),
            _buildStars('Atención del Comercio', _ratingAtencion, (val) => setState(() => _ratingAtencion = val)),

            ListTile(
              leading: const Icon(Icons.calendar_today, color: AppColors.primaryPurple),
              title: const Text('Fecha de Caducidad (Opcional)', style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text(_fechaCaducidad != null ? DateFormat('dd/MM/yyyy').format(_fechaCaducidad!) : 'No seleccionada (Solo si es perecedero)'),
              trailing: const Icon(Icons.edit, size: 20, color: Colors.grey),
              onTap: _seleccionarFecha,
            ),

            const SizedBox(height: 24),
            
            // --- DEBUG: MOSTRAMOS EL ID EN PANTALLA ---
            Center(
              child: Text(
                'ID: ${widget.compra['id']}',
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 8),
            // ------------------------------------------

            SizedBox(
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryPurple,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: _isSaving ? null : _submit,
                child: _isSaving 
                  ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2))
                  : const Text('🚀 Confirmar y Ganar Puntos', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/report_controller.dart';

class ReportModalScreen extends StatefulWidget {
  final String comercioId;
  final String nombreComercio;
  
  const ReportModalScreen({
    super.key, 
    required this.comercioId, 
    required this.nombreComercio
  });

  @override
  State<ReportModalScreen> createState() => _ReportModalScreenState();
}

class _ReportModalScreenState extends State<ReportModalScreen> {
  final _reportController = ReportController();
  final _descCtrl = TextEditingController();
  
  String _selectedMotive = 'Producto Falso o Engañoso';
  final List<String> _motives = [
    'Producto Falso o Engañoso',
    'Mal Estado del Producto',
    'Mala Atención al Cliente',
    'Incumplimiento de Entrega',
    'Lenguaje Ofensivo',
    'Otro'
  ];

  @override
  void dispose() {
    _descCtrl.dispose();
    super.dispose();
  }

  Future<void> _enviarReporte() async {
    if (_descCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, describe el problema.'), backgroundColor: AppColors.warning),
      );
      return;
    }

    final success = await _reportController.submitReport(
      comercioId: widget.comercioId,
      motivo: _selectedMotive,
      descripcion: _descCtrl.text,
    );

    if (success && mounted) {
      Navigator.pop(context); // Cierra el modal
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_reportController.successMessage!), backgroundColor: AppColors.success),
      );
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_reportController.errorMessage!), backgroundColor: AppColors.error),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _reportController,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, top: 24, left: 20, right: 20),
          decoration: const BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.report_problem, color: AppColors.error, size: 50),
                const SizedBox(height: 12),
                Text(
                  'Reportar a ${widget.nombreComercio}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textDark),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Ayúdanos a mantener OfVe seguro. Si experimentaste un problema, cuéntanos qué pasó.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
                const SizedBox(height: 20),

                DropdownButtonFormField<String>(
                  value: _selectedMotive,
                  decoration: const InputDecoration(labelText: 'Motivo del Reporte', prefixIcon: Icon(Icons.gavel)),
                  items: _motives.map((e) => DropdownMenuItem(value: e, child: Text(e, overflow: TextOverflow.ellipsis))).toList(),
                  onChanged: (v) => setState(() => _selectedMotive = v!),
                ),
                const SizedBox(height: 12),

                TextField(
                  controller: _descCtrl,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: 'Describe el problema en detalle',
                    prefixIcon: Icon(Icons.description),
                    alignLabelWithHint: true,
                  ),
                ),
                
                const SizedBox(height: 24),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
                    onPressed: _reportController.isLoading ? null : _enviarReporte,
                    child: _reportController.isLoading
                        ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                        : const Text('Enviar Reporte', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
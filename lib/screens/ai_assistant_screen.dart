import 'dart:typed_data'; // <-- NUEVO
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/ai_assistant_controller.dart';

class AiAssistantScreen extends StatefulWidget {
  final String? initialProductName;
  final Uint8List? imageBytes; // <-- NUEVO: imagen opcional para Vision

  const AiAssistantScreen({
    super.key,
    this.initialProductName,
    this.imageBytes, // <-- NUEVO
  });

  @override
  State<AiAssistantScreen> createState() => _AiAssistantScreenState();
}

class _AiAssistantScreenState extends State<AiAssistantScreen> {
  final _aiController = AiAssistantController();
  final _productNameCtrl = TextEditingController();
  String _selectedCategory = 'Alimentos y Bebidas';

  final List<String> _categorias = [
    'Alimentos y Bebidas', 'Tecnología', 'Ropa y Calzado', 'Salud y Belleza',
    'Hogar y Ferretería', 'Supermercado', 'Farmacia', 'Servicios', 'Otros'
  ];

  @override
  void initState() {
    super.initState();
    if (widget.initialProductName != null) {
      _productNameCtrl.text = widget.initialProductName!;
    }
  }

  @override
  void dispose() {
    _productNameCtrl.dispose();
    _aiController.dispose(); // <-- FIX: faltaba liberar el controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _aiController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Asistente IA')),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05), // <-- FIX warning
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.smart_toy, size: 50, color: AppColors.primaryPurple),
                      const SizedBox(height: 12),
                      const Text(
                        'Deja que la IA escriba por ti',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        // <-- CAMBIO: mensaje dinámico según si hay imagen
                        widget.imageBytes != null
                            ? 'La IA analizará la imagen y generará una descripción persuasiva.'
                            : 'Escribe el nombre de tu producto y selecciona su categoría. La IA generará una descripción persuasiva.',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: AppColors.textLight, fontSize: 13),
                      ),
                      const SizedBox(height: 20),

                      // <-- NUEVO: preview de la imagen si existe
                      if (widget.imageBytes != null) ...[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.memory(
                            widget.imageBytes!,
                            height: 140,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],

                      TextField(
                        controller: _productNameCtrl,
                        decoration: const InputDecoration(
                          labelText: 'Nombre del Producto',
                          prefixIcon: Icon(Icons.shopping_bag),
                        ),
                      ),
                      const SizedBox(height: 12),

                      DropdownButtonFormField<String>(
                        value: _selectedCategory,
                        decoration: const InputDecoration(
                          labelText: 'Categoría',
                          prefixIcon: Icon(Icons.category),
                        ),
                        items: _categorias
                            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (v) => setState(() => _selectedCategory = v!),
                      ),
                      const SizedBox(height: 20),

                      SizedBox(
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: _aiController.isLoading
                              ? null
                              : () => _aiController.generateDescription(
                                    productName: _productNameCtrl.text.trim(),
                                    category: _selectedCategory,
                                    imageBytes: widget.imageBytes, // <-- NUEVO: pasamos imagen
                                  ),
                          icon: _aiController.isLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: AppColors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Icon(Icons.auto_awesome, color: AppColors.white),
                          label: Text(
                            _aiController.isLoading ? 'Generando...' : 'Generar Descripción',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                if (_aiController.errorMessage != null) ...[
                  const SizedBox(height: 20),
                  Text(
                    _aiController.errorMessage!,
                    style: const TextStyle(
                      color: AppColors.error,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],

                if (_aiController.generatedDescription != null) ...[
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.primaryPurple.withValues(alpha: 0.5), // <-- FIX warning
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryPurple.withValues(alpha: 0.1), // <-- FIX warning
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.format_quote, color: AppColors.primaryPurple),
                            SizedBox(width: 8),
                            Text(
                              'Descripción Generada:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _aiController.generatedDescription!,
                          style: const TextStyle(fontSize: 16, height: 1.5),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.success,
                            ),
                            onPressed: () {
                              Navigator.pop(context, _aiController.generatedDescription);
                            },
                            icon: const Icon(Icons.check, color: AppColors.white),
                            label: const Text('Usar esta descripción'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
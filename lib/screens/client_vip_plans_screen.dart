import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/client_plans_controller.dart';

class ClientVipPlansScreen extends StatefulWidget {
  const ClientVipPlansScreen({super.key});

  @override
  State<ClientVipPlansScreen> createState() => _ClientVipPlansScreenState();
}

class _ClientVipPlansScreenState extends State<ClientVipPlansScreen> {
  final _plansController = ClientPlansController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _plansController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Planes VIP')),
          body: _plansController.isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [AppColors.darkCardColor, const Color(0xFF3D3785)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.darkCardColor.withValues(alpha: 0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Icon(Icons.workspace_premium, color: Colors.amber, size: 60),
                            const SizedBox(height: 16),
                            const Text(
                              'Desbloquea el máximo potencial de OfVe',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Tu plan actual: ${_plansController.currentPlanName}',
                              style: const TextStyle(color: Colors.white70, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text('Elige tu Nivel', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      ..._plansController.plans.map((plan) {
                        final isCurrent = plan['nombre'] == _plansController.currentPlanName;
                        final isBasic = plan['nombre'].toString().toLowerCase() == 'básico' ||
                            plan['nombre'].toString().toLowerCase() == 'basico';
                        if (isBasic && !isCurrent) return const SizedBox.shrink();

                        return Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: isCurrent ? AppColors.primaryPurple : Colors.transparent, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(plan['nombre'],
                                      style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.textDark)),
                                  if (isCurrent)
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                      decoration: BoxDecoration(
                                          color: AppColors.primaryPurple.withValues(alpha: 0.1),
                                          borderRadius: BorderRadius.circular(20)),
                                      child: const Text('ACTIVO',
                                          style: TextStyle(
                                              color: AppColors.primaryPurple,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12)),
                                    )
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(plan['descripcion'] ?? 'Beneficios exclusivos para ti',
                                  style: const TextStyle(color: AppColors.textLight)),
                              const SizedBox(height: 16),
                              Text('\$${plan['precio']} / mes',
                                  style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryPurple)),
                              const SizedBox(height: 20),
                              _buildBenefit('Envíos gratis en compras mayores a \$10'),
                              _buildBenefit('Puntos dobles por cada compra'),
                              _buildBenefit('Acceso anticipado a Ofertas Relámpago'),
                              _buildBenefit('Soporte prioritario 24/7'),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isCurrent ? Colors.grey : AppColors.primaryPurple,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                  ),
                                  onPressed: isCurrent
                                      ? null
                                      : () async {
                                          // FIX: capturamos messenger antes del await
                                          final messenger = ScaffoldMessenger.of(context);
                                          await _plansController.requestPlanUpgrade(plan['nombre']);
                                          if (!mounted) return;
                                          messenger.showSnackBar(SnackBar(
                                            content: Text('¡Felicidades! Ahora eres miembro ${plan['nombre']}'),
                                            backgroundColor: AppColors.success,
                                          ));
                                        },
                                  child: Text(
                                    isCurrent ? 'Plan Actual' : 'Actualizar a ${plan['nombre']}',
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget _buildBenefit(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: AppColors.success, size: 20),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14, color: AppColors.textDark))),
        ],
      ),
    );
  }
}
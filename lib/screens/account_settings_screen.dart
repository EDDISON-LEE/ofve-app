import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../controllers/account_settings_controller.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  final _accountController = AccountSettingsController();
  
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    
    // Esperamos a que se carguen los datos para setear los controladores
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _accountController.addListener(_syncControllers);
    });
  }

  void _syncControllers() {
    if (_nameController.text.isEmpty && _accountController.nombre.isNotEmpty) {
      _nameController.text = _accountController.nombre;
      _phoneController.text = _accountController.telefono;
    }
  }

  @override
  void dispose() {
    _accountController.removeListener(_syncControllers);
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _guardarPerfil() async {
    final success = await _accountController.updateProfile(
      newName: _nameController.text,
      newPhone: _phoneController.text,
    );
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(_accountController.successMessage ?? _accountController.errorMessage ?? ''),
        backgroundColor: success ? AppColors.success : AppColors.error,
      ));
    }
  }

  Future<void> _cambiarPassword() async {
    if (_passwordController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('La contraseña debe tener al menos 6 caracteres'),
        backgroundColor: AppColors.warning,
      ));
      return;
    }

    final success = await _accountController.changePassword(_passwordController.text);
    
    if (mounted) {
      if (success) _passwordController.clear();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(_accountController.successMessage ?? _accountController.errorMessage ?? ''),
        backgroundColor: success ? AppColors.success : AppColors.error,
      ));
    }
  }

  void _confirmarEliminarCuenta() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Eliminar Cuenta'),
        content: const Text('¿Estás seguro que deseas eliminar tu cuenta? Esta acción no se puede deshacer.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            onPressed: () async {
              Navigator.pop(ctx);
              await _accountController.deleteAccount();
            },
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _accountController,
      builder: (context, child) {
        if (_accountController.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator(color: AppColors.primaryPurple)),
          );
        }

        return Scaffold(
          backgroundColor: AppColors.bgTop,
          appBar: AppBar(title: const Text('Administrar mi Usuario')),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // CABECERA CON AVATAR Y DATOS
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [AppColors.primaryPurple, AppColors.primaryPurple.withOpacity(0.7)]),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [BoxShadow(color: AppColors.primaryPurple.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))],
                  ),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColors.white,
                        child: Icon(Icons.person, size: 50, color: AppColors.primaryPurple),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _accountController.nombre,
                        style: const TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _accountController.email,
                        style: TextStyle(color: AppColors.white.withOpacity(0.8), fontSize: 14),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              _accountController.rol.toUpperCase(),
                              style: const TextStyle(color: AppColors.white, fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              '${_accountController.puntos} pts',
                              style: const TextStyle(color: AppColors.white, fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 30),
                const Text('Información Personal', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                
                // FORMULARIO DE PERFIL
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Nombre Completo',
                          prefixIcon: Icon(Icons.person_outline),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: 'Teléfono',
                          prefixIcon: Icon(Icons.phone_outlined),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: TextEditingController(text: _accountController.email),
                        enabled: false,
                        decoration: const InputDecoration(
                          labelText: 'Email (No editable)',
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _accountController.isSaving ? null : _guardarPerfil,
                          child: _accountController.isSaving 
                              ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2))
                              : const Text('Guardar Cambios'),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 30),
                const Text('Seguridad', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                
                // CAMBIO DE CONTRASEÑA
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Nueva Contraseña',
                          prefixIcon: Icon(Icons.lock_outline),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: AppColors.darkCardColor),
                          onPressed: _accountController.isSaving ? null : _cambiarPassword,
                          child: const Text('Cambiar Contraseña'),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 30),
                const Text('Zona Peligrosa', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.error)),
                const SizedBox(height: 12),
                
                // ELIMINAR CUENTA
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.error.withOpacity(0.3)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Una vez que elimines tu cuenta, no hay vuelta atrás. Por favor, asegúrate de estar seguro.',
                        style: TextStyle(color: AppColors.textLight, fontSize: 13),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(foregroundColor: AppColors.error, side: const BorderSide(color: AppColors.error)),
                          onPressed: _confirmarEliminarCuenta,
                          child: const Text('Eliminar mi Cuenta'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }
}
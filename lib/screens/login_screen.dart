import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; 
import '../core/theme/app_theme.dart';
import '../controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _authController = AuthController();
  
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _storeNameController = TextEditingController();
  final _rifController = TextEditingController();
  final _referidoController = TextEditingController(); // <-- NUEVO CONTROLADOR

  bool _isRegistering = false;
  String _selectedRole = 'user';
  bool _isAdult = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _storeNameController.dispose();
    _rifController.dispose();
    _referidoController.dispose(); // <-- DISPOSE
    super.dispose();
  }

  Future<void> _submit() async {
    if (_isRegistering && !_isAdult) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debes declarar que eres mayor de edad.'), backgroundColor: AppColors.error),
      );
      return;
    }

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (_isRegistering) {
      final success = await _authController.register(
        email: email,
        password: password,
        role: _selectedRole,
        name: _nameController.text.trim(),
        isAdult: _isAdult,
        storeName: _storeNameController.text.trim(),
        rif: _rifController.text.trim(),
        referidoPor: _referidoController.text.trim(), // <-- ENVIAMOS EL CÓDIGO
      );
      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('¡Registro exitoso! Por favor, inicia sesión.'), backgroundColor: AppColors.success),
        );
        setState(() => _isRegistering = false);
        _passwordController.clear();
      }
    } else {
      final success = await _authController.login(email, password);
      
      if (success) {
        final session = Supabase.instance.client.auth.currentSession;
        debugPrint('==================================================');
        debugPrint('TOKEN DE ACCESO COMPLETO:');
        debugPrint(session?.accessToken);
        debugPrint('==================================================');
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_authController.errorMessage ?? 'Error de login'), backgroundColor: AppColors.error),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _authController,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(title: Text(_isRegistering ? 'Registro' : 'Iniciar sesión')),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 24),
                  const Icon(Icons.storefront, size: 80, color: AppColors.primaryPurple),
                  const SizedBox(height: 24),
                  
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email)),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Contraseña', prefixIcon: Icon(Icons.lock)),
                  ),
                  const SizedBox(height: 12),
                  
                  if (_isRegistering) ...[
                    DropdownButtonFormField<String>(
                      value: _selectedRole,
                      decoration: const InputDecoration(labelText: 'Tipo de cuenta'),
                      items: const [
                        DropdownMenuItem(value: 'user', child: Text('Usuario')),
                        DropdownMenuItem(value: 'merchant', child: Text('Comercio')),
                      ],
                      onChanged: (v) => setState(() => _selectedRole = v ?? 'user'),
                    ),
                    const SizedBox(height: 12),
                    
                    if (_selectedRole == 'user')
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(labelText: 'Nombre completo', prefixIcon: Icon(Icons.person)),
                      )
                    else ...[
                      TextField(
                        controller: _storeNameController,
                        decoration: const InputDecoration(labelText: 'Nombre comercial', prefixIcon: Icon(Icons.store)),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _rifController,
                        decoration: const InputDecoration(labelText: 'RIF del Comercio', prefixIcon: Icon(Icons.badge)),
                      ),
                    ],
                    const SizedBox(height: 12),

                    // --- NUEVO CAMPO DE REFERIDO ---
                    TextField(
                      controller: _referidoController,
                      decoration: const InputDecoration(
                        labelText: 'Código de Invitación (Opcional)', 
                        prefixIcon: Icon(Icons.card_giftcard)
                      ),
                    ),
                    const SizedBox(height: 12),

                    CheckboxListTile(
                      value: _isAdult,
                      activeColor: AppColors.primaryPurple,
                      onChanged: (v) => setState(() => _isAdult = v ?? false),
                      title: const Text('Declaro ser mayor de edad'),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ],
                  
                  const SizedBox(height: 24),
                  _authController.isLoading
                      ? const Center(child: CircularProgressIndicator(color: AppColors.primaryPurple))
                      : ElevatedButton(
                          onPressed: _submit,
                          child: Text(_isRegistering ? 'Registrarse' : 'Entrar'),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
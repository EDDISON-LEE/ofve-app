import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _storeNameController = TextEditingController();
  final _rifController = TextEditingController();

  bool _isLoading = false;
  bool _isRegistering = false;
  String _selectedRole = 'user';
  bool _isAdult = false;

  final String redirectUrl = 'https://fluffy-journey-qvrq7pgv5gxcxxq7-8080.app.github.dev/';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _storeNameController.dispose();
    _rifController.dispose();
    super.dispose();
  }

  Future<void> _ensureMerchantRecord(User user) async {
    if (user.userMetadata?['rol'] != 'merchant') return;

    final existe = await Supabase.instance.client
        .from('comercios')
        .select('id')
        .eq('usuario_id', user.id)
        .maybeSingle();

    if (existe == null) {
      await Supabase.instance.client.from('comercios').insert({
        'usuario_id': user.id,
        'nombre_comercial': _storeNameController.text.trim().isEmpty 
            ? (user.userMetadata?['nombre'] ?? 'Mi Comercio') 
            : _storeNameController.text.trim(),
        'rif': _rifController.text.trim().isEmpty 
            ? 'RIF-PENDIENTE-${DateTime.now().millisecondsSinceEpoch}' 
            : _rifController.text.trim(),
        'estatus_verificacion': 'Pendiente',
      });
    }
  }

  Future<void> _submit() async {
    if (_isRegistering && !_isAdult) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debes declarar que eres mayor de edad.'), backgroundColor: Colors.red),
      );
      return;
    }

    setState(() => _isLoading = true);
    final supabase = Supabase.instance.client;
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      if (_isRegistering) {
        // 1. Crear la cuenta
        final authResponse = await supabase.auth.signUp(
          email: email,
          password: password,
          emailRedirectTo: redirectUrl,
          data: {
            'nombre': _selectedRole == 'merchant' ? _storeNameController.text.trim() : _nameController.text.trim(),
            'rol': _selectedRole,
            'mayor_de_edad': _isAdult,
          },
        );

        // 2. Crear registro en la tabla comercios si es merchant
        if (_selectedRole == 'merchant' && authResponse.user != null) {
          await supabase.from('comercios').insert({
            'usuario_id': authResponse.user!.id,
            'nombre_comercial': _storeNameController.text.trim(),
            'rif': _rifController.text.trim().isEmpty 
                ? 'RIF-PENDIENTE-${DateTime.now().millisecondsSinceEpoch}' 
                : _rifController.text.trim(),
            'estatus_verificacion': 'Pendiente',
          });
        }

        if (mounted) {
          // 3. CERRAR SESIÓN AUTOMÁTICA
          await supabase.auth.signOut();
          
          // 4. Limpiar contraseña y cambiar a vista Login
          _passwordController.clear();
          setState(() => _isRegistering = false);

          // 5. Mostrar mensaje de éxito
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('¡Registro exitoso! Por favor, inicia sesión.'), backgroundColor: Colors.green),
          );
        }
      } else {
        // Lógica normal de inicio de sesión
        await supabase.auth.signInWithPassword(email: email, password: password);
        final user = supabase.auth.currentUser;
        if (user != null) {
          await _ensureMerchantRecord(user);
        }
      }
    } on AuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${e.message}'), backgroundColor: Colors.red));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _showForgotPasswordDialog() async {
    final resetEmailController = TextEditingController(text: _emailController.text.trim());

    final sent = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Recuperar contraseña'),
        content: TextField(
          controller: resetEmailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(labelText: 'Email'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await Supabase.instance.client.auth.resetPasswordForEmail(
                  resetEmailController.text.trim(),
                  redirectTo: redirectUrl,
                );
                if (ctx.mounted) Navigator.pop(ctx, true);
              } catch (e) {
                if (ctx.mounted) {
                  ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red));
                }
              }
            },
            child: const Text('Enviar'),
          ),
        ],
      ),
    );

    resetEmailController.dispose();

    if (sent == true && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Revisa tu correo para restablecer.'), backgroundColor: Colors.green));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_isRegistering ? 'Registro' : 'Iniciar sesión')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              const Icon(Icons.storefront, size: 80),
              const SizedBox(height: 24),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email), border: OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Contraseña', prefixIcon: Icon(Icons.lock), border: OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
              
              if (_isRegistering) ...[
                DropdownButtonFormField<String>(
                  value: _selectedRole,
                  decoration: const InputDecoration(labelText: 'Tipo de cuenta', border: OutlineInputBorder()),
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
                    decoration: const InputDecoration(labelText: 'Nombre completo', prefixIcon: Icon(Icons.person), border: OutlineInputBorder()),
                  )
                else ...[
                  TextField(
                    controller: _storeNameController,
                    decoration: const InputDecoration(labelText: 'Nombre comercial', prefixIcon: Icon(Icons.store), border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _rifController,
                    decoration: const InputDecoration(labelText: 'RIF del Comercio (Ej: J-12345678-9)', prefixIcon: Icon(Icons.badge), border: OutlineInputBorder()),
                  ),
                ],
                const SizedBox(height: 12),
                CheckboxListTile(
                  value: _isAdult,
                  onChanged: (v) => setState(() => _isAdult = v ?? false),
                  title: const Text('Declaro ser mayor de edad'),
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                ),
              ],
              
              const SizedBox(height: 16),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submit,
                  child: _isLoading
                      ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2))
                      : Text(_isRegistering ? 'Registrarse' : 'Entrar'),
                ),
              ),
              if (!_isRegistering)
                TextButton(
                  onPressed: _showForgotPasswordDialog,
                  child: const Text('¿Olvidaste tu contraseña?'),
                ),
              TextButton(
                onPressed: () => setState(() => _isRegistering = !_isRegistering),
                child: Text(_isRegistering ? '¿Ya tienes cuenta? Inicia sesión' : '¿No tienes cuenta? Regístrate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
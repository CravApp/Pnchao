import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:museo_punchao/utils/app_theme.dart';
import 'package:museo_punchao/widgets/andean_pattern_decoration.dart';
import 'package:museo_punchao/widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate login delay
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        context.go('/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryPurple,
      body: AndeanPatternDecoration(
        showBottomPattern: true,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    // Logo
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryPurpleLight,
                        border: Border.all(
                          color: AppColors.accentTurquoise,
                          width: 3,
                        ),
                      ),
                      child: const Icon(
                        Icons.museum,
                        size: 50,
                        color: AppColors.textWhite,
                      ),
                    ),
                    const SizedBox(height: 24),
                    // App Title
                    const Text(
                      'MUSEO PUNCHAO',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textWhite,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 60),
                    // Username Field
                    TextFormField(
                      controller: _usernameController,
                      style: const TextStyle(color: AppColors.textDark),
                      decoration: const InputDecoration(
                        hintText: 'Usuario',
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: AppColors.textGrey,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa tu usuario';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    // Password Field
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      style: const TextStyle(color: AppColors.textDark),
                      decoration: InputDecoration(
                        hintText: 'Contraseña',
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: AppColors.textGrey,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColors.textGrey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa tu contraseña';
                        }
                        if (value.length < 6) {
                          return 'La contraseña debe tener al menos 6 caracteres';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 40),
                    // Login Button
                    PrimaryButton(
                      text: 'Iniciar Sesión',
                      onPressed: _handleLogin,
                      isLoading: _isLoading,
                      width: double.infinity,
                    ),
                    const SizedBox(height: 24),
                    // Create Account Link
                    TextButton(
                      onPressed: () {
                        context.push('/register');
                      },
                      child: const Text(
                        'Crear Cuenta',
                        style: TextStyle(
                          color: AppColors.accentTurquoise,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

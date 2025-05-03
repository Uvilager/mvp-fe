import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mvp_fe/core/errors/app_exception.dart';
import '../../providers/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    await ref.read(authProvider.notifier).login(
      _emailController.text.trim(),
      _passwordController.text,
    );
  }

  String? _getErrorMessage(Object error) {
    print('Error type: ${error.runtimeType}');
    print('Error details: $error');
    
    // First, try direct type checking
    if (error is AuthException) {
      print('AuthException message: ${error.message}');
      return error.message;
    } else if (error is ValidationException) {
      print('ValidationException errors: ${error.errors}');
      final errorMessages = <String>[];
      error.errors.forEach((field, messages) {
        if (messages is List) {
          errorMessages.addAll(messages.map((m) => m.toString()));
        } else {
          errorMessages.add(messages.toString());
        }
      });
      return errorMessages.join('\n');
    } else if (error is NetworkException) {
      print('NetworkException message: ${error.message}');
      return error.message;
    } else if (error is ServerException) {
      print('ServerException message: ${error.message}');
      return error.message;
    }
    
    // Enhanced fallback handling
    print('Unknown error type, attempting to extract message...');
    
    // Try to access message property dynamically
    try {
      final dynamic errorDynamic = error;
      if (errorDynamic is Exception && errorDynamic.toString().contains('AuthException')) {
        // If it's an AuthException but wasn't caught above, try to extract message
        final errorStr = errorDynamic.toString();
        if (errorStr.contains(':')) {
          final parts = errorStr.split(':');
          if (parts.length > 1) {
            return parts.last.trim();
          }
        }
      }
      
      // Try accessing message property
      final messageProperty = errorDynamic.message;
      if (messageProperty != null) {
        return messageProperty.toString();
      }
    } catch (e) {
      print('Failed to access message property: $e');
    }
    
    // Check for common authentication error patterns
    final errorString = error.toString().toLowerCase();
    if (errorString.contains('incorrect password') || 
        errorString.contains('wrong password') ||
        errorString.contains('invalid password')) {
      return 'Incorrect password. Please try again.';
    }
    
    if (errorString.contains('invalid email') || 
        errorString.contains('email not found') ||
        errorString.contains('user not found')) {
      return 'Email address not found. Please check your email.';
    }
    
    if (errorString.contains('authentication') || 
        errorString.contains('login failed') ||
        errorString.contains('credentials')) {
      return 'Invalid credentials. Please check your email and password.';
    }
    
    if (errorString.contains('network') || 
        errorString.contains('connection')) {
      return 'Network error. Please check your internet connection.';
    }
    
    // Final fallback
    return 'Login failed. Please check your credentials and try again.';
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final isLoading = authState.isLoading;
    final error = authState.error;

    // Define colors exactly matching the web app
    const Color primaryColor = Color(0xFFf08a6e); // --primary
    const Color secondaryColor = Color(0xFF2c3e50); // --secondary
    const Color lightColor = Color(0xFFf9f7f4); // --light
    const Color whiteColor = Colors.white;
    const String logoAssetPath = 'img/logo.png'; // Confirmed path

    // Define local text styles based on AppTextStyles and web design
    const TextStyle handwrittenStyle = TextStyle( // Assuming 'Caveat' font is added
      fontFamily: 'Caveat',
      color: primaryColor,
      fontSize: 40,
      fontWeight: FontWeight.w700, // Caveat bold
      height: 1.2,
    );
    const TextStyle formLabelStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: secondaryColor,
    );

    return Scaffold(
      backgroundColor: lightColor,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
                child: Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(maxWidth: 450), // Max width like web
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Header Section
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        decoration: const BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 180,
                              padding: EdgeInsets.zero,
                              margin: EdgeInsets.zero,
                              child: Image.asset(
                                logoAssetPath, // Using defined path
                                width: double.infinity,
                                height: 180,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) => const Icon(
                                  Icons.business_rounded, // Placeholder icon
                                  size: 64,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: whiteColor,
                                ),
                                children: [
                                  TextSpan(text: 'Prijava na \n'),
                                  TextSpan(
                                    text: 'MVP portal',
                                    style: handwrittenStyle,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Form Section
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Display error message if there's an error
                              if (error != null) ...[
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(12),
                                  margin: const EdgeInsets.only(bottom: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade50,
                                    border: Border.all(color: Colors.red.shade200),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.error_outline,
                                        color: Colors.red.shade600,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          _getErrorMessage(error) ?? 'An error occurred',
                                          style: TextStyle(
                                            color: Colors.red.shade700,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                              
                              // Email Field
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Email adresa', 
                                    style: formLabelStyle,
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    style: const TextStyle(
                                      color: secondaryColor,
                                      fontSize: 16,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'Unesite email adresu',
                                      hintStyle: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 16,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(color: Colors.grey[300]!),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(color: Colors.grey[300]!),
                                      ),
                                      filled: true,
                                      fillColor: whiteColor,
                                      contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 16,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(color: primaryColor, width: 2),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(color: Colors.red, width: 1),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(color: Colors.red, width: 2),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Unesite email adresu';
                                      }
                                      if (!value.contains('@')) {
                                        return 'Unesite validnu email adresu';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),

                              // Password Field & Forgot Password
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Lozinka',
                                        style: formLabelStyle,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // TODO: Implement Forgot Password
                                          print('Forgot Password tapped');
                                        },
                                        child: const Text(
                                          'Zaboravili ste lozinku?',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: primaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    controller: _passwordController,
                                    obscureText: true,
                                    style: const TextStyle(
                                      color: secondaryColor,
                                      fontSize: 16,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'Unesite lozinku',
                                      hintStyle: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 16,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(color: Colors.grey[300]!),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(color: Colors.grey[300]!),
                                      ),
                                      filled: true,
                                      fillColor: whiteColor,
                                      contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 16,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(color: primaryColor, width: 2),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(color: Colors.red, width: 1),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(color: Colors.red, width: 2),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Unesite lozinku';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),

                              // Login Button
                              ElevatedButton(
                                onPressed: isLoading ? null : _handleLogin,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  foregroundColor: whiteColor,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  elevation: 0,
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                child: isLoading
                                    ? const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation<Color>(whiteColor),
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : const Text('Prijava'),
                              ),
                              const SizedBox(height: 16),
                              
                              // Register Link
                              Center(
                                child: TextButton(
                                  onPressed: () {
                                    // Navigate to register screen
                                    context.push('/register');
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor: primaryColor,
                                  ),
                                  child: const Text(
                                    'Nemate nalog? Registrujte se',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Footer
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: secondaryColor,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                child: Text(
                  '© ${DateTime.now().year} MVP. Sva prava zadržana.',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 
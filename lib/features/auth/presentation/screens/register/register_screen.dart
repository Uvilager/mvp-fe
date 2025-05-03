import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/auth_provider.dart';
import 'widgets/register_form.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // EXACT same colors as login screen
    const Color primaryColor = Color(0xFFf08a6e); // --primary
    const Color secondaryColor = Color(0xFF2c3e50); // --secondary
    const Color lightColor = Color(0xFFf9f7f4); // --light
    const Color whiteColor = Colors.white;
    const String logoAssetPath = 'img/logo.png'; // Confirmed path

    // EXACT same text styles as login screen
    const TextStyle handwrittenStyle = TextStyle(
      fontFamily: 'Caveat',
      color: primaryColor,
      fontSize: 40,
      fontWeight: FontWeight.w700,
      height: 1.2,
    );

    return Scaffold(
      backgroundColor: lightColor, // EXACT same as login
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60), // EXACT same as login
                child: Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(maxWidth: 450), // EXACT same as login
                  decoration: BoxDecoration(
                    color: whiteColor, // EXACT same as login
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15), // EXACT same as login
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
                      // Header Section - EXACT same as login
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12), // EXACT same as login
                        decoration: const BoxDecoration(
                          color: secondaryColor, // EXACT same as login
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
                                logoAssetPath, // EXACT same as login
                                width: double.infinity,
                                height: 180,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) => const Icon(
                                  Icons.business_rounded, // EXACT same as login
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
                                  color: whiteColor, // EXACT same as login
                                ),
                                children: [
                                  TextSpan(text: 'Registracija na \n'),
                                  TextSpan(
                                    text: 'MVP portal',
                                    style: handwrittenStyle, // EXACT same as login
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Form Section - EXACT same structure as login
                      Padding(
                        padding: const EdgeInsets.all(12), // EXACT same as login
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Register Form
                            const RegisterForm(),
                            const SizedBox(height: 16),
                            
                            // Login Link - styled like login's register link
                            Center(
                              child: TextButton(
                                onPressed: () => context.push('/login'),
                                style: TextButton.styleFrom(
                                  foregroundColor: primaryColor, // EXACT same as login
                                ),
                                child: const Text(
                                  'Već imate nalog? Prijavite se',
                                  style: TextStyle(
                                    fontSize: 14, // EXACT same as login
                                    fontWeight: FontWeight.w600, // EXACT same as login
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Footer - EXACT same as login
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: secondaryColor, // EXACT same as login
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24), // EXACT same as login
                child: Text(
                  '© ${DateTime.now().year} MVP. Sva prava zadržana.', // EXACT same as login
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white70, // EXACT same as login
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
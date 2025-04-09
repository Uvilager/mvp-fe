import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/buttons/primary_button.dart';
import '../../../../../core/widgets/buttons/secondary_button.dart';
import '../../providers/auth_provider.dart';
import 'widgets/register_form.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo and Title
                const Icon(
                  Icons.person_add_outlined,
                  size: 64,
                  color: AppColors.primary,
                ),
                const SizedBox(height: 24),
                Text(
                  'Create Account',
                  style: AppTextStyles.heading1.copyWith(
                    color: AppColors.text,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Sign up to get started',
                  style: AppTextStyles.body1.copyWith(
                    color: AppColors.textLight,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                // Register Form
                const RegisterForm(),
                const SizedBox(height: 16),

                // Login Link
                SecondaryButton(
                  onPressed: () => context.push('/login'),
                  text: 'Already have an account? Sign In',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 
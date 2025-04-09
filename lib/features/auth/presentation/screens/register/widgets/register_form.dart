import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvp_fe/core/widgets/buttons/primary_button.dart';
import 'package:mvp_fe/core/widgets/forms/custom_text_field.dart';
import 'package:mvp_fe/core/widgets/forms/password_field.dart';
import 'package:mvp_fe/features/auth/presentation/providers/auth_provider.dart';


class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _cityController = TextEditingController();
  final _addressController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _avatarUrlController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _cityController.dispose();
    _addressController.dispose();
    _postalCodeController.dispose();
    _avatarUrlController.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await ref.read(authProvider.notifier).register(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        username: _usernameController.text.trim(),
        phone: _phoneController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
        passwordConfirmation: _confirmPasswordController.text,
        city: _cityController.text.trim(),
        address: _addressController.text.trim(),
        postalCode: _postalCodeController.text.trim(),
        avatarUrl: _avatarUrlController.text.trim(),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Name Fields
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: _firstNameController,
                  label: 'First Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextField(
                  controller: _lastNameController,
                  label: 'Last Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Username Field
          CustomTextField(
            controller: _usernameController,
            label: 'Username',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a username';
              }
              if (value.length < 3) {
                return 'Username must be at least 3 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Phone Field
          CustomTextField(
            controller: _phoneController,
            label: 'Phone',
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              if (!value.startsWith('+')) {
                return 'Phone number should start with +';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Email Field
          CustomTextField(
            controller: _emailController,
            label: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Password Field
          PasswordField(
            controller: _passwordController,
            label: 'Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Confirm Password Field
          PasswordField(
            controller: _confirmPasswordController,
            label: 'Confirm Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != _passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // City Field
          CustomTextField(
            controller: _cityController,
            label: 'City',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your city';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Address Field
          CustomTextField(
            controller: _addressController,
            label: 'Address',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your address';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Postal Code Field
          CustomTextField(
            controller: _postalCodeController,
            label: 'Postal Code',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your postal code';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Avatar URL Field
          CustomTextField(
            controller: _avatarUrlController,
            label: 'Avatar URL (Optional)',
            keyboardType: TextInputType.url,
          ),
          const SizedBox(height: 24),

          // Register Button
          PrimaryButton(
            onPressed: _isLoading ? null : _onSubmit,
            isLoading: _isLoading,
            text: 'Create Account',
          ),
        ],
      ),
    );
  }
} 
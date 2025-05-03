import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvp_fe/core/widgets/buttons/primary_button.dart';
import 'package:mvp_fe/core/widgets/forms/custom_text_field.dart';
import 'package:mvp_fe/core/widgets/forms/password_field.dart';
import 'package:mvp_fe/core/errors/app_exception.dart';
import 'package:mvp_fe/features/auth/presentation/providers/auth_provider.dart';

// Data class to store step 1 information
class RegistrationStepOneData {
  final String firstName;
  final String lastName;
  final String username;
  final String phone;
  final String email;
  final String city;
  final String address;
  final String postalCode;

  RegistrationStepOneData({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.phone,
    required this.email,
    required this.city,
    required this.address,
    required this.postalCode,
  });
}

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  // Step management
  int _currentStep = 1;
  final int _totalSteps = 2;
  
  // Form keys for each step
  final _stepOneFormKey = GlobalKey<FormState>();
  final _stepTwoFormKey = GlobalKey<FormState>();
  
  // Step 1 controllers
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _cityController = TextEditingController();
  final _addressController = TextEditingController();
  final _postalCodeController = TextEditingController();
  
  // Step 2 controllers
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  
  // Data storage for step 1
  RegistrationStepOneData? _stepOneData;

  // EXACT same colors as login screen
  static const Color primaryColor = Color(0xFFf08a6e); // --primary
  static const Color secondaryColor = Color(0xFF2c3e50); // --secondary
  static const Color whiteColor = Colors.white;

  // EXACT same text styles as login screen
  static const TextStyle formLabelStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: secondaryColor,
  );

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _cityController.dispose();
    _addressController.dispose();
    _postalCodeController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep == 1) {
      if (_stepOneFormKey.currentState!.validate()) {
        // Store step 1 data
        _stepOneData = RegistrationStepOneData(
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          username: _usernameController.text.trim(),
          phone: _phoneController.text.trim(),
          email: _emailController.text.trim(),
          city: _cityController.text.trim(),
          address: _addressController.text.trim(),
          postalCode: _postalCodeController.text.trim(),
        );
        
        setState(() {
          _currentStep = 2;
        });
      }
    } else if (_currentStep == 2) {
      _submitRegistration();
    }
  }

  void _previousStep() {
    if (_currentStep > 1) {
      setState(() {
        _currentStep = _currentStep - 1;
      });
    }
  }

  Future<void> _submitRegistration() async {
    if (!_stepTwoFormKey.currentState!.validate() || _stepOneData == null) return;

    await ref.read(authProvider.notifier).register(
      firstName: _stepOneData!.firstName,
      lastName: _stepOneData!.lastName,
      username: _stepOneData!.username,
      phone: _stepOneData!.phone,
      email: _stepOneData!.email,
      password: _passwordController.text,
      passwordConfirmation: _confirmPasswordController.text,
      city: _stepOneData!.city,
      address: _stepOneData!.address,
      postalCode: _stepOneData!.postalCode,
      districtId: 1, // Temporary fix - set to 1
    );
  }

  String? _getErrorMessage(Object error) {
    if (error is AuthException) {
      return error.message;
    } else if (error is ValidationException) {
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
      return error.message;
    } else if (error is ServerException) {
      return error.message;
    }
    
    return 'Registration failed. Please check your information and try again.';
  }

  // Custom text field to match login style EXACTLY
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: formLabelStyle, // Using exact same style as login
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          style: const TextStyle(
            color: secondaryColor, // Exact same as login
            fontSize: 16,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey[600], // Exact same as login
              fontSize: 16,
            ),
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!), // Exact same as login
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!), // Exact same as login
            ),
            filled: true,
            fillColor: whiteColor, // Exact same as login
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: primaryColor, width: 2), // Exact same as login
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red, width: 1), // Exact same as login
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red, width: 2), // Exact same as login
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }

  Widget _buildStepOne() {
    return Form(
      key: _stepOneFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Step indicator
          Row(
            children: [
              const Icon(Icons.person_outline, color: primaryColor, size: 20),
              const SizedBox(width: 8),
              const Text(
                'Osnovni podaci',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: secondaryColor,
                ),
              ),
              const Spacer(),
              Text(
                'Korak 1 od $_totalSteps',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Name Fields
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  controller: _firstNameController,
                  label: 'Ime',
                  hintText: 'Unesite vaše ime',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ime je obavezno';
                    }
                    if (value.length < 2) {
                      return 'Ime mora imati najmanje 2 karaktera';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildTextField(
                  controller: _lastNameController,
                  label: 'Prezime',
                  hintText: 'Unesite vaše prezime',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Prezime je obavezno';
                    }
                    if (value.length < 2) {
                      return 'Prezime mora imati najmanje 2 karaktera';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Username Field
          _buildTextField(
            controller: _usernameController,
            label: 'Korisničko ime',
            hintText: 'Unesite korisničko ime',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Korisničko ime je obavezno';
              }
              if (value.length < 3) {
                return 'Korisničko ime mora imati najmanje 3 karaktera';
              }
              if (value.length > 32) {
                return 'Korisničko ime može imati najviše 32 karaktera';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Email Field
          _buildTextField(
            controller: _emailController,
            label: 'Email adresa',
            hintText: 'Unesite email adresu',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email adresa je obavezna';
              }
              if (!value.contains('@') || !value.contains('.')) {
                return 'Unesite validnu email adresu';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Phone Field
          _buildTextField(
            controller: _phoneController,
            label: 'Telefon',
            hintText: 'Unesite broj telefona (+381...)',
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Broj telefona je obavezan';
              }
              if (!value.startsWith('+')) {
                return 'Broj telefona mora počinjati sa +';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // City Field
          _buildTextField(
            controller: _cityController,
            label: 'Grad',
            hintText: 'Unesite naziv grada',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Grad je obavezan';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Address Field
          _buildTextField(
            controller: _addressController,
            label: 'Adresa',
            hintText: 'Unesite adresu stanovanja',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Adresa je obavezna';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Postal Code Field
          _buildTextField(
            controller: _postalCodeController,
            label: 'Poštanski broj',
            hintText: 'Unesite poštanski broj',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Poštanski broj je obavezan';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildStepTwo() {
    return Form(
      key: _stepTwoFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Step indicator
          Row(
            children: [
              const Icon(Icons.lock_outline, color: primaryColor, size: 20),
              const SizedBox(width: 8),
              const Text(
                'Sigurnost naloga',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: secondaryColor,
                ),
              ),
              const Spacer(),
              Text(
                'Korak 2 od $_totalSteps',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Summary of step 1 data
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pregled unetih podataka:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: secondaryColor,
                  ),
                ),
                const SizedBox(height: 8),
                if (_stepOneData != null) ...[
                  Text('${_stepOneData!.firstName} ${_stepOneData!.lastName}'),
                  Text('Email: ${_stepOneData!.email}'),
                  Text('Telefon: ${_stepOneData!.phone}'),
                  Text('Grad: ${_stepOneData!.city}'),
                ],
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Password Field
          _buildTextField(
            controller: _passwordController,
            label: 'Lozinka',
            hintText: 'Unesite lozinku',
            obscureText: !_isPasswordVisible,
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey[600],
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Lozinka je obavezna';
              }
              if (value.length < 8) {
                return 'Lozinka mora imati najmanje 8 karaktera';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Confirm Password Field
          _buildTextField(
            controller: _confirmPasswordController,
            label: 'Potvrda lozinke',
            hintText: 'Ponovite lozinku',
            obscureText: !_isConfirmPasswordVisible,
            suffixIcon: IconButton(
              icon: Icon(
                _isConfirmPasswordVisible ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey[600],
              ),
              onPressed: () {
                setState(() {
                  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                });
              },
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Potvrda lozinke je obavezna';
              }
              if (value != _passwordController.text) {
                return 'Lozinke se ne poklapaju';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final isLoading = authState.isLoading;
    final error = authState.error;

    return Column(
      children: [
        // Display error message if there's an error - EXACT same as login
        if (error != null) ...[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.red.shade50, // Exact same as login
              border: Border.all(color: Colors.red.shade200), // Exact same as login
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.red.shade600, // Exact same as login
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _getErrorMessage(error) ?? 'An error occurred',
                    style: TextStyle(
                      color: Colors.red.shade700, // Exact same as login
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],

        // Step content
        if (_currentStep == 1) _buildStepOne(),
        if (_currentStep == 2) _buildStepTwo(),
        
        const SizedBox(height: 24),

        // Navigation buttons - styled exactly like login button
        Row(
          children: [
            if (_currentStep > 1) ...[
              Expanded(
                child: OutlinedButton(
                  onPressed: isLoading ? null : _previousStep,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: const BorderSide(color: primaryColor),
                    foregroundColor: primaryColor,
                  ),
                  child: const Text(
                    'Nazad',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
            Expanded(
              flex: _currentStep == 1 ? 1 : 1,
              child: ElevatedButton(
                onPressed: isLoading ? null : _nextStep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor, // Exact same as login
                  foregroundColor: whiteColor, // Exact same as login
                  padding: const EdgeInsets.symmetric(vertical: 16), // Exact same as login
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Exact same as login
                  ),
                  elevation: 0, // Exact same as login
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
                          valueColor: AlwaysStoppedAnimation<Color>(whiteColor), // Exact same as login
                          strokeWidth: 2, // Exact same as login
                        ),
                      )
                    : Text(_currentStep == 1 ? 'Sledeći korak' : 'Završi registraciju'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvp_fe/core/errors/app_exception.dart'; // Import exceptions
import 'package:mvp_fe/features/auth/data/repositories/auth_repository_impl.dart'; // Import repository provider
import 'package:mvp_fe/features/auth/domain/models/auth_state.dart'; // Import AuthState and Authenticated
import 'package:mvp_fe/features/auth/presentation/providers/auth_provider.dart'; // To get user data

class GeneralSettingsScreen extends ConsumerStatefulWidget {
  const GeneralSettingsScreen({super.key});

  @override
  ConsumerState<GeneralSettingsScreen> createState() =>
      _GeneralSettingsScreenState();
}

class _GeneralSettingsScreenState extends ConsumerState<GeneralSettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _usernameController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneController;
  late TextEditingController _cityController;
  late TextEditingController _addressController;
  late TextEditingController _postalCodeController;

  bool _isLoading = false;
  String? _errorMessage; // For displaying general errors

  @override
  void initState() {
    super.initState();
    // Initialize controllers - ideally pre-filled with user data
    final authState = ref.read(authProvider).valueOrNull;
    final user = authState is Authenticated ? authState.user : null;
    _usernameController = TextEditingController(text: user?.username ?? '');
    _firstNameController = TextEditingController(text: user?.firstName ?? '');
    _lastNameController = TextEditingController(text: user?.lastName ?? '');
    _phoneController = TextEditingController(text: user?.phone ?? '');
    _cityController = TextEditingController(text: user?.city ?? '');
    _addressController = TextEditingController(text: user?.address ?? '');
    _postalCodeController = TextEditingController(text: user?.postalCode ?? '');
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    _addressController.dispose();
    _postalCodeController.dispose();
    super.dispose();
  }

  Future<void> _saveSettings() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _errorMessage = null; // Clear previous errors
      });

      final updatedData = {
        'username': _usernameController.text,
        'first_name': _firstNameController.text,
        'last_name': _lastNameController.text,
        'phone': _phoneController.text,
        'city': _cityController.text,
        'address': _addressController.text,
        'postal_code': _postalCodeController.text,
      };

      try {
        final repository = ref.read(authRepositoryProvider);
        final updatedUser = await repository.updateUserDetails(updatedData);

        // Optionally update the AuthProvider state
        ref.read(authProvider.notifier).state = AsyncValue.data(
          AuthState.authenticated(updatedUser),
        );

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Settings updated successfully!'),
              backgroundColor: Colors.green,
            ),
          );
          // Optionally navigate back after success
          // Navigator.of(context).pop();
        }
      } on AppException catch (e) {
        // Handle specific exceptions (like validation) or show general message
        String message = 'Failed to update settings.';
        if (e is ValidationException) {
          // Combine validation messages (basic example)
          message = e.errors.entries
              .map((entry) => '${entry.key}: ${entry.value.join(', ')}')
              .join('\n');
        } else {
          message = e.message; // Use message from other AppExceptions
        }
        setState(() {
          _errorMessage = message;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      } catch (e) {
        // Catch any other unexpected errors
        final message = 'An unexpected error occurred: $e';
        setState(() {
          _errorMessage = message;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Watch auth state to potentially update fields if user logs out/in while screen is open
    // This might cause issues if the user logs out while this screen is open,
    // consider adding logic to handle the Unauthenticated state if needed.
    ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('General Settings')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Display general error message if any
              if (_errorMessage != null) ...[
                Text(
                  _errorMessage!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
                const SizedBox(height: 16),
              ],
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) {
                  // Backend handles uniqueness, keep frontend validation simple
                  if (value == null || value.isEmpty) return null;
                  if (value.length < 6) return 'Min 6 characters';
                  if (value.length > 32) return 'Max 32 characters';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) return null;
                  if (value.length < 2) return 'Min 2 characters';
                  if (value.length > 32) return 'Max 32 characters';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) return null;
                  if (value.length < 2) return 'Min 2 characters';
                  if (value.length > 32) return 'Max 32 characters';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) return null;
                  if (value.length < 2) return 'Min 2 characters';
                  if (value.length > 32) return 'Max 32 characters';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(labelText: 'City'),
                validator: (value) {
                  if (value == null || value.isEmpty) return null;
                  if (value.length < 2) return 'Min 2 characters';
                  if (value.length > 32) return 'Max 32 characters';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) return null;
                  if (value.length < 2) return 'Min 2 characters';
                  if (value.length > 255) return 'Max 255 characters';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _postalCodeController,
                decoration: const InputDecoration(labelText: 'Postal Code'),
                validator: (value) {
                  if (value == null || value.isEmpty) return null;
                  if (value.length < 2) return 'Min 2 characters';
                  if (value.length > 32) return 'Max 32 characters';
                  return null;
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _isLoading ? null : _saveSettings,
                child:
                    _isLoading
                        ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                        : const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

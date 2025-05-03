import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvp_fe/features/auth/presentation/providers/auth_provider.dart';
import 'package:mvp_fe/features/auth/domain/models/auth_state.dart';

class SettingsProfileScreen extends ConsumerStatefulWidget {
  const SettingsProfileScreen({super.key});

  @override
  ConsumerState<SettingsProfileScreen> createState() => _SettingsProfileScreenState();
}

class _SettingsProfileScreenState extends ConsumerState<SettingsProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // User info controllers
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cityController = TextEditingController();
  final _addressController = TextEditingController();
  final _postalCodeController = TextEditingController();

  bool _isUpdatingProfile = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() {
    final authState = ref.read(authProvider);
    authState.whenOrNull(
      data: (state) {
        if (state is Authenticated) {
          final user = state.user;
          _firstNameController.text = user.firstName;
          _lastNameController.text = user.lastName;
          _usernameController.text = user.username;
          _emailController.text = user.email;
          _phoneController.text = user.phone ?? '';
          _cityController.text = user.city ?? '';
          _addressController.text = user.address ?? '';
          _postalCodeController.text = user.postalCode ?? '';
        }
      },
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    _addressController.dispose();
    _postalCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    // EXACT same colors as other screens
    const Color primaryColor = Color(0xFFf08a6e);
    const Color secondaryColor = Color(0xFF2c3e50);
    const Color lightColor = Color(0xFFf9f7f4);
    const Color whiteColor = Colors.white;

    // Serbian handwritten style
    const TextStyle handwrittenStyle = TextStyle(
      fontFamily: 'Caveat',
      color: primaryColor,
      fontSize: 32,
      fontWeight: FontWeight.w700,
      height: 1.2,
    );

    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: whiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Lični podaci',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: whiteColor,
          ),
        ),
      ),
      body: authState.when(
        data: (state) {
          return switch (state) {
            Authenticated(:final user) => CustomScrollView(
              slivers: [
                // Hero Header Section
                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          secondaryColor,
                          secondaryColor.withOpacity(0.8),
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
                          child: Column(
                            children: [
                              // User Avatar and Info
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: whiteColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(color: whiteColor, width: 3),
                                ),
                                child: user.avatarUrl != null && user.avatarUrl!.isNotEmpty
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: Image.network(
                                          user.avatarUrl!,
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) => Icon(
                                            Icons.person,
                                            size: 40,
                                            color: whiteColor,
                                          ),
                                        ),
                                      )
                                    : Icon(
                                        Icons.person,
                                        size: 40,
                                        color: whiteColor,
                                      ),
                              ),
                              const SizedBox(height: 16),
                              
                              // Main Title
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: whiteColor,
                                    height: 1.2,
                                  ),
                                  children: [
                                    TextSpan(text: 'Ažurirajte '),
                                    TextSpan(
                                      text: 'podatke',
                                      style: handwrittenStyle,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              
                              // Subtitle
                              Text(
                                'Održite svoje lične informacije ažurnim i tačnim.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: whiteColor.withOpacity(0.9),
                                  height: 1.4,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        
                        // Rounded bottom edge for modern look
                        Container(
                          height: 20,
                          decoration: const BoxDecoration(
                            color: lightColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Profile Form
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      // Profile Information Card
                      _buildProfileCard(),
                      const SizedBox(height: 24),
                    ]),
                  ),
                ),
              ],
            ),
            _ => Center(
              child: Text(
                'Niste prijavljeni',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
            ),
          };
        },
        loading: () => Container(
          color: lightColor,
          child: const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
              strokeWidth: 3,
            ),
          ),
        ),
        error: (error, stack) => Center(
          child: Text(
            'Greška pri učitavanju profila',
            style: TextStyle(
              fontSize: 18,
              color: Colors.red[600],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    // EXACT same colors as other screens
    const Color primaryColor = Color(0xFFf08a6e);
    const Color secondaryColor = Color(0xFF2c3e50);
    const Color whiteColor = Colors.white;

    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.person_outline,
                      color: primaryColor,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Lični podaci',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: secondaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              
              // First Name and Last Name Row
              Row(
                children: [
                  Expanded(
                    child: _buildTextFormField(
                      controller: _firstNameController,
                      label: 'Ime',
                      icon: Icons.person_outline,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ime je obavezno';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildTextFormField(
                      controller: _lastNameController,
                      label: 'Prezime',
                      icon: Icons.person_outline,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Prezime je obavezno';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Username and Email Row
              Row(
                children: [
                  Expanded(
                    child: _buildTextFormField(
                      controller: _usernameController,
                      label: 'Korisničko ime',
                      icon: Icons.alternate_email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Korisničko ime je obavezno';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildTextFormField(
                      controller: _emailController,
                      label: 'Email',
                      icon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email je obavezan';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                          return 'Unesite validan email';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Phone and City Row
              Row(
                children: [
                  Expanded(
                    child: _buildTextFormField(
                      controller: _phoneController,
                      label: 'Telefon',
                      icon: Icons.phone_outlined,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildTextFormField(
                      controller: _cityController,
                      label: 'Grad',
                      icon: Icons.location_city_outlined,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Address and Postal Code Row
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: _buildTextFormField(
                      controller: _addressController,
                      label: 'Adresa',
                      icon: Icons.home_outlined,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildTextFormField(
                      controller: _postalCodeController,
                      label: 'Poštanski broj',
                      icon: Icons.markunread_mailbox_outlined,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              
              // Update Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _isUpdatingProfile ? null : _updateProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: whiteColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  icon: _isUpdatingProfile
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: whiteColor,
                            strokeWidth: 2,
                          ),
                        )
                      : const Icon(Icons.save, size: 20),
                  label: Text(
                    _isUpdatingProfile ? 'Ažuriranje...' : 'Ažuriraj podatke',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    // EXACT same colors as other screens
    const Color primaryColor = Color(0xFFf08a6e);
    const Color secondaryColor = Color(0xFF2c3e50);

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      style: const TextStyle(
        fontSize: 16,
        color: secondaryColor,
      ),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: primaryColor),
        labelStyle: TextStyle(
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
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[50],
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      ),
    );
  }

  Future<void> _updateProfile() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isUpdatingProfile = true;
    });

    try {
      // Mock API call - replace with actual implementation
      await Future.delayed(const Duration(seconds: 2));
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Podaci su uspešno ažurirani'),
            backgroundColor: Color(0xFFf08a6e),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Greška pri ažuriranju: $e'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isUpdatingProfile = false;
        });
      }
    }
  }
} 
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvp_fe/features/auth/presentation/providers/auth_provider.dart';
import 'package:mvp_fe/features/auth/domain/models/auth_state.dart';

class SettingsPasswordScreen extends ConsumerStatefulWidget {
  const SettingsPasswordScreen({super.key});

  @override
  ConsumerState<SettingsPasswordScreen> createState() => _SettingsPasswordScreenState();
}

class _SettingsPasswordScreenState extends ConsumerState<SettingsPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Password controllers
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isChangingPassword = false;
  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
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
          'Promena lozinke',
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
                              // Security Icon
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: whiteColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(color: whiteColor, width: 3),
                                ),
                                child: Icon(
                                  Icons.security,
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
                                    TextSpan(text: 'Promenite '),
                                    TextSpan(
                                      text: 'lozinku',
                                      style: handwrittenStyle,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              
                              // Subtitle
                              Text(
                                'Zaštitite svoj nalog ažuriranjem lozinke. Koristite jaku lozinku za maksimalnu bezbednost.',
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
                
                // Password Form
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      // Password Change Card
                      _buildPasswordCard(),
                      const SizedBox(height: 16),
                      
                      // Security Tips Card
                      _buildSecurityTipsCard(),
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

  Widget _buildPasswordCard() {
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
                      Icons.lock_outline,
                      color: primaryColor,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Promena lozinke',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: secondaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              
              // Current Password
              _buildPasswordField(
                controller: _currentPasswordController,
                label: 'Trenutna lozinka',
                icon: Icons.lock_outlined,
                obscureText: _obscureCurrentPassword,
                onToggleVisibility: () {
                  setState(() {
                    _obscureCurrentPassword = !_obscureCurrentPassword;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Trenutna lozinka je obavezna';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              // New Password
              _buildPasswordField(
                controller: _newPasswordController,
                label: 'Nova lozinka',
                icon: Icons.lock_reset_outlined,
                obscureText: _obscureNewPassword,
                onToggleVisibility: () {
                  setState(() {
                    _obscureNewPassword = !_obscureNewPassword;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nova lozinka je obavezna';
                  }
                  if (value.length < 8) {
                    return 'Lozinka mora imati najmanje 8 karaktera';
                  }
                  if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)').hasMatch(value)) {
                    return 'Lozinka mora sadržati mala i velika slova i brojeve';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              // Confirm New Password
              _buildPasswordField(
                controller: _confirmPasswordController,
                label: 'Potvrdite novu lozinku',
                icon: Icons.lock_clock_outlined,
                obscureText: _obscureConfirmPassword,
                onToggleVisibility: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Potvrda lozinke je obavezna';
                  }
                  if (value != _newPasswordController.text) {
                    return 'Lozinke se ne poklapaju';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              
              // Change Password Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _isChangingPassword ? null : _changePassword,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: whiteColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  icon: _isChangingPassword
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: whiteColor,
                            strokeWidth: 2,
                          ),
                        )
                      : const Icon(Icons.security, size: 20),
                  label: Text(
                    _isChangingPassword ? 'Mijenjanje...' : 'Promeni lozinku',
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

  Widget _buildSecurityTipsCard() {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.tips_and_updates_outlined,
                    color: Colors.blue[600],
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Saveti za bezbednost',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            _buildSecurityTip('Koristite najmanje 8 karaktera', Icons.check_circle_outline),
            _buildSecurityTip('Kombinujte velika i mala slova', Icons.check_circle_outline),
            _buildSecurityTip('Uključite brojeve i simbole', Icons.check_circle_outline),
            _buildSecurityTip('Izbegavajte lične informacije', Icons.check_circle_outline),
            _buildSecurityTip('Ne koristite istu lozinku za sve servise', Icons.check_circle_outline),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityTip(String tip, IconData icon) {
    const Color primaryColor = Color(0xFFf08a6e);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: primaryColor,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              tip,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required bool obscureText,
    required VoidCallback onToggleVisibility,
    String? Function(String?)? validator,
  }) {
    // EXACT same colors as other screens
    const Color primaryColor = Color(0xFFf08a6e);
    const Color secondaryColor = Color(0xFF2c3e50);

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      style: const TextStyle(
        fontSize: 16,
        color: secondaryColor,
      ),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: primaryColor),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey[600],
          ),
          onPressed: onToggleVisibility,
        ),
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

  Future<void> _changePassword() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isChangingPassword = true;
    });

    try {
      // Mock API call - replace with actual implementation
      await Future.delayed(const Duration(seconds: 2));
      
      if (mounted) {
        // Clear the form
        _currentPasswordController.clear();
        _newPasswordController.clear();
        _confirmPasswordController.clear();
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Lozinka je uspešno promenjena'),
            backgroundColor: Color(0xFFf08a6e),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Greška pri promeni lozinke: $e'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isChangingPassword = false;
        });
      }
    }
  }
} 
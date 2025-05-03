import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mvp_fe/features/auth/presentation/providers/auth_provider.dart';
import 'package:mvp_fe/features/auth/domain/models/auth_state.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: Image.asset(
                'img/logo.png',
                width: 40,
                height: 40,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.business_rounded,
                  size: 24,
                  color: whiteColor,
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Podešavanja',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: whiteColor,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: whiteColor),
            onPressed: () => _showLogoutDialog(context, ref),
          ),
        ],
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
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: whiteColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(color: whiteColor, width: 3),
                                ),
                                child: user.avatarUrl != null && user.avatarUrl!.isNotEmpty
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.network(
                                          user.avatarUrl!,
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) => Icon(
                                            Icons.person,
                                            size: 50,
                                            color: whiteColor,
                                          ),
                                        ),
                                      )
                                    : Icon(
                                        Icons.person,
                                        size: 50,
                                        color: whiteColor,
                                      ),
                              ),
                              const SizedBox(height: 16),
                              
                              // User Name
                              Text(
                                '${user.firstName} ${user.lastName}',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: whiteColor,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '@${user.username}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: whiteColor.withOpacity(0.8),
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
                                    TextSpan(text: 'Upravljajte '),
                                    TextSpan(
                                      text: 'profilom',
                                      style: handwrittenStyle,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              
                              // Subtitle
                              Text(
                                'Pristupite postavkama i funkcijama vašeg profila.',
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
                
                // Settings Menu
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      // Leaderboard Card
                      _buildMenuCard(
                        context,
                        title: 'Rang lista',
                        subtitle: 'Pogledajte rangiranje volontera u zajednici',
                        icon: Icons.leaderboard_outlined,
                        color: Colors.amber[600]!,
                        onTap: () => context.push('/settings/leaderboard'),
                      ),
                      const SizedBox(height: 16),
                      
                      // Profile Settings Card
                      _buildMenuCard(
                        context,
                        title: 'Lični podaci',
                        subtitle: 'Ažurirajte svoje lične informacije',
                        icon: Icons.person_outline,
                        color: primaryColor,
                        onTap: () => context.push('/settings/profile'),
                      ),
                      const SizedBox(height: 16),
                      
                      // Password Settings Card
                      _buildMenuCard(
                        context,
                        title: 'Promena lozinke',
                        subtitle: 'Ažurirajte svoju lozinku za bezbednost',
                        icon: Icons.lock_outline,
                        color: Colors.blue[600]!,
                        onTap: () => context.push('/settings/password'),
                      ),
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

  Widget _buildMenuCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    // EXACT same colors as other screens
    const Color whiteColor = Colors.white;
    const Color secondaryColor = Color(0xFF2c3e50);

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
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              // Icon Container
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 28,
                ),
              ),
              const SizedBox(width: 20),
              
              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: secondaryColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Arrow Icon
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[400],
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, WidgetRef ref) {
    const Color primaryColor = Color(0xFFf08a6e);
    const Color whiteColor = Colors.white;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Odjavljivanje',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          content: const Text(
            'Da li ste sigurni da se želite odjaviti?',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Otkaži',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                ref.read(authProvider.notifier).logout();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Odjavi se',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        );
      },
    );
  }
} 
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvp_fe/features/home/presentation/providers/dashboard_provider.dart'; // Import dashboard provider
import 'package:mvp_fe/features/projects/presentation/widgets/project_card.dart'; // Import shared ProjectCard

import '../providers/project_provider.dart'; // Import all projects provider

class MyProjectsScreen extends ConsumerWidget {
  const MyProjectsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch both providers
    final dashboardDataAsync = ref.watch(dashboardDataProvider);
    final allProjectsAsync = ref.watch(projectsProvider);

    // EXACT same colors as other screens
    const Color primaryColor = Color(0xFFf08a6e); // --primary
    const Color secondaryColor = Color(0xFF2c3e50); // --secondary
    const Color lightColor = Color(0xFFf9f7f4); // --light
    const Color whiteColor = Colors.white;

    // Serbian handwritten style
    const TextStyle handwrittenStyle = TextStyle(
      fontFamily: 'Caveat',
      color: primaryColor,
      fontSize: 32,
      fontWeight: FontWeight.w700,
      height: 1.2,
    );

    Future<void> refreshData() async {
      // Invalidate both providers on refresh
      ref.invalidate(dashboardDataProvider);
      ref.invalidate(projectsProvider);
      // Allow time for invalidation to propagate before rebuild
      await Future.delayed(const Duration(milliseconds: 50));
    }

    return Scaffold(
      backgroundColor: lightColor, // Consistent background
      appBar: AppBar(
        backgroundColor: secondaryColor, // Consistent with other screens
        elevation: 0,
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: Image.asset(
                'img/logo.png', // Same logo path as other screens
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
              'Moji projekti',
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
            icon: const Icon(Icons.refresh, color: whiteColor),
            onPressed: refreshData,
          ),
        ],
      ),
      body: dashboardDataAsync.when(
        data: (dashboardData) {
          // Dashboard data loaded, now check projects data
          return allProjectsAsync.when(
            data: (allProjects) {
              // Both loaded successfully, filter and display
              final myProjectIds =
                  dashboardData.volunteering.active
                      .map((status) => status.projectId)
                      .toSet();
              final myProjects =
                  allProjects
                      .where((project) => myProjectIds.contains(project.id))
                      .toList();

              return CustomScrollView(
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
                                // Main Title
                                Row(
                                  children: [
                                    Expanded(
                                      child: RichText(
                                        text: const TextSpan(
                                          style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                            color: whiteColor,
                                            height: 1.2,
                                          ),
                                          children: [
                                            TextSpan(text: 'Vaši '),
                                            TextSpan(
                                              text: 'projekti',
                                              style: handwrittenStyle,
                                            ),
                                            TextSpan(text: '\nu fokusu'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                
                                // Subtitle
                                Text(
                                  'Pratite napredak svojih projekata i ostanite u koraku sa aktivnostima u zajednici.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: whiteColor.withOpacity(0.9),
                                    height: 1.4,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                
                                // Stats Row
                                if (myProjects.isNotEmpty) ...[
                                  Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: whiteColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: whiteColor.withOpacity(0.2),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: _buildStatItem(
                                            context,
                                            'Aktivni projekti',
                                            myProjects.length.toString(),
                                            Icons.assignment_turned_in_outlined,
                                          ),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 40,
                                          color: whiteColor.withOpacity(0.3),
                                        ),
                                        Expanded(
                                          child: _buildStatItem(
                                            context,
                                            'Ukupni poeni',
                                            myProjects.fold<int>(0, (sum, p) => sum + p.pointsEarned).toString(),
                                            Icons.star_outline,
                                          ),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 40,
                                          color: whiteColor.withOpacity(0.3),
                                        ),
                                        Expanded(
                                          child: _buildStatItem(
                                            context,
                                            'Status',
                                            'Volonter',
                                            Icons.volunteer_activism_outlined,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
                  
                  // Projects List
                  if (myProjects.isEmpty)
                    SliverFillRemaining(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(
                                  Icons.assignment_outlined,
                                  size: 64,
                                  color: primaryColor.withOpacity(0.6),
                                ),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                'Niste se pridružili nijednom projektu',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[700],
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Istražite dostupne projekte i pridružite se onima koji vas zanimaju!',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                  height: 1.4,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 32),
                              ElevatedButton.icon(
                                onPressed: refreshData,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  foregroundColor: whiteColor,
                                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 2,
                                ),
                                icon: const Icon(Icons.refresh, size: 20),
                                label: const Text(
                                  'Osvežite listu',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  else
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final project = myProjects[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: MyProjectCard(project: project),
                            );
                          },
                          childCount: myProjects.length,
                        ),
                      ),
                    ),
                ],
              );
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
            error: (error, stack) => _buildErrorWidget(context, error, refreshData),
          );
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
        error: (error, stack) => _buildErrorWidget(context, error, refreshData),
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String label, String value, IconData icon) {
    const Color whiteColor = Colors.white;
    
    return Column(
      children: [
        Icon(
          icon,
          color: whiteColor.withOpacity(0.9),
          size: 24,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: whiteColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: whiteColor.withOpacity(0.8),
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildErrorWidget(
    BuildContext context,
    Object error,
    Future<void> Function() onRetry,
  ) {
    const Color primaryColor = Color(0xFFf08a6e);
    const Color lightColor = Color(0xFFf9f7f4);
    const Color whiteColor = Colors.white;

    return Container(
      color: lightColor,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  border: Border.all(color: Colors.red.shade200),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Colors.red.shade600,
                      size: 56,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Greška pri učitavanju',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.red.shade700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Došlo je do greške prilikom učitavanja vaših projekata.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red.shade600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      error.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.red.shade500,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: whiteColor,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                icon: const Icon(Icons.refresh, size: 20),
                label: const Text(
                  'Pokušajte ponovo',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Enhanced project card for "My Projects" with additional status info
class MyProjectCard extends StatelessWidget {
  final dynamic project; // Using dynamic to match the original implementation

  const MyProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
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
      child: Column(
        children: [
          // Status Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: primaryColor,
                  size: 20,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Aktivno učešće',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.green.withOpacity(0.3)),
                  ),
                  child: const Text(
                    'Volonter',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Main Card Content
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ProjectCard(project: project), // Use the existing ProjectCard
          ),
        ],
      ),
    );
  }
}

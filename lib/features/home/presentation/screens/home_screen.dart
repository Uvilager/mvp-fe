import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mvp_fe/features/auth/presentation/providers/auth_provider.dart';
import 'package:mvp_fe/features/auth/domain/models/auth_state.dart';
import '../providers/dashboard_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final dashboardDataAsync = ref.watch(dashboardDataProvider);
    
    // Debug: Add basic logging
    print('HomeScreen build - Auth: ${authState.runtimeType}, Dashboard: ${dashboardDataAsync.runtimeType}');
    


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
      ref.invalidate(dashboardDataProvider);
      await Future.delayed(const Duration(milliseconds: 50));
    }

    return Scaffold(
      backgroundColor: lightColor,
      body: dashboardDataAsync.when(
        data: (dashboardData) => CustomScrollView(
          slivers: [
            // Hero App Bar with Welcome Message
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              backgroundColor: secondaryColor,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
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
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 60, 24, 20),
                      child: authState.when(
                        data: (state) => switch (state) {
                          Authenticated(:final user) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: primaryColor.withOpacity(0.2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.person,
                                      color: whiteColor,
                                      size: 28,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Dobrodošli,',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: whiteColor.withOpacity(0.9),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '${user.firstName} ${user.lastName}',
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: whiteColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.refresh, color: whiteColor),
                                    onPressed: refreshData,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: whiteColor,
                                    height: 1.3,
                                  ),
                                  children: [
                                    const TextSpan(text: 'Spremni za nove '),
                                    TextSpan(
                                      text: 'izazove',
                                      style: handwrittenStyle.copyWith(
                                        fontSize: 24,
                                        color: whiteColor,
                                      ),
                                    ),
                                    const TextSpan(text: '?'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          _ => const Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(whiteColor),
                              strokeWidth: 2,
                            ),
                          ),
                        },
                        loading: () => const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(whiteColor),
                            strokeWidth: 2,
                          ),
                        ),
                        error: (e, s) => Center(
                          child: Text(
                            'Greška pri učitavanju',
                            style: TextStyle(color: whiteColor.withOpacity(0.8)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Quick Stats Section
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
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
                child: Row(
                  children: [
                    Expanded(
                      child: _buildQuickStat(
                        context,
                        'Aktivni projekti',
                        dashboardData.volunteering.active.length.toString(),
                        Icons.assignment_turned_in_outlined,
                        Colors.green,
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 40,
                      color: Colors.grey[300],
                    ),
                    Expanded(
                      child: _buildQuickStat(
                        context,
                        'Liderstvo',
                        dashboardData.leading.length.toString(),
                        Icons.leaderboard_outlined,
                        primaryColor,
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 40,
                      color: Colors.grey[300],
                    ),
                    Expanded(
                      child: _buildQuickStat(
                        context,
                        'Ukupni poeni',
                        '0', // TODO: Add points to UserResource
                        Icons.star_outline,
                        Colors.amber[700]!,
                      ),
                    ),
                  ],
                ),
              ),
            ),

                         // My Active Projects Section
             if (dashboardData.volunteering.active.isNotEmpty) ...[
               SliverToBoxAdapter(
                 child: Padding(
                   padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                   child: Row(
                     children: [
                       Icon(
                         Icons.volunteer_activism,
                         color: primaryColor,
                         size: 24,
                       ),
                       const SizedBox(width: 12),
                       const Text(
                         'Moji aktivni projekti',
                         style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.w700,
                           color: secondaryColor,
                         ),
                       ),
                       const Spacer(),
                       TextButton(
                         onPressed: () => context.push('/my-projects'),
                         child: const Text('Vidi sve'),
                       ),
                     ],
                   ),
                 ),
               ),
               SliverToBoxAdapter(
                 child: SizedBox(
                   height: 200,
                   child: ListView.builder(
                     scrollDirection: Axis.horizontal,
                     padding: const EdgeInsets.symmetric(horizontal: 16),
                     itemCount: dashboardData.volunteering.active.length,
                     itemBuilder: (context, index) {
                       final volunteer = dashboardData.volunteering.active[index];
                       final project = volunteer.project;
                       
                       return Container(
                         width: 280,
                         margin: const EdgeInsets.only(right: 16),
                         child: _buildMyProjectCard(context, project, primaryColor, whiteColor),
                       );
                     },
                   ),
                 ),
               ),
             ],

                         // My Leading Projects Section
             if (dashboardData.leading.isNotEmpty) ...[
               SliverToBoxAdapter(
                 child: Padding(
                   padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                   child: Row(
                     children: [
                       Icon(
                         Icons.leaderboard,
                         color: Colors.purple,
                         size: 24,
                       ),
                       const SizedBox(width: 12),
                       const Text(
                         'Projekti koje vodim',
                         style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.w700,
                           color: secondaryColor,
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
               SliverToBoxAdapter(
                 child: SizedBox(
                   height: 200,
                   child: ListView.builder(
                     scrollDirection: Axis.horizontal,
                     padding: const EdgeInsets.symmetric(horizontal: 16),
                     itemCount: dashboardData.leading.length,
                     itemBuilder: (context, index) {
                       final leaderData = dashboardData.leading[index] as Map<String, dynamic>;
                       final projectId = leaderData['project_id'] as int?;
                       
                       if (projectId == null) return const SizedBox.shrink();
                       
                       // Find the corresponding project from the projects list
                       final project = dashboardData.projects.where(
                         (p) => p.id == projectId,
                       ).firstOrNull;
                       
                       if (project == null) return const SizedBox.shrink();
                       
                       return Container(
                         width: 280,
                         margin: const EdgeInsets.only(right: 16),
                         child: _buildLeaderProjectCard(context, project, Colors.purple, whiteColor),
                       );
                     },
                   ),
                 ),
               ),
             ],

            // Latest Projects Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                child: Row(
                  children: [
                    Icon(
                      Icons.new_releases_outlined,
                      color: Colors.blue,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Najnoviji projekti',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: secondaryColor,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () => context.push('/projects'),
                      child: const Text('Vidi sve'),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: dashboardData.projects.length,
                  itemBuilder: (context, index) {
                    final project = dashboardData.projects[index];
                    return Container(
                      width: 300,
                      margin: const EdgeInsets.only(right: 16),
                      child: _buildLatestProjectCard(context, project, Colors.blue, whiteColor),
                    );
                  },
                ),
              ),
            ),

            // Call to Action Section
            if (dashboardData.volunteering.active.isEmpty && dashboardData.leading.isEmpty) ...[
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        primaryColor.withOpacity(0.1),
                        primaryColor.withOpacity(0.05),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: primaryColor.withOpacity(0.2)),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.volunteer_activism,
                        size: 64,
                        color: primaryColor.withOpacity(0.7),
                      ),
                      const SizedBox(height: 16),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: secondaryColor,
                            height: 1.3,
                          ),
                          children: [
                            TextSpan(text: 'Spremni da '),
                            TextSpan(
                              text: 'promenite',
                              style: handwrittenStyle,
                            ),
                            TextSpan(text: ' svoju zajednicu?'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Pridružite se projektima koji čine razliku i steknite dragoceno iskustvo dok pomažete drugima.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () => context.push('/projects'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            foregroundColor: whiteColor,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 2,
                          ),
                          icon: const Icon(Icons.explore, size: 20),
                          label: const Text(
                            'Istražite projekte',
                            style: TextStyle(
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
            ],

            // Bottom spacing
            const SliverToBoxAdapter(
              child: SizedBox(height: 24),
            ),
          ],
        ),
        loading: () => Container(
          color: lightColor,
          child: const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
              strokeWidth: 3,
            ),
          ),
        ),
        error: (error, stack) => Container(
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
                          error.toString().contains('401') || error.toString().contains('Unauthorized')
                            ? 'Molimo prijavite se ponovo.'
                            : 'Došlo je do greške prilikom učitavanja početne stranice.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.red.shade600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                          'Pokušajte ponovo',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      if (error.toString().contains('401') || error.toString().contains('Unauthorized')) ...[
                        const SizedBox(width: 16),
                        ElevatedButton.icon(
                          onPressed: () => context.go('/login'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: whiteColor,
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 2,
                          ),
                          icon: const Icon(Icons.login, size: 20),
                          label: const Text(
                            'Prijavite se',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickStat(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
          size: 24,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildMyProjectCard(
    BuildContext context,
    dynamic project,
    Color primaryColor,
    Color whiteColor,
  ) {
    final dateFormat = DateFormat('dd.MM.yyyy');
    
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
        onTap: () => context.push('/volunteer-project/${project.id}'),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
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
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey[400],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                project.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2c3e50),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                project.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  height: 1.3,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 14,
                    color: Colors.grey[500],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    dateFormat.format(project.endDate),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${project.pointsEarned} poena',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeaderProjectCard(
    BuildContext context,
    dynamic project,
    Color color,
    Color whiteColor,
  ) {
    final dateFormat = DateFormat('dd.MM.yyyy');
    
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
        onTap: () => context.push('/volunteer-project/${project.id}'),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: color.withOpacity(0.3)),
                    ),
                    child: Text(
                      'Lider',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey[400],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                project.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2c3e50),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                project.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  height: 1.3,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 14,
                    color: Colors.grey[500],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    dateFormat.format(project.endDate),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${project.pointsEarned} poena',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLatestProjectCard(
    BuildContext context,
    dynamic project,
    Color color,
    Color whiteColor,
  ) {
    final daysRemaining = project.endDate.difference(DateTime.now()).inDays;
    
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
        onTap: () => context.push('/projects/${project.id}'),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: color.withOpacity(0.3)),
                    ),
                    child: Text(
                      'Novo',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey[400],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                project.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2c3e50),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                project.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  height: 1.3,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.group_outlined,
                    size: 14,
                    color: Colors.grey[500],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${project.minUsers}-${project.maxUsers}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Icon(
                    Icons.timelapse,
                    size: 14,
                    color: daysRemaining > 7 ? Colors.green : Colors.orange,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    daysRemaining > 0 ? '$daysRemaining dana' : 'Završen',
                    style: TextStyle(
                      fontSize: 12,
                      color: daysRemaining > 7 ? Colors.green : Colors.orange,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

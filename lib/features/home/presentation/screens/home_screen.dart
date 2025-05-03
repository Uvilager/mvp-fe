import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mvp_fe/features/auth/domain/models/auth_state.dart';
import 'package:mvp_fe/features/auth/presentation/providers/auth_provider.dart';
import 'package:mvp_fe/core/screens/main_screen.dart'; // Import for selectedIndexProvider

// Import the home widgets (previously dashboard widgets)
import 'home/widgets/stat_column.dart';
import 'home/widgets/action_card.dart';
import 'home/widgets/achievement_card.dart';

// Renamed DashboardPage content to HomeScreen
class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  // Mock data (adapted from generated code) - TODO: Replace with real data fetching
  final Map<String, dynamic> mockStats = {
    'volunteeredHours': 48,
    'projectsJoined': 7,
    'projectsLed': 2,
  };

  final List<Map<String, dynamic>> mockAchievements = [
    {
      'title': 'First Project',
      'description': 'Joined your first volunteer project',
      'icon': Icons.emoji_events,
      'date': 'Jan 15, 2025',
      'completed': true,
    },
    {
      'title': 'Team Leader',
      'description': 'Led your first volunteer project',
      'icon': Icons.people,
      'date': 'Mar 22, 2025',
      'completed': true,
    },
    {
      'title': '50 Hours',
      'description': 'Volunteered for 50 hours',
      'icon': Icons.access_time,
      'date': 'In progress',
      'completed': false,
      'progress': 0.96, // 48/50 hours
    },
    {
      'title': 'Community Helper',
      'description': 'Participated in 5 different projects',
      'icon': Icons.handshake,
      'date': 'In progress',
      'completed': false,
      'progress': 0.8, // Example: 4/5 projects
    },
  ];
  // --- End Mock Data ---

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      // Use the AppBar title 'Home'
      appBar: AppBar(
        title: const Text('Home'),
        // Keep the settings icon action from the dashboard design
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              // Navigate to the Settings screen
              context.push('/settings');
            },
          ),
          // Optional: Add back the logout button if desired on Home screen
          // IconButton(
          //   icon: const Icon(Icons.logout),
          //   onPressed: () async {
          //     await ref.read(authProvider.notifier).logout();
          //   },
          // ),
        ],
      ),
      // Use SingleChildScrollView from the dashboard design
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Profile Card Section (from dashboard design)
            authState.when(
              data: (state) {
                if (state is Authenticated) {
                  final user = state.user;
                  final userAvatarUrl = user.avatarUrl ?? '';
                  final userName = '${user.firstName} ${user.lastName}';
                  final userEmail = user.email;
                  final initials =
                      (user.firstName.isNotEmpty ? user.firstName[0] : '') +
                      (user.lastName.isNotEmpty ? user.lastName[0] : '');

                  return Card(
                    elevation: 2,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    userAvatarUrl.isNotEmpty
                                        ? NetworkImage(userAvatarUrl)
                                        : null,
                                onBackgroundImageError:
                                    (e, s) => print('Avatar Error: $e'),
                                backgroundColor:
                                    userAvatarUrl.isEmpty
                                        ? Theme.of(
                                          context,
                                        ).colorScheme.primaryContainer
                                        : null,
                                child:
                                    userAvatarUrl.isEmpty
                                        ? Text(
                                          initials,
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                        : null,
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userName,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      userEmail,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    // TODO: Add Rank/Points row when data is available
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          // Stats Row - Using Mock Data
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              StatColumn(
                                value: '${mockStats['volunteeredHours']}',
                                label: 'Hours',
                                icon: Icons.access_time,
                                iconColor: Colors.orange,
                              ),
                              StatColumn(
                                value: '${mockStats['projectsJoined']}',
                                label: 'Projects',
                                icon: Icons.assignment,
                                iconColor: Colors.blue,
                              ),
                              StatColumn(
                                value: '${mockStats['projectsLed']}',
                                label: 'Led',
                                icon: Icons.people,
                                iconColor: Colors.purple,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const Center(child: Text('User not authenticated.'));
                }
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error:
                  (e, s) => Center(child: Text('Error loading user data: $e')),
            ),
            const SizedBox(height: 24),

            // Quick Actions Section (from dashboard design)
            const Text(
              'Quick Actions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ActionCard(
                    title: 'My Projects',
                    icon: Icons.assignment_outlined,
                    backgroundColor: Colors.blue[100]!,
                    iconColor: Colors.blue[700]!,
                    onTap: () {
                      // Navigate to the My Projects route
                      GoRouter.of(context).go('/my-projects');
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ActionCard(
                    title: 'Find Projects',
                    icon: Icons.search_outlined,
                    backgroundColor: Colors.green[100]!,
                    iconColor: Colors.green[700]!,
                    onTap: () {
                      // Navigate to the Projects route
                      GoRouter.of(context).go('/projects');
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ActionCard(
                    title: 'Leaderboard',
                    icon: Icons.leaderboard_outlined,
                    backgroundColor: Colors.amber[100]!,
                    iconColor: Colors.amber[700]!,
                    onTap: () {
                      GoRouter.of(context).push('/leaderboard');
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ActionCard(
                    title: 'News',
                    icon: Icons.article_outlined,
                    backgroundColor: Colors.purple[100]!,
                    iconColor: Colors.purple[700]!,
                    onTap: () {
                      // TODO: Navigate to News Page (using GoRouter)
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Navigate to News (Not Implemented)'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Achievements Section (from dashboard design)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Achievements',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Navigate to full Achievements Page (using GoRouter)
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Navigate to All Achievements (Not Implemented)',
                        ),
                      ),
                    );
                  },
                  child: const Text('See All'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...mockAchievements.map(
              (achievement) => AchievementCard(achievement: achievement),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      // Remove the FloatingActionButton unless needed for the new Home design
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}

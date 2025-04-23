import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod if needed for state later

// Import the new widgets
import 'package:mvp_fe/features/leaderboard/presentation/widgets/podium_item.dart';
import 'package:mvp_fe/features/leaderboard/presentation/widgets/leaderboard_tile.dart';

// TODO: Define a provider to fetch actual leaderboard data
// final leaderboardProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
//   // Replace with actual API call
//   await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
//   return _mockLeaderboardData;
// });

// Using mock data directly for now, same as the example file
const List<Map<String, dynamic>> _mockLeaderboardData = [
  {
    'rank': 1,
    'name': 'Michael Johnson',
    'hours': 87,
    'projects': 12,
    'points': 2450,
    'image': '', // Placeholder - Use real URLs later
  },
  {
    'rank': 2,
    'name': 'Emily Chen',
    'hours': 76,
    'projects': 10,
    'points': 2180,
    'image': '',
  },
  {
    'rank': 3,
    'name': 'David Wilson',
    'hours': 68,
    'projects': 9,
    'points': 1950,
    'image': '',
  },
  {
    'rank': 4,
    'name': 'Sarah Miller',
    'hours': 62,
    'projects': 8,
    'points': 1780,
    'image': '',
  },
  {
    'rank': 5,
    'name': 'Robert Brown',
    'hours': 58,
    'projects': 7,
    'points': 1650,
    'image': '',
  },
  {
    'rank': 6,
    'name': 'Jennifer Lee',
    'hours': 54,
    'projects': 8,
    'points': 1580,
    'image': '',
  },
  {
    'rank': 7,
    'name': 'Thomas Garcia',
    'hours': 52,
    'projects': 7,
    'points': 1520,
    'image': '',
  },
  {
    'rank': 8,
    'name': 'Lisa Martinez',
    'hours': 50,
    'projects': 6,
    'points': 1450,
    'image': '',
  },
  {
    'rank': 9,
    'name': 'Daniel Taylor',
    'hours': 49,
    'projects': 7,
    'points': 1420,
    'image': '',
  },
  {
    'rank': 10,
    'name': 'Amanda White',
    'hours': 47,
    'projects': 6,
    'points': 1380,
    'image': '',
  },
  {
    'rank': 11,
    'name': 'Kevin Harris',
    'hours': 45,
    'projects': 6,
    'points': 1320,
    'image': '',
  },
  {
    'rank': 12,
    'name': 'Nikola Tesla (You)', // Example current user
    'hours': 48,
    'projects': 7,
    'points': 1250,
    'image': '',
    'isCurrentUser': true, // Mark the current user
  },
];

class LeaderboardScreen extends ConsumerWidget {
  // Changed to ConsumerWidget
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Replace mock data with provider state
    // final leaderboardState = ref.watch(leaderboardProvider);
    final leaderboardData = _mockLeaderboardData; // Use mock data for now

    // Ensure there's enough data for the podium
    final bool hasPodiumData = leaderboardData.length >= 3;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Monthly Leaderboard'),
        // Consider adding filtering/sorting options later
      ),
      body: RefreshIndicator(
        // Add pull-to-refresh
        onRefresh: () async {
          // TODO: Implement data refresh logic using the provider
          // ref.invalidate(leaderboardProvider);
          print("Refresh leaderboard"); // Placeholder action
        },
        child: Column(
          children: [
            // Top 3 Podium Section
            if (hasPodiumData)
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
                color: Theme.of(
                  context,
                ).colorScheme.primaryContainer.withOpacity(0.3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // 2nd Place
                    PodiumItem(user: leaderboardData[1], position: 2),
                    // 1st Place
                    PodiumItem(user: leaderboardData[0], position: 1),
                    // 3rd Place
                    PodiumItem(user: leaderboardData[2], position: 3),
                  ],
                ),
              )
            else // Show a message if not enough data for podium
              Container(
                padding: const EdgeInsets.all(16),
                color: Theme.of(
                  context,
                ).colorScheme.primaryContainer.withOpacity(0.3),
                child: const Center(
                  child: Text("Not enough participants for podium yet!"),
                ),
              ),

            // Leaderboard List Section
            Expanded(
              // Use ListView.separated for dividers
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: leaderboardData.length,
                itemBuilder: (context, index) {
                  final user = leaderboardData[index];
                  // Determine if this entry represents the current user
                  // TODO: Replace mock 'isCurrentUser' check with actual user ID comparison
                  final isCurrentUser = user['isCurrentUser'] ?? false;

                  return LeaderboardTile(
                    user: user,
                    isCurrentUser: isCurrentUser,
                  );
                },
                separatorBuilder:
                    (context, index) =>
                        const Divider(height: 1, indent: 16, endIndent: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvp_fe/features/home/presentation/providers/dashboard_provider.dart';

class SettingsLeaderboardScreen extends ConsumerWidget {
  const SettingsLeaderboardScreen({super.key});

  int _safeInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is String) return int.tryParse(value) ?? 0;
    if (value is double) return value.toInt();
    return 0;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardDataAsync = ref.watch(dashboardDataProvider);

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
          'Rang lista',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: whiteColor,
          ),
        ),
      ),
      body: dashboardDataAsync.when(
        data: (dashboardData) {
          final leaderboardData = dashboardData.leaderboard;

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
                                        TextSpan(text: 'Rangiranje '),
                                        TextSpan(
                                          text: 'volontera',
                                          style: handwrittenStyle,
                                        ),
                                        TextSpan(text: '\nu zajednici'),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            
                            // Subtitle
                            Text(
                              'Pratite najaktivnije volontere i njihov doprinos u projektima zajednice.',
                              style: TextStyle(
                                fontSize: 16,
                                color: whiteColor.withOpacity(0.9),
                                height: 1.4,
                              ),
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
              
              // Leaderboard List
              if (leaderboardData?.isEmpty ?? true)
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
                              Icons.leaderboard_outlined,
                              size: 64,
                              color: primaryColor.withOpacity(0.6),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Nema podataka o rangiranju',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Trenutno nema dostupnih podataka o rangiranju volontera.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
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
                        final entry = leaderboardData![index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: _buildLeaderboardCard(context, entry, index + 1),
                        );
                      },
                      childCount: leaderboardData!.length,
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
                          'Došlo je do greške prilikom učitavanja rang liste.',
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
                  ElevatedButton.icon(
                    onPressed: () => ref.invalidate(dashboardDataProvider),
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
        ),
      ),
    );
  }

  Widget _buildLeaderboardCard(BuildContext context, dynamic entry, int rank) {
    // EXACT same colors as other screens
    const Color primaryColor = Color(0xFFf08a6e);
    const Color secondaryColor = Color(0xFF2c3e50);
    const Color whiteColor = Colors.white;

    // Handle both Map and object types, with safer type conversion
    String name = 'Unknown User';
    int points = 0;
    int projects = 0;
    int hours = 0;

    if (entry is Map<String, dynamic>) {
      name = entry['name']?.toString() ?? 'Unknown User';
      points = _safeInt(entry['points']);
      projects = _safeInt(entry['projects']);
      hours = _safeInt(entry['hours']);
    } else if (entry != null) {
      name = entry.toString();
    }

    Color getRankColor(int rank) {
      if (rank == 1) return Colors.amber[600]!;
      if (rank == 2) return Colors.grey[400]!;
      if (rank == 3) return Colors.brown[300]!;
      return Colors.grey[600]!;
    }

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
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            // Rank Badge
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: getRankColor(rank),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  '#$rank',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            
            // User Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: secondaryColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.assignment_outlined,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$projects projekata',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.access_time,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${hours}h',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Points
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '$points poena',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 
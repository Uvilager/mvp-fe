import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/leaderboard/presentation/screens/leaderboard_screen.dart';
import '../../features/projects/presentation/screens/projects_screen.dart';
import '../../features/fundraisers/presentation/screens/fundraisers_screen.dart';
import 'package:go_router/go_router.dart'; // Import GoRouter

import '../../features/home/presentation/screens/home_screen.dart';
// No longer need to import individual screen types here for IndexedStack
// import '../../features/leaderboard/presentation/screens/leaderboard_screen.dart';
import '../../features/projects/presentation/screens/projects_screen.dart';
import '../../features/fundraisers/presentation/screens/fundraisers_screen.dart';
import '../../features/sponsors/presentation/screens/sponsors_screen.dart';
// DashboardPage import is no longer needed here

// selectedIndexProvider is no longer the primary way to manage state, GoRouter handles it.
// We might still use a provider to *calculate* the index from the route if needed,
// but direct state update is replaced by navigation.

class MainScreen extends ConsumerWidget {
  /// The widget to display in the body of the Scaffold.
  /// Should be the active screen selected by the ShellRoute.
  final Widget child;

  const MainScreen({required this.child, super.key});

  // Helper method to determine the selected index based on the current route
  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith('/projects')) {
      return 0;
    }
    if (location.startsWith('/home')) {
      return 1;
    }
    if (location.startsWith('/fundraisers')) {
      return 2;
    }
    if (location.startsWith('/sponsors')) {
      return 3;
    }
    return 1; // Default to home
  }

  // Helper method to navigate to the correct route based on index
  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/projects');
        break;
      case 1:
        GoRouter.of(context).go('/home');
        break;
      case 2:
        GoRouter.of(context).go('/fundraisers');
        break;
      case 3:
        GoRouter.of(context).go('/sponsors');
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Calculate the selected index based on the current route
    final int selectedIndex = _calculateSelectedIndex(context);

    return Scaffold(
      // The body is now the child passed by ShellRoute
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        // Use the navigation method instead of updating a provider directly
        onDestinationSelected: (index) => _onItemTapped(index, context),
        destinations: const [
          // Destinations remain the same, order matches the index calculation
          NavigationDestination(
            icon: Icon(Icons.folder_outlined),
            selectedIcon: Icon(Icons.folder),
            label: 'Projects',
          ),
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.volunteer_activism_outlined),
            selectedIcon: Icon(Icons.volunteer_activism),
            label: 'Fundraisers',
          ),
          NavigationDestination(
            icon: Icon(Icons.handshake_outlined),
            selectedIcon: Icon(Icons.handshake),
            label: 'Sponsors',
          ),
          // Dashboard Destination removed
        ],
      ),
    );
  }
}

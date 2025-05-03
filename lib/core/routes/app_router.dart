import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/domain/models/auth_state.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/auth/presentation/screens/login/login_screen.dart';
import '../../features/auth/presentation/screens/register/register_screen.dart';
import '../../features/fundraisers/presentation/screens/fundraiser_show_screen.dart';
import '../../features/fundraisers/presentation/screens/fundraisers_screen.dart';
import '../../features/leaderboard/presentation/screens/leaderboard_screen.dart';
import '../../features/projects/presentation/screens/project_detail_screen.dart'; // Added import for project detail
import '../../features/projects/presentation/screens/projects_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/settings/presentation/screens/general_settings_screen.dart'; // Added import
import '../../features/settings/presentation/screens/settings_screen.dart';
import '../../features/sponsors/presentation/screens/sponsors_screen.dart';
import '../screens/main_screen.dart';

part 'app_router.g.dart';

// Navigator keys
final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

@riverpod
GoRouter router(RouterRef ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home', // Default to home tab after login
    debugLogDiagnostics: true, // Enable logging for easier debugging

    redirect: (context, state) {
      final isAuthenticated = authState.valueOrNull is Authenticated;
      // Use subloc for matching as it's more reliable with nested routes
      final isLoggingIn = state.matchedLocation == '/login';
      final isRegistering = state.matchedLocation == '/register';
      final isAuthRoute = isLoggingIn || isRegistering;

      // If not logged in and not on an auth route, redirect to login
      if (!isAuthenticated && !isAuthRoute) {
        return '/login';
      }

      // If logged in and trying to access login/register, redirect to home
      if (isAuthenticated && isAuthRoute) {
        return '/home';
      }

      // No redirect needed
      return null;
    },

    routes: [
      // Routes outside the shell (Login, Register, Leaderboard)
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        // Ensure this opens outside the shell by using the root key
        parentNavigatorKey: _rootNavigatorKey,
        path: '/leaderboard',
        builder: (context, state) => const LeaderboardScreen(),
      ),
      GoRoute(
        // Settings screen, outside the shell but requires auth
        parentNavigatorKey: _rootNavigatorKey,
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        // General Settings screen, also outside the shell
        parentNavigatorKey: _rootNavigatorKey,
        path: '/settings/general',
        builder: (context, state) => const GeneralSettingsScreen(),
      ),

      // ShellRoute for main navigation with BottomNavigationBar
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          // MainScreen acts as the shell UI (Scaffold + BottomNavBar)
          // 'child' is the widget for the currently active nested route (tab)
          return MainScreen(child: child);
        },
        routes: [
          // Routes within the shell (tabs)
          GoRoute(
            path: '/projects',
            pageBuilder:
                (context, state) => const NoTransitionPage(
                  child: ProjectsScreen(), // Use NoTransitionPage for tabs
                ),
            routes: [
              // Nested Project detail route *within* the shell
              GoRoute(
                path: ':id', // e.g., /projects/456
                // No parentNavigatorKey needed, defaults to shell's navigator
                builder: (context, state) {
                  final idString = state.pathParameters['id'];
                  final id = int.tryParse(idString ?? '');
                  if (id == null) {
                    // TODO: Improve error handling
                    return const Scaffold(
                      body: Center(child: Text('Invalid Project ID')),
                    );
                  }
                  // This screen will be pushed *onto* the shell navigator stack
                  return ProjectDetailScreen(projectId: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/home',
            pageBuilder:
                (context, state) => NoTransitionPage(
                  child: HomeScreen(), // Use NoTransitionPage for tabs
                ),
            // TODO: Add nested home detail routes? (e.g., /home/settings)
            // routes: [
            //   GoRoute(path: 'settings', builder: ...),
            // ]
          ),
          GoRoute(
            path: '/fundraisers',
            pageBuilder:
                (context, state) => const NoTransitionPage(
                  child: FundraisersScreen(), // Use NoTransitionPage for tabs
                ),
            routes: [
              // Nested Fundraiser detail route *within* the shell
              GoRoute(
                path: ':id', // e.g., /fundraisers/123
                // No parentNavigatorKey needed, defaults to shell's navigator
                builder: (context, state) {
                  final idString = state.pathParameters['id'];
                  final id = int.tryParse(idString ?? '');
                  if (id == null) {
                    // TODO: Improve error handling - maybe show an error screen
                    return const Scaffold(
                      body: Center(child: Text('Invalid Fundraiser ID')),
                    );
                  }
                  // This screen will be pushed *onto* the shell navigator stack
                  return FundraiserShowScreen(fundraiserId: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/sponsors',
            pageBuilder:
                (context, state) => const NoTransitionPage(
                  child: SponsorsScreen(), // Use NoTransitionPage for tabs
                ),
          ),
        ],
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/domain/models/auth_state.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/auth/presentation/screens/login/login_screen.dart';
import '../../features/auth/presentation/screens/register/register_screen.dart';
import '../../features/fundraisers/presentation/screens/fundraiser_show_screen.dart'; // Import show screen
import '../../features/fundraisers/presentation/screens/fundraisers_screen.dart'; // Import list screen
import '../screens/main_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final isAuthenticated = authState.valueOrNull is Authenticated;
      final isAuthRoute =
          state.matchedLocation == '/login' ||
          state.matchedLocation == '/register';

      if (!isAuthenticated && !isAuthRoute) {
        return '/login';
      }

      if (isAuthenticated && isAuthRoute) {
        return '/';
      }

      return null;
    },
    routes: [
      GoRoute(path: '/', builder: (context, state) => const MainScreen()),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      // Fundraisers Routes
      GoRoute(
        path: '/fundraisers',
        builder: (context, state) => const FundraisersScreen(),
        routes: [
          GoRoute(
            path: ':id', // Path parameter for fundraiser ID
            builder: (context, state) {
              final idString = state.pathParameters['id'];
              final id = int.tryParse(idString ?? '');
              if (id == null) {
                // Handle invalid ID, maybe redirect or show error
                // For now, just return a simple error message or redirect
                return const Scaffold(
                  body: Center(child: Text('Invalid Fundraiser ID')),
                );
              }
              return FundraiserShowScreen(fundraiserId: id);
            },
          ),
        ],
      ),
    ],
  );
}

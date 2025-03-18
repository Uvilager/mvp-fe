import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/providers/auth_state.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final authState = ref.watch(authProvider);
  
  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      // If the auth state is loading, don't redirect
      if (authState.isLoading) return null;
      
      // Get the current path
      final path = state.uri.path;
      
      // Check if the user is authenticated
      final isAuthenticated = authState.hasValue && 
        authState.requireValue is AuthState.authenticated;
      
      // Auth routes that should only be accessible when NOT authenticated
      final isAuthRoute = path == '/login' || path == '/register';
      
      if (isAuthenticated) {
        // If user is authenticated and tries to access auth routes,
        // redirect to home
        if (isAuthRoute) return '/';
        // Otherwise, allow access to the requested route
        return null;
      } else {
        // If user is not authenticated and tries to access protected routes,
        // redirect to login
        if (isAuthRoute) return null;
        return '/login';
      }
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
    ],
  );
} 
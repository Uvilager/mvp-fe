import 'package:go_router/go_router.dart';

import 'package:mvp_fe/features/auth/presentation/login/login_screen.dart';
import 'package:mvp_fe/features/auth/presentation/register/register_screen.dart';
import 'package:mvp_fe/features/home/presentation/home_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/auth/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/auth/register',
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            context.go('/login');
          },
          child: const Text('Go to Login'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            context.go('/register');
          },
          child: const Text('Go to Register'),
        ),
      ],
    );
  }
}

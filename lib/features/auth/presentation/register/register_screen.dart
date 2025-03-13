import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvp_fe/features/auth/presentation/register/register_widget.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: RegisterWidget(),
      ),
    );
  }
}

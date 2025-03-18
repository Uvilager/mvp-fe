import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/presentation/providers/auth_provider.dart';
import 'home/widgets/home_header.dart';
import 'home/widgets/quick_actions.dart';
import 'home/widgets/recent_activity.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await ref.read(authProvider.notifier).logout();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            // TODO: Implement refresh logic
          },
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: const [
              HomeHeader(),
              SizedBox(height: 24),
              QuickActions(),
              SizedBox(height: 24),
              RecentActivity(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement add new item
        },
        child: const Icon(Icons.add),
      ),
    );
  }
} 
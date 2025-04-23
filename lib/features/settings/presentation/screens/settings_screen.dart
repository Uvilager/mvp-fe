import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart'; // Import go_router

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('General'),
            subtitle: const Text('Update profile details'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to General Settings screen
              context.push('/settings/general');
            },
          ),
          ListTile(
            leading: const Icon(Icons.leaderboard_outlined),
            title: const Text('Leaderboard'),
            subtitle: const Text('View rankings'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to Leaderboard screen
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Leaderboard tapped (TODO)')),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.article_outlined),
            title: const Text('News'),
            subtitle: const Text('Latest updates'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to News screen/section
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('News tapped (TODO)')),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Theme.of(context).colorScheme.error,
            ),
            title: Text(
              'Log Out',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            onTap: () {
              // TODO: Implement logout logic using AuthProvider
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Log Out tapped (TODO)')),
              );
            },
          ),
        ],
      ),
    );
  }
}

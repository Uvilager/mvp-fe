import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvp_fe/features/home/presentation/providers/dashboard_provider.dart'; // Import dashboard provider
import 'package:mvp_fe/features/projects/domain/models/project.dart';
import 'package:mvp_fe/features/projects/presentation/widgets/project_card.dart'; // Import shared ProjectCard

import '../providers/project_provider.dart'; // Import all projects provider

class MyProjectsScreen extends ConsumerWidget {
  const MyProjectsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch both providers
    final dashboardDataAsync = ref.watch(dashboardDataProvider);
    final allProjectsAsync = ref.watch(projectsProvider);

    Future<void> refreshData() async {
      // Invalidate both providers on refresh
      ref.invalidate(dashboardDataProvider);
      ref.invalidate(projectsProvider);
      // Allow time for invalidation to propagate before rebuild
      await Future.delayed(const Duration(milliseconds: 50));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Projects'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: refreshData),
        ],
      ),
      body: dashboardDataAsync.when(
        data: (dashboardData) {
          // Dashboard data loaded, now check projects data
          return allProjectsAsync.when(
            data: (allProjects) {
              // Both loaded successfully, filter and display
              final myProjectIds =
                  dashboardData.volonteering.active
                      .map((status) => status.projectId)
                      .toSet();
              final myProjects =
                  allProjects
                      .where((project) => myProjectIds.contains(project.id))
                      .toList();

              return myProjects.isEmpty
                  ? const Center(
                    child: Text("You haven't joined any projects yet."),
                  )
                  : RefreshIndicator(
                    onRefresh: refreshData,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: myProjects.length,
                      itemBuilder: (context, index) {
                        final project = myProjects[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ProjectCard(project: project),
                        );
                      },
                    ),
                  );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error:
                (error, stack) =>
                    _buildErrorWidget(context, error, refreshData),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => _buildErrorWidget(context, error, refreshData),
      ),
    );
  }

  // Helper widget for displaying errors
  Widget _buildErrorWidget(
    BuildContext context,
    Object error,
    Future<void> Function() onRetry,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Error loading data: ${error.toString()}'),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}

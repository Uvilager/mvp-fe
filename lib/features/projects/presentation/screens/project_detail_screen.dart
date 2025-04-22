import 'package:dio/dio.dart'; // Import DioException
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvp_fe/core/widgets/network_image_with_placeholder.dart';

import '../../domain/models/project.dart';
import '../providers/project_provider.dart';

class ProjectDetailScreen extends ConsumerWidget {
  final int projectId; // Changed from Project to projectId

  const ProjectDetailScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the specific project detail provider
    final projectAsyncValue = ref.watch(projectDetailProvider(projectId));

    return Scaffold(
      // Use AsyncValue.when to handle loading/error states
      body: projectAsyncValue.when(
        data: (project) => _buildContent(context, ref, project),
        loading: () => const Center(child: CircularProgressIndicator()),
        error:
            (error, stackTrace) =>
                Center(child: Text('Error loading project: $error')),
      ),
    );
  }

  // Extracted content building logic into a separate method
  Widget _buildContent(BuildContext context, WidgetRef ref, Project project) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: NetworkImageWithPlaceholder(
              imageUrl: project.projectUrl,
              width: double.infinity,
              height: 200,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  project.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                if (project.body != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    project.body!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
                const SizedBox(height: 24),
                _buildInfoSection(context, project), // Pass project data
                const SizedBox(height: 24),
                _buildOrganizerSection(context, project), // Pass project data
                const SizedBox(height: 24),
                _buildActionButtons(context, ref, project), // Pass project data
                const SizedBox(height: 24),
                _buildVotingSection(context, ref, project), // Pass project data
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Updated helper methods to accept Project object
  Widget _buildInfoSection(BuildContext context, Project project) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Project Information',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildInfoRow(
              context,
              Icons.calendar_today,
              'Start Date',
              project.startDate.toString().split(' ')[0],
            ),
            _buildInfoRow(
              context,
              Icons.calendar_month,
              'End Date',
              project.endDate.toString().split(' ')[0],
            ),
            _buildInfoRow(
              context,
              Icons.people,
              'Participants',
              '${project.minUsers}-${project.maxUsers}',
            ),
            _buildInfoRow(
              context,
              Icons.attach_money,
              'Budget',
              '\$${project.budget}',
            ),
            _buildInfoRow(
              context,
              Icons.star,
              'Points',
              project.pointsEarned.toString(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 16)),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildOrganizerSection(BuildContext context, Project project) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Organizer', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            Row(
              children: [
                ClipOval(
                  child: NetworkImageWithPlaceholder(
                    imageUrl: project.organizer.avatarUrl,
                    width: 48,
                    height: 48,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${project.organizer.firstName} ${project.organizer.lastName}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        project.organizer.username,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(
    BuildContext context,
    WidgetRef ref,
    Project project,
  ) {
    return Row(
      children: [
        Expanded(
          child: FilledButton.icon(
            onPressed: () async {
              try {
                final message = await ref
                    .read(projectsProvider.notifier)
                    .volunteer(project.id);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              } catch (e) {
                String errorMessage = 'Failed to volunteer';
                if (e is DioException && e.response?.data is Map) {
                  errorMessage = e.response!.data['message'] ?? errorMessage;
                } else {
                  errorMessage = e.toString();
                }
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(errorMessage),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
            icon: const Icon(Icons.volunteer_activism),
            label: const Text('Volunteer'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () async {
              try {
                final message = await ref
                    .read(projectsProvider.notifier)
                    .becomeLeader(project.id);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              } catch (e) {
                String errorMessage = 'Failed to become leader';
                if (e is DioException && e.response?.data is Map) {
                  errorMessage = e.response!.data['message'] ?? errorMessage;
                } else {
                  errorMessage = e.toString();
                }
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(errorMessage),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
            icon: const Icon(Icons.leaderboard),
            label: const Text('Become Leader'),
          ),
        ),
      ],
    );
  }

  Widget _buildVotingSection(
    BuildContext context,
    WidgetRef ref,
    Project project,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Vote', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildVoteButton(
                  context,
                  ref,
                  project, // Pass project to vote button
                  'up',
                  Icons.thumb_up,
                  project.upvotes,
                  Colors.green,
                ),
                _buildVoteButton(
                  context,
                  ref,
                  project, // Pass project to vote button
                  'down',
                  Icons.thumb_down,
                  project.downvotes,
                  Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVoteButton(
    BuildContext context,
    WidgetRef ref,
    Project project, // Accept project here
    String type,
    IconData icon,
    int count,
    Color color,
  ) {
    return ElevatedButton.icon(
      onPressed: () async {
        try {
          final message = await ref
              .read(projectsProvider.notifier)
              .vote(project.id, type);
          // Show success Snackbar
          if (context.mounted) {
            // Check if the widget is still in the tree
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message), backgroundColor: Colors.green),
            );
          }
        } catch (e) {
          // Determine error message
          String errorMessage = 'Failed to vote';
          if (e is DioException && e.response?.data is Map) {
            // Try to get specific error from backend response
            errorMessage = e.response!.data['message'] ?? errorMessage;
          } else {
            errorMessage = e.toString();
          }

          // Show error Snackbar
          if (context.mounted) {
            // Check if the widget is still in the tree
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
      },
      icon: Icon(icon, color: color),
      label: Text(count.toString(), style: TextStyle(color: color)),
      style: ElevatedButton.styleFrom(
        foregroundColor: color,
        side: BorderSide(color: color),
      ),
    );
  }
}

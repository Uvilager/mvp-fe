import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvp_fe/core/widgets/network_image_with_placeholder.dart';

import '../../domain/models/project.dart';
import '../providers/project_provider.dart';

class ProjectDetailScreen extends ConsumerWidget {
  final Project project;

  const ProjectDetailScreen({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
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
                  _buildInfoSection(context),
                  const SizedBox(height: 24),
                  _buildOrganizerSection(context),
                  const SizedBox(height: 24),
                  _buildActionButtons(context, ref),
                  const SizedBox(height: 24),
                  _buildVotingSection(context, ref),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection(BuildContext context) {
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
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrganizerSection(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Organizer',
              style: Theme.of(context).textTheme.titleLarge,
            ),
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

  Widget _buildActionButtons(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: FilledButton.icon(
            onPressed: () => ref
                .read(projectsProvider.notifier)
                .volunteer(project.id),
            icon: const Icon(Icons.volunteer_activism),
            label: const Text('Volunteer'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => ref
                .read(projectsProvider.notifier)
                .becomeLeader(project.id),
            icon: const Icon(Icons.leaderboard),
            label: const Text('Become Leader'),
          ),
        ),
      ],
    );
  }

  Widget _buildVotingSection(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Vote',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildVoteButton(
                  context,
                  ref,
                  'upvote',
                  Icons.thumb_up,
                  project.upvotes,
                  Colors.green,
                ),
                _buildVoteButton(
                  context,
                  ref,
                  'downvote',
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
    String type,
    IconData icon,
    int count,
    Color color,
  ) {
    return ElevatedButton.icon(
      onPressed: () => ref.read(projectsProvider.notifier).vote(project.id, type),
      icon: Icon(icon, color: color),
      label: Text(
        count.toString(),
        style: TextStyle(color: color),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: color,
        side: BorderSide(color: color),
      ),
    );
  }
} 
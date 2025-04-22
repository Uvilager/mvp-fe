import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/project_repository_impl.dart';
import '../../domain/models/project.dart';

part 'project_provider.g.dart';

// Provider to fetch a single project by its ID
@riverpod
Future<Project> projectDetail(
  AutoDisposeFutureProviderRef ref,
  int projectId,
) async {
  final repository = ref.watch(projectRepositoryProvider);
  // Keep the project detail alive even if not watched temporarily
  ref.keepAlive();
  // Fetch the specific project
  final project = await repository.getProject(projectId);

  // Optional: Add a listener to invalidate when the list provider changes,
  // ensuring detail is fresh if list is manually refreshed elsewhere.
  ref.listen(projectsProvider, (_, __) => ref.invalidateSelf());

  return project;
}

// Provider for the list of projects
@riverpod
class Projects extends _$Projects {
  @override
  Future<List<Project>> build() async {
    final repository = ref.watch(projectRepositoryProvider);
    return repository.getProjects(page: 1, perPage: 30);
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }

  // Updated to return String on success, throws error on failure
  Future<String> volunteer(int projectId) async {
    final repository = ref.read(projectRepositoryProvider);
    try {
      final message = await repository.volunteer(projectId);
      // Invalidate providers after successful action
      ref.container.invalidate(projectDetailProvider(projectId));
      ref.invalidateSelf();
      return message;
    } catch (e) {
      // Rethrow error for UI handling
      throw e;
    }
  }

  // Updated to return String on success, throws error on failure
  Future<String> becomeLeader(int projectId) async {
    final repository = ref.read(projectRepositoryProvider);
    try {
      final message = await repository.becomeLeader(projectId);
      // Invalidate providers after successful action
      ref.container.invalidate(projectDetailProvider(projectId));
      ref.invalidateSelf();
      return message;
    } catch (e) {
      // Rethrow error for UI handling
      throw e;
    }
  }

  // Updated to return String on success, throws error on failure
  Future<String> vote(int projectId, String type) async {
    final repository = ref.read(projectRepositoryProvider);
    try {
      // Call repository and get success message
      final message = await repository.vote(projectId, type);
      // Invalidate providers *after* successful vote
      ref.container.invalidate(projectDetailProvider(projectId));
      ref.invalidateSelf();
      return message; // Return success message
    } catch (e) {
      // Re-throw the error to be caught in the UI
      throw e;
    }
  }
}

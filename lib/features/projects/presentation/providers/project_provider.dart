import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

import '../../data/repositories/project_repository_impl.dart';
import '../../domain/models/project.dart';
import '../../domain/models/volunteer_project_data.dart';

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
      ref.container.invalidate(volunteerProjectDataProvider(projectId));
      ref.invalidateSelf();
      return message;
    } catch (e) {
      // Rethrow error for UI handling
      rethrow;
    }
  }

  // Updated to return String on success, throws error on failure
  Future<String> becomeLeader(int projectId) async {
    final repository = ref.read(projectRepositoryProvider);
    try {
      final message = await repository.becomeLeader(projectId);
      // Invalidate providers after successful action
      ref.container.invalidate(projectDetailProvider(projectId));
      ref.container.invalidate(volunteerProjectDataProvider(projectId));
      ref.invalidateSelf();
      return message;
    } catch (e) {
      // Rethrow error for UI handling
      rethrow;
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
      ref.container.invalidate(volunteerProjectDataProvider(projectId));
      ref.invalidateSelf();
      return message; // Return success message
    } catch (e) {
      // Re-throw the error to be caught in the UI
      rethrow;
    }
  }
}

@riverpod
Future<List<Project>> projectsBySponsor(
    ProjectsBySponsorRef ref, int sponsorId) async {
  final repository = ref.watch(projectRepositoryProvider);
  return repository.getProjectsBySponsor(sponsorId);
}

// New provider for volunteer project data (includes messages and user status)
@riverpod
Future<VolunteerProjectData> volunteerProjectData(
    VolunteerProjectDataRef ref, int projectId) async {
  final repository = ref.watch(projectRepositoryProvider);
  return repository.getVolunteerProject(projectId);
}

// Provider for messaging functionality
@Riverpod(keepAlive: true)  
class ProjectMessaging extends _$ProjectMessaging {
  @override
  Future<List<String>> build() async {
    // Return empty list initially
    return [];
  }

  Future<String> sendMessage(int projectId, String message) async {
    final repository = ref.read(projectRepositoryProvider);
    try {
      final result = await repository.sendMessage(projectId, message);
      // Invalidate volunteer project data to refresh messages
      ref.container.invalidate(volunteerProjectDataProvider(projectId));
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> deleteMessage(int projectId, int messageId) async {
    final repository = ref.read(projectRepositoryProvider);
    try {
      final result = await repository.deleteMessage(projectId, messageId);
      // Invalidate volunteer project data to refresh messages
      ref.container.invalidate(volunteerProjectDataProvider(projectId));
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> completeProject(int projectId) async {
    final repository = ref.read(projectRepositoryProvider);
    try {
      final result = await repository.completeProject(projectId);
      // Invalidate all related providers
      ref.container.invalidate(projectDetailProvider(projectId));
      ref.container.invalidate(volunteerProjectDataProvider(projectId));
      ref.container.invalidate(projectsProvider);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> cancelProject(int projectId) async {
    final repository = ref.read(projectRepositoryProvider);
    try {
      final result = await repository.cancelProject(projectId);
      // Invalidate all related providers
      ref.container.invalidate(projectDetailProvider(projectId));
      ref.container.invalidate(volunteerProjectDataProvider(projectId));
      ref.container.invalidate(projectsProvider);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> markVolunteerPresent(int projectId, int volunteerId) async {
    final repository = ref.read(projectRepositoryProvider);
    try {
      final result = await repository.markVolunteerPresent(projectId, volunteerId);
      // Invalidate volunteer project data to refresh attendance status
      ref.container.invalidate(volunteerProjectDataProvider(projectId));
      return result;
    } catch (e) {
      rethrow;
    }
  }
}

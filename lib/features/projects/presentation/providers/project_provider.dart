import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/project_repository_impl.dart';
import '../../domain/models/project.dart';

part 'project_provider.g.dart';

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

  Future<void> volunteer(int projectId) async {
    final repository = ref.read(projectRepositoryProvider);
    await repository.volunteer(projectId);
    await refresh();
  }

  Future<void> becomeLeader(int projectId) async {
    final repository = ref.read(projectRepositoryProvider);
    await repository.becomeLeader(projectId);
    await refresh();
  }

  Future<void> vote(int projectId, String type) async {
    final repository = ref.read(projectRepositoryProvider);
    await repository.vote(projectId, type);
    await refresh();
  }
} 
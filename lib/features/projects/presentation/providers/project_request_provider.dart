import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/project_request_repository_impl.dart';
import '../../domain/models/simple_district.dart';
import '../../domain/models/simple_project_request.dart';

part 'project_request_provider.g.dart';

@riverpod
Future<List<District>> districts(ref) async {
  final repository = ref.watch(projectRequestRepositoryProvider);
  return repository.getDistricts();
}

@riverpod
class ProjectRequestNotifier extends _$ProjectRequestNotifier {
  @override
  FutureOr<ProjectRequestResponse?> build() {
    return null;
  }

  Future<void> submitProjectRequest(ProjectRequest request) async {
    state = const AsyncValue.loading();
    
    try {
      final repository = ref.read(projectRequestRepositoryProvider);
      final response = await repository.submitProjectRequest(request);
      state = AsyncValue.data(response);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  void reset() {
    state = const AsyncValue.data(null);
  }
}

@riverpod
Future<List<ProjectRequestResponse>> projectRequests(ref) async {
  final repository = ref.watch(projectRequestRepositoryProvider);
  return repository.getProjectRequests();
}

@riverpod
Future<ProjectRequestResponse> projectRequest(ref, int id) async {
  final repository = ref.watch(projectRequestRepositoryProvider);
  return repository.getProjectRequest(id);
} 
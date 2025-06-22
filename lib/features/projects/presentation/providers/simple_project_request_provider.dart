import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../data/repositories/project_request_repository_impl.dart';
import '../../domain/models/simple_district.dart';
import '../../domain/models/simple_project_request.dart';

// Simple providers without build_runner
final projectRequestRepositoryProvider = Provider<ProjectRequestRepositoryImpl>((ref) {
  final dio = ref.watch(dioProvider);
  return ProjectRequestRepositoryImpl(dio);
});

final districtsProvider = FutureProvider<List<District>>((ref) async {
  final repository = ref.watch(projectRequestRepositoryProvider);
  return repository.getDistricts();
});

final projectRequestsProvider = FutureProvider<List<ProjectRequestResponse>>((ref) async {
  final repository = ref.watch(projectRequestRepositoryProvider);
  return repository.getProjectRequests();
});

final projectRequestProvider = FutureProvider.family<ProjectRequestResponse, int>((ref, id) async {
  final repository = ref.watch(projectRequestRepositoryProvider);
  return repository.getProjectRequest(id);
});

class ProjectRequestNotifier extends StateNotifier<AsyncValue<ProjectRequestResponse?>> {
  final Ref ref;

  ProjectRequestNotifier(this.ref) : super(const AsyncValue.data(null));

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

final projectRequestNotifierProvider = StateNotifierProvider<ProjectRequestNotifier, AsyncValue<ProjectRequestResponse?>>((ref) {
  return ProjectRequestNotifier(ref);
}); 
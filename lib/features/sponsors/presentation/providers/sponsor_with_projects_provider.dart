import 'package:mvp_fe/features/sponsors/data/repositories/sponsors_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sponsor_with_projects_provider.g.dart';

// Provider to fetch sponsor with projects data
@riverpod
Future<Map<String, dynamic>> sponsorWithProjects(
  SponsorWithProjectsRef ref,
  int sponsorId,
) async {
  final repository = ref.watch(sponsorsRepositoryProvider);
  return repository.getSponsorWithProjects(sponsorId);
} 
import 'package:mvp_fe/features/sponsors/domain/models/sponsor_project.dart';
import 'package:mvp_fe/features/sponsors/presentation/providers/sponsor_detail_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sponsor_projects_provider.g.dart';

// Using AutoDisposeFutureProviderFamily to fetch projects from sponsor detail response
// The provider will automatically dispose when no longer listened to.
@riverpod
Future<List<SponsorProject>> sponsorProjects(
  SponsorProjectsRef ref,
  int sponsorId,
) async {
  // Get the sponsor detail which includes projects
  final sponsorDetailAsync = ref.watch(sponsorDetailProvider(sponsorId));
  
  return sponsorDetailAsync.when(
    data: (sponsor) {
      // For now, return empty list since we need to parse the projects from the API response
      // We'll update this once we have the correct response handling
      return <SponsorProject>[];
    },
    loading: () => throw const AsyncLoading<List<SponsorProject>>(),
    error: (error, stackTrace) => throw AsyncError(error, stackTrace),
  );
} 
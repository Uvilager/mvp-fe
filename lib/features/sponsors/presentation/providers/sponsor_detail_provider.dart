import 'package:mvp_fe/features/sponsors/data/repositories/sponsors_repository_impl.dart';
import 'package:mvp_fe/features/sponsors/domain/models/sponsor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sponsor_detail_provider.g.dart';

// Using AutoDisposeFutureProviderFamily to fetch a sponsor by ID
// The provider will automatically dispose when no longer listened to.
@riverpod
Future<Sponsor> sponsorDetail(
  SponsorDetailRef ref,
  int sponsorId,
) async {
  final repository = ref.watch(sponsorsRepositoryProvider);
  return repository.getSponsor(sponsorId);
} 
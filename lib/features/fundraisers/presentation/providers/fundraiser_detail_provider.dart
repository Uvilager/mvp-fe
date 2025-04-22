import 'package:mvp_fe/features/fundraisers/data/repositories/fundraisers_repository_impl.dart';
import 'package:mvp_fe/features/fundraisers/domain/models/fundraiser.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fundraiser_detail_provider.g.dart';

// Using AutoDisposeFutureProviderFamily to fetch a fundraiser by ID
// The provider will automatically dispose when no longer listened to.
@riverpod
Future<Fundraiser> fundraiserDetail(
  FundraiserDetailRef ref,
  int fundraiserId,
) async {
  final repository = ref.watch(fundraisersRepositoryProvider);
  return repository.getFundraiser(fundraiserId);
}

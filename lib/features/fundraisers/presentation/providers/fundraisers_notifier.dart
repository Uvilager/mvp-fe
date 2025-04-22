import 'package:mvp_fe/features/fundraisers/data/repositories/fundraisers_repository_impl.dart';
import 'package:mvp_fe/features/fundraisers/domain/models/fundraiser.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fundraisers_notifier.g.dart';

@riverpod
class FundraisersNotifier extends _$FundraisersNotifier {
  @override
  Future<List<Fundraiser>> build() async {
    // Fetch initial fundraisers list
    return _fetchFundraisers();
  }

  Future<List<Fundraiser>> _fetchFundraisers() async {
    final repository = ref.watch(fundraisersRepositoryProvider);
    // In a real app, you might add pagination or filtering here
    return repository.getFundraisers();
  }

  // Optional: Add methods for refresh or other actions if needed
  Future<void> refreshFundraisers() async {
    state = const AsyncValue.loading();
    try {
      final fundraisers = await _fetchFundraisers();
      state = AsyncValue.data(fundraisers);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

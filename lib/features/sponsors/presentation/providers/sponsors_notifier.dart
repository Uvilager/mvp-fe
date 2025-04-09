import 'package:mvp_fe/features/sponsors/data/repositories/sponsors_repository_impl.dart';
import 'package:mvp_fe/features/sponsors/domain/models/sponsor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sponsors_notifier.g.dart';

@riverpod
class SponsorsNotifier extends _$SponsorsNotifier {
  @override
  Future<List<Sponsor>> build() async {
    // Fetch initial sponsors list
    return _fetchSponsors();
  }

  Future<List<Sponsor>> _fetchSponsors() async {
    final repository = ref.watch(sponsorsRepositoryProvider);
    // In a real app, you might want to handle pagination or other parameters here
    return repository.getSponsors();
  }

  // Optional: Add methods for refresh or other actions if needed
  Future<void> refreshSponsors() async {
    state = const AsyncValue.loading();
    try {
      final sponsors = await _fetchSponsors();
      state = AsyncValue.data(sponsors);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

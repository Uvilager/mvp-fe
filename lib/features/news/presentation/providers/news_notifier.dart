import 'package:mvp_fe/features/news/data/repositories/news_repository_impl.dart';
import 'package:mvp_fe/features/news/domain/models/news.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_notifier.g.dart';

@riverpod
class NewsNotifier extends _$NewsNotifier {
  @override
  Future<List<News>> build() async {
    return _fetchNews();
  }

  Future<List<News>> _fetchNews() async {
    final repository = ref.watch(newsRepositoryProvider);
    return repository.getNews();
  }

  Future<void> refreshNews() async {
    state = const AsyncValue.loading();
    try {
      final news = await _fetchNews();
      state = AsyncValue.data(news);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
} 
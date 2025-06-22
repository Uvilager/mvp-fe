import 'package:mvp_fe/features/news/data/repositories/news_repository_impl.dart';
import 'package:mvp_fe/features/news/domain/models/news.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_detail_provider.g.dart';

@riverpod
Future<News> newsDetail(
  NewsDetailRef ref,
  int newsId,
) async {
  final repository = ref.watch(newsRepositoryProvider);
  return repository.getNewsById(newsId);
} 
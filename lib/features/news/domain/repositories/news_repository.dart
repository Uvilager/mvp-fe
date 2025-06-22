import 'package:mvp_fe/features/news/domain/models/news.dart';

abstract class NewsRepository {
  Future<List<News>> getNews();
  Future<News> getNewsById(int id);
} 
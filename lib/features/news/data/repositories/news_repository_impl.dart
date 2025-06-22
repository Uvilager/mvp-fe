import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mvp_fe/core/network/dio_provider.dart';
import 'package:mvp_fe/features/news/domain/models/news.dart';
import 'package:mvp_fe/features/news/domain/repositories/news_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_repository_impl.g.dart';

@riverpod
NewsRepository newsRepository(NewsRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return NewsRepositoryImpl(dio);
}

class NewsRepositoryImpl implements NewsRepository {
  final Dio _dio;

  NewsRepositoryImpl(this._dio);

  @override
  Future<List<News>> getNews() async {
    try {
      final response = await _dio.get('/news');

      if (response.statusCode == 200 && response.data != null) {
        Map<String, dynamic> responseData;
        if (response.data is Map<String, dynamic>) {
          responseData = response.data;
        } else if (response.data is String) {
          responseData =
              jsonDecode(response.data as String) as Map<String, dynamic>;
        } else {
          throw Exception(
            'Unexpected response data type: ${response.data.runtimeType}',
          );
        }

        if (responseData.containsKey('data') && responseData['data'] is List) {
          final newsData = responseData['data'] as List;
          return newsData
              .map(
                (newsJson) =>
                    News.fromJson(newsJson as Map<String, dynamic>),
              )
              .toList();
        } else {
          throw Exception(
            'Invalid response format: "data" key is missing or not a list.',
          );
        }
      } else {
        throw Exception(
          'Failed to load news: Status code ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      print(
        'DioError fetching news: ${e.message}',
      );
      throw Exception('Network error fetching news: ${e.message}');
    } catch (e) {
      print(
        'Error fetching news: $e',
      );
      throw Exception(
        'An unexpected error occurred while loading news.',
      );
    }
  }

  @override
  Future<News> getNewsById(int id) async {
    try {
      final response = await _dio.get('/news/$id');

      if (response.statusCode == 200 && response.data != null) {
        Map<String, dynamic> responseData;
        if (response.data is Map<String, dynamic>) {
          responseData = response.data;
        } else if (response.data is String) {
          responseData =
              jsonDecode(response.data as String) as Map<String, dynamic>;
        } else {
          throw Exception(
            'Unexpected response data type: ${response.data.runtimeType}',
          );
        }
        
        if (responseData.containsKey('data') &&
            responseData['data'] is Map<String, dynamic>) {
          return News.fromJson(
            responseData['data'] as Map<String, dynamic>,
          );
        } else {
          throw Exception('Invalid response format for single news.');
        }
      } else {
        throw Exception(
          'Failed to load news $id: Status code ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      print(
        'DioError fetching news $id: ${e.message}',
      );
      throw Exception('Network error fetching news $id: ${e.message}');
    } catch (e) {
      print(
        'Error fetching news $id: $e',
      );
      throw Exception(
        'An unexpected error occurred while loading news $id.',
      );
    }
  }
} 
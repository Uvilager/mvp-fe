import 'package:dio/dio.dart';
import 'package:mvp_fe/core/network/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'leaderboard_provider.g.dart';

// Model for leaderboard entry
class LeaderboardEntry {
  final int rank;
  final String name;
  final int hours;
  final int projects;
  final int points;
  final String? image;
  final bool isCurrentUser;

  LeaderboardEntry({
    required this.rank,
    required this.name,
    required this.hours,
    required this.projects,
    required this.points,
    this.image,
    this.isCurrentUser = false,
  });

  factory LeaderboardEntry.fromJson(Map<String, dynamic> json) {
    return LeaderboardEntry(
      rank: json['rank'] ?? 0,
      name: json['name'] ?? '',
      hours: json['hours'] ?? 0,
      projects: json['projects'] ?? 0,
      points: json['points'] ?? 0,
      image: json['image'],
      isCurrentUser: json['isCurrentUser'] ?? false,
    );
  }
}

@riverpod
Future<List<LeaderboardEntry>> leaderboard(LeaderboardRef ref) async {
  final dio = ref.watch(dioProvider);
  
  try {
    final response = await dio.get('/leaderboard');
    
    if (response.statusCode == 200 && response.data != null) {
      // Assuming the actual data is nested under a 'data' key
      final data = response.data['data'] as List<dynamic>? ?? [];
      return data.map((item) => LeaderboardEntry.fromJson(item)).toList();
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        error: 'Failed to load leaderboard data (Status code: ${response.statusCode})',
        type: DioExceptionType.badResponse,
      );
    }
  } on DioException catch (e) {
    print('Failed to load leaderboard data: ${e.response?.data ?? e.message}');
    rethrow;
  } catch (e) {
    print('Unexpected error loading leaderboard data: $e');
    throw Exception('An unexpected error occurred: $e');
  }
} 
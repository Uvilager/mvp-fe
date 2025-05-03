import 'package:dio/dio.dart';
import 'package:mvp_fe/core/network/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/dashboard_data.dart';
import '../../domain/repositories/dashboard_repository.dart';

part 'dashboard_repository_impl.g.dart';

// Provider for the DashboardRepository implementation
@riverpod
DashboardRepository dashboardRepository(DashboardRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return DashboardRepositoryImpl(dio);
}

class DashboardRepositoryImpl implements DashboardRepository {
  final Dio _dio;

  DashboardRepositoryImpl(this._dio);

  @override
  Future<DashboardData> getDashboardData() async {
    try {
      print('📡 Making request to /dashboard');
      final response = await _dio.get('/dashboard');
      print('📡 Response received: ${response.statusCode}');
      print('📡 Response data type: ${response.data.runtimeType}');
      print('📡 Response data keys: ${response.data is Map ? (response.data as Map).keys.toList() : 'Not a Map'}');

      if (response.statusCode == 200 && response.data != null) {
        // Assuming the actual data is nested under a 'data' key
        if (response.data['data'] is Map<String, dynamic>) {
          print('📡 Data field type: ${response.data['data'].runtimeType}');
          print('📡 Data field keys: ${(response.data['data'] as Map).keys.toList()}');
          
          // Check specific fields that might be causing issues
          final data = response.data['data'] as Map<String, dynamic>;
          print('📡 Leading field: ${data['leading']}');
          print('📡 Leading type: ${data['leading'].runtimeType}');
          print('📡 Leaderboard field: ${data['leaderboard']}');
          print('📡 Leaderboard type: ${data['leaderboard'].runtimeType}');
          
          if (data['leading'] is List) {
            final leadingList = data['leading'] as List;
            print('📡 Leading list length: ${leadingList.length}');
            for (int i = 0; i < leadingList.length; i++) {
              print('📡 Leading[$i]: ${leadingList[i]}');
              print('📡 Leading[$i] type: ${leadingList[i].runtimeType}');
              if (leadingList[i] is Map) {
                final leadingItem = leadingList[i] as Map;
                print('📡 Leading[$i] keys: ${leadingItem.keys.toList()}');
                if (leadingItem.containsKey('project')) {
                  print('📡 Leading[$i].project: ${leadingItem['project']}');
                  print('📡 Leading[$i].project type: ${leadingItem['project'].runtimeType}');
                }
              }
            }
          }
          
          try {
            return DashboardData.fromJson(response.data['data']);
          } catch (e, stackTrace) {
            print('📡 JSON parsing error: $e');
            print('📡 Stack trace: $stackTrace');
            rethrow;
          }
        } else {
          print('📡 Data field is not Map<String, dynamic>: ${response.data['data'].runtimeType}');
          throw Exception('Dashboard data format is incorrect.');
        }
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error:
              'Failed to load dashboard data (Status code: ${response.statusCode})',
          type: DioExceptionType.badResponse,
        );
      }
    } on DioException catch (e) {
      rethrow;
    } catch (e, stackTrace) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}

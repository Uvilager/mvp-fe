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
      final response = await _dio.get('/dashboard');

      if (response.statusCode == 200 && response.data != null) {
        // Assuming the actual data is nested under a 'data' key
        if (response.data['data'] is Map<String, dynamic>) {
          return DashboardData.fromJson(response.data['data']);
        } else {
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
      // Log and re-throw DioException
      print('Failed to load dashboard data: ${e.response?.data ?? e.message}');
      throw e;
    } catch (e) {
      // Catch any other unexpected errors
      print('Unexpected error loading dashboard data: $e');
      throw Exception('An unexpected error occurred: $e');
    }
  }
}

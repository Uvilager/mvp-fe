import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mvp_fe/core/network/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/project.dart';
import '../../domain/repositories/project_repository.dart';

part 'project_repository_impl.g.dart';

@riverpod
ProjectRepository projectRepository(ProjectRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return ProjectRepositoryImpl(dio);
}

class ProjectRepositoryImpl implements ProjectRepository {
  final Dio _dio;

  ProjectRepositoryImpl(this._dio);

  @override
  Future<List<Project>> getProjects({
    required int page,
    required int perPage,
  }) async {
    try {
      final response = await _dio.get(
        '/projects',
        queryParameters: {'page': page, 'per_page': perPage},
      );

      if (response.statusCode == 200) {
        final List<dynamic> projectsData = response.data['data']['data'];
        return projectsData.map((json) => Project.fromJson(json)).toList();
      }

      throw Exception('Failed to load projects');
    } catch (e) {
      throw Exception('Failed to load projects: $e');
    }
  }

  @override
  Future<Project> getProject(int id) async {
    try {
      final response = await _dio.get('/projects/$id');

      if (response.statusCode == 200) {
        return Project.fromJson(response.data['data']);
      }

      throw Exception('Failed to load project');
    } catch (e) {
      throw Exception('Failed to load project: $e');
    }
  }

  @override
  Future<String> volunteer(int projectId) async {
    try {
      final response = await _dio.post('/projects/$projectId/volunteer');

      if (response.statusCode == 200 && response.data != null) {
        return response.data['message'] ?? 'Successfully volunteered';
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'Failed to volunteer (Status code: ${response.statusCode})',
          type: DioExceptionType.badResponse,
        );
      }
    } on DioException catch (e) {
      log('Volunteer failed: ${e.response?.data ?? e.message}');
      throw e;
    } catch (e) {
      log('Volunteer failed unexpectedly: $e');
      throw Exception('An unexpected error occurred while volunteering: $e');
    }
  }

  @override
  Future<String> becomeLeader(int projectId) async {
    try {
      final response = await _dio.post('/projects/$projectId/leader');

      if (response.statusCode == 200 && response.data != null) {
        return response.data['message'] ?? 'Successfully became leader';
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error:
              'Failed to become leader (Status code: ${response.statusCode})',
          type: DioExceptionType.badResponse,
        );
      }
    } on DioException catch (e) {
      log('Become leader failed: ${e.response?.data ?? e.message}');
      throw e;
    } catch (e) {
      log('Become leader failed unexpectedly: $e');
      throw Exception('An unexpected error occurred while becoming leader: $e');
    }
  }

  @override
  Future<String> vote(int projectId, String type) async {
    try {
      final response = await _dio.patch('/projects/$projectId/vote/$type');

      if (response.statusCode == 200 && response.data != null) {
        // Assuming the backend returns a JSON with a 'message' field on success
        return response.data['message'] ?? 'Vote successful';
      } else {
        // Throw an exception for non-200 status codes
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error:
              'Failed to vote on project (Status code: ${response.statusCode})',
          type: DioExceptionType.badResponse,
        );
      }
    } on DioException catch (e) {
      // Re-throw DioException to potentially capture backend error messages
      log('Vote failed: ${e.response?.data ?? e.message}');
      throw e;
    } catch (e) {
      // Catch any other unexpected errors
      log('Vote failed unexpectedly: $e');
      throw Exception('An unexpected error occurred during voting: $e');
    }
  }
}

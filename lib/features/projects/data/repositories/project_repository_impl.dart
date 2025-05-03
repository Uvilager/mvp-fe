import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mvp_fe/core/network/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/project.dart';
import '../../domain/models/volunteer_project_data.dart';
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
  Future<List<Project>> getProjectsBySponsor(int sponsorId) async {
    try {
      final response = await _dio.get(
        '/projects',
        queryParameters: {'sponsor_id': sponsorId},
      );

      if (response.statusCode == 200) {
        final List<dynamic> projectsData = response.data['data']['data'];
        return projectsData.map((json) => Project.fromJson(json)).toList();
      }

      throw Exception('Failed to load projects by sponsor');
    } catch (e) {
      throw Exception('Failed to load projects by sponsor: $e');
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
      rethrow;
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
      rethrow;
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
        return response.data['message'] ?? 'Vote successful';
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'Failed to vote (Status code: ${response.statusCode})',
          type: DioExceptionType.badResponse,
        );
      }
    } on DioException catch (e) {
      log('Vote failed: ${e.response?.data ?? e.message}');
      rethrow;
    } catch (e) {
      log('Vote failed unexpectedly: $e');
      throw Exception('An unexpected error occurred while voting: $e');
    }
  }

  @override
  Future<VolunteerProjectData> getVolunteerProject(int projectId) async {
    try {
      final response = await _dio.get('/volunteer/$projectId');

      if (response.statusCode == 200) {
        return VolunteerProjectData.fromJson(response.data['data']);
      }

      throw Exception('Failed to load volunteer project data');
    } catch (e) {
      throw Exception('Failed to load volunteer project data: $e');
    }
  }

  @override
  Future<String> sendMessage(int projectId, String message) async {
    try {
      final response = await _dio.post(
        '/volunteer/$projectId/message',
        data: {'message': message},
      );

      if (response.statusCode == 201 && response.data != null) {
        return response.data['message'] ?? 'Message sent successfully';
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'Failed to send message (Status code: ${response.statusCode})',
          type: DioExceptionType.badResponse,
        );
      }
    } on DioException catch (e) {
      log('Send message failed: ${e.response?.data ?? e.message}');
      rethrow;
    } catch (e) {
      log('Send message failed unexpectedly: $e');
      throw Exception('An unexpected error occurred while sending message: $e');
    }
  }

  @override
  Future<String> deleteMessage(int projectId, int messageId) async {
    try {
      final response = await _dio.delete('/volunteer/$projectId/message/$messageId');

      if (response.statusCode == 200 && response.data != null) {
        return response.data['message'] ?? 'Message deleted successfully';
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'Failed to delete message (Status code: ${response.statusCode})',
          type: DioExceptionType.badResponse,
        );
      }
    } on DioException catch (e) {
      log('Delete message failed: ${e.response?.data ?? e.message}');
      rethrow;
    } catch (e) {
      log('Delete message failed unexpectedly: $e');
      throw Exception('An unexpected error occurred while deleting message: $e');
    }
  }

  @override
  Future<String> completeProject(int projectId) async {
    try {
      final response = await _dio.patch('/volunteer/$projectId/complete');

      if (response.statusCode == 200 && response.data != null) {
        return response.data['message'] ?? 'Project completed successfully';
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'Failed to complete project (Status code: ${response.statusCode})',
          type: DioExceptionType.badResponse,
        );
      }
    } on DioException catch (e) {
      log('Complete project failed: ${e.response?.data ?? e.message}');
      rethrow;
    } catch (e) {
      log('Complete project failed unexpectedly: $e');
      throw Exception('An unexpected error occurred while completing project: $e');
    }
  }

  @override
  Future<String> cancelProject(int projectId) async {
    try {
      final response = await _dio.patch('/volunteer/$projectId/cancel');

      if (response.statusCode == 200 && response.data != null) {
        return response.data['message'] ?? 'Project cancelled successfully';
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'Failed to cancel project (Status code: ${response.statusCode})',
          type: DioExceptionType.badResponse,
        );
      }
    } on DioException catch (e) {
      log('Cancel project failed: ${e.response?.data ?? e.message}');
      rethrow;
    } catch (e) {
      log('Cancel project failed unexpectedly: $e');
      throw Exception('An unexpected error occurred while cancelling project: $e');
    }
  }

  @override
  Future<String> markVolunteerPresent(int projectId, int volunteerId) async {
    try {
      final response = await _dio.patch(
        '/volunteer/$projectId/present/$volunteerId',
      );

      if (response.statusCode == 200 && response.data != null) {
        return response.data['message'] ?? 'Volunteer marked as present successfully';
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'Failed to mark volunteer present (Status code: ${response.statusCode})',
          type: DioExceptionType.badResponse,
        );
      }
    } on DioException catch (e) {
      log('Mark volunteer present failed: ${e.response?.data ?? e.message}');
      rethrow;
    } catch (e) {
      log('Mark volunteer present failed unexpectedly: $e');
      throw Exception('An unexpected error occurred while marking volunteer present: $e');
    }
  }
}

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
        queryParameters: {
          'page': page,
          'per_page': perPage,
        },
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
  Future<void> volunteer(int projectId) async {
    try {
      final response = await _dio.post('/projects/$projectId/volunteer');

      if (response.statusCode != 200) {
        throw Exception('Failed to volunteer for project');
      }
    } catch (e) {
      throw Exception('Failed to volunteer for project: $e');
    }
  }

  @override
  Future<void> becomeLeader(int projectId) async {
    try {
      final response = await _dio.post('/projects/$projectId/leader');

      if (response.statusCode != 200) {
        throw Exception('Failed to become project leader');
      }
    } catch (e) {
      throw Exception('Failed to become project leader: $e');
    }
  }

  @override
  Future<void> vote(int projectId, String type) async {
    try {
      final response = await _dio.patch('/projects/$projectId/vote/$type');

      if (response.statusCode != 200) {
        throw Exception('Failed to vote on project');
      }
    } catch (e) {
      throw Exception('Failed to vote on project: $e');
    }
  }
} 
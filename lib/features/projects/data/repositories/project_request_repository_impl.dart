import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/dio_provider.dart';
import '../../domain/models/simple_district.dart';
import '../../domain/models/simple_project_request.dart';
import '../../domain/repositories/project_request_repository.dart';

class ProjectRequestRepositoryImpl implements ProjectRequestRepository {
  final Dio _dio;

  ProjectRequestRepositoryImpl(this._dio);

  @override
  Future<List<District>> getDistricts() async {
    try {
      final response = await _dio.get('/districts');
      final List<dynamic> data = response.data['data'] ?? response.data;
      
      return data.map((json) => District.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load districts: $e');
    }
  }

  @override
  Future<ProjectRequestResponse> submitProjectRequest(ProjectRequest request) async {
    try {
      FormData formData = FormData.fromMap({
        'district_id': request.districtId,
        'title': request.title,
        'description': request.description,
        if (request.startDate != null) 'start_date': request.startDate!.toIso8601String().split('T')[0],
        if (request.endDate != null) 'end_date': request.endDate!.toIso8601String().split('T')[0],
        if (request.minUsers != null) 'min_users': request.minUsers,
        if (request.maxUsers != null) 'max_users': request.maxUsers,
        if (request.budget != null) 'budget': request.budget,
      });

      // Add media files if any
      if (request.mediaFiles != null && request.mediaFiles!.isNotEmpty) {
        for (int i = 0; i < request.mediaFiles!.length; i++) {
          final file = request.mediaFiles![i];
          formData.files.add(MapEntry(
            'media[]',
            await MultipartFile.fromFile(file.path),
          ));
        }
      }

      final response = await _dio.post('/project-requests', data: formData);
      
      // Handle successful response (status 201)
      if (response.statusCode == 201) {
        // Create a mock response object for successful submission
        return ProjectRequestResponse(
          id: 0, // Temporary ID since we don't get one back
          organizerId: 0, // Temporary organizer ID
          title: request.title,
          description: request.description,
          status: 'pending',
          districtId: request.districtId,
          startDate: request.startDate,
          endDate: request.endDate,
          minUsers: request.minUsers,
          maxUsers: request.maxUsers,
          budget: request.budget,
          media: [],
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
      }
      
      // Fallback to parsing data if response structure is different
      return ProjectRequestResponse.fromJson(response.data['data'] ?? response.data);
    } catch (e) {
      // Check if it's a DioException with response data
      if (e is DioException && e.response != null) {
        final responseData = e.response!.data;
        
        // If it's actually a successful response (status 201) but caught as exception
        if (e.response!.statusCode == 201) {
          return ProjectRequestResponse(
            id: 0,
            organizerId: 0,
            title: request.title,
            description: request.description,
            status: 'pending',
            districtId: request.districtId,
            startDate: request.startDate,
            endDate: request.endDate,
            minUsers: request.minUsers,
            maxUsers: request.maxUsers,
            budget: request.budget,
            media: [],
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          );
        }
        
        // Handle validation errors
        if (e.response!.statusCode == 422 && responseData is Map) {
          final errors = responseData['errors'] as Map<String, dynamic>?;
          if (errors != null) {
            final errorMessages = <String>[];
            errors.forEach((key, value) {
              if (value is List) {
                errorMessages.addAll(value.cast<String>());
              } else {
                errorMessages.add(value.toString());
              }
            });
            throw Exception('Validation errors: ${errorMessages.join(', ')}');
          }
        }
        
        throw Exception('Failed to submit project request: ${responseData['message'] ?? e.message}');
      }
      
      throw Exception('Failed to submit project request: $e');
    }
  }

  @override
  Future<List<ProjectRequestResponse>> getProjectRequests() async {
    try {
      final response = await _dio.get('/project-requests');
      final List<dynamic> data = response.data['data'] ?? response.data;
      
      return data.map((json) => ProjectRequestResponse.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load project requests: $e');
    }
  }

  @override
  Future<ProjectRequestResponse> getProjectRequest(int id) async {
    try {
      final response = await _dio.get('/project-requests/$id');
      return ProjectRequestResponse.fromJson(response.data['data'] ?? response.data);
    } catch (e) {
      throw Exception('Failed to load project request: $e');
    }
  }
}

// Provider for the repository
final projectRequestRepositoryProvider = Provider<ProjectRequestRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return ProjectRequestRepositoryImpl(dio);
}); 
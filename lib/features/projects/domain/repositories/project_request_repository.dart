import '../models/simple_district.dart';
import '../models/simple_project_request.dart';

abstract class ProjectRequestRepository {
  Future<List<District>> getDistricts();
  Future<ProjectRequestResponse> submitProjectRequest(ProjectRequest request);
  Future<List<ProjectRequestResponse>> getProjectRequests();
  Future<ProjectRequestResponse> getProjectRequest(int id);
} 
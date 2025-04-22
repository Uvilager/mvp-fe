import '../models/project.dart';

abstract class ProjectRepository {
  Future<List<Project>> getProjects({required int page, required int perPage});

  Future<Project> getProject(int id);

  Future<String> volunteer(int projectId); // Changed return type

  Future<String> becomeLeader(int projectId); // Changed return type

  Future<String> vote(
    int projectId,
    String type,
  ); // Changed return type to Future<String>
}

import '../models/project.dart';

abstract class ProjectRepository {
  Future<List<Project>> getProjects({
    required int page,
    required int perPage,
  });

  Future<Project> getProject(int id);

  Future<void> volunteer(int projectId);

  Future<void> becomeLeader(int projectId);

  Future<void> vote(int projectId, String type);
} 
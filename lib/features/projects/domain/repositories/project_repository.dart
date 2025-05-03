import '../models/project.dart';
import '../models/volunteer_project_data.dart';

abstract class ProjectRepository {
  Future<List<Project>> getProjects({required int page, required int perPage});

  Future<Project> getProject(int id);

  Future<List<Project>> getProjectsBySponsor(int sponsorId);

  Future<String> volunteer(int projectId); // Changed return type

  Future<String> becomeLeader(int projectId); // Changed return type

  Future<String> vote(
    int projectId,
    String type,
  ); // Changed return type to Future<String>

  // New methods for volunteer project functionality
  Future<VolunteerProjectData> getVolunteerProject(int projectId);

  Future<String> sendMessage(int projectId, String message);

  Future<String> deleteMessage(int projectId, int messageId);

  Future<String> completeProject(int projectId);

  Future<String> cancelProject(int projectId);

  Future<String> markVolunteerPresent(int projectId, int volunteerId);
}

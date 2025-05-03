import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mvp_fe/features/projects/domain/models/project.dart';

part 'user_project_status.freezed.dart';
part 'user_project_status.g.dart';

@freezed
abstract class UserProjectStatus with _$UserProjectStatus {
  const factory UserProjectStatus({
    required int id,
    @JsonKey(name: 'project_id') required int projectId,
    Project? project, // Make the nested project object nullable
    @JsonKey(name: 'user_id') required int userId,
    required String status,
    String? message,
    required String date, // Assuming date is always present
    int? attendance, // Add attendance field
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _UserProjectStatus;

  factory UserProjectStatus.fromJson(Map<String, dynamic> json) =>
      _$UserProjectStatusFromJson(json);
}

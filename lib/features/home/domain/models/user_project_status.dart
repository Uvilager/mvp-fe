import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_project_status.freezed.dart';
part 'user_project_status.g.dart';

@freezed
abstract class UserProjectStatus with _$UserProjectStatus {
  const factory UserProjectStatus({
    required int id,
    @JsonKey(name: 'project_id') required int projectId,
    @JsonKey(name: 'user_id') required int userId,
    required String status,
    String? message,
    required String date, // Assuming date is always present
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _UserProjectStatus;

  factory UserProjectStatus.fromJson(Map<String, dynamic> json) =>
      _$UserProjectStatusFromJson(json);
}

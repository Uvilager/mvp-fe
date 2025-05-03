import 'package:freezed_annotation/freezed_annotation.dart';

part 'sponsor_project.freezed.dart';
part 'sponsor_project.g.dart';

@freezed
sealed class SponsorProject with _$SponsorProject {
  const factory SponsorProject({
    required int id,
    required String title,
    required String description,
    String? body,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String endDate,
    @JsonKey(name: 'max_users') required int maxUsers,
    @JsonKey(name: 'min_users') required int minUsers,
    required String status,
    @JsonKey(name: 'project_url') String? projectUrl,
    required int upvotes,
    required int downvotes,
    required String budget,
    @JsonKey(name: 'points_earned') required int pointsEarned,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    String? district,
  }) = _SponsorProject;

  factory SponsorProject.fromJson(Map<String, dynamic> json) =>
      _$SponsorProjectFromJson(json);
} 
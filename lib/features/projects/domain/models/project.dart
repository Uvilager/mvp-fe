import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'organizer.dart';
import 'tag.dart';
import 'sponsor.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
sealed class Project with _$Project {
  const factory Project({
    required int id,
    required String title,
    required String description,
    String? body,
    @JsonKey(name: 'start_date') required DateTime startDate,
    @JsonKey(name: 'end_date') required DateTime endDate,
    @JsonKey(name: 'max_users') required int maxUsers,
    @JsonKey(name: 'min_users') required int minUsers,
    required String status,
    @JsonKey(name: 'project_url') String? projectUrl,
    required int upvotes,
    required int downvotes,
    required String budget,
    @JsonKey(name: 'points_earned') required int pointsEarned,
    required Organizer organizer,
    required List<Tag> tags,
    required List<Sponsor> sponsors,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);
} 
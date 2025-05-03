import 'package:freezed_annotation/freezed_annotation.dart';

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
    Organizer? organizer,
    List<Tag>? tags,
    List<Sponsor>? sponsors,
    @JsonKey(name: 'created_at', fromJson: _parseDateTime) required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: _parseDateTime) required DateTime updatedAt,
    // Added fields based on backend comparison
    String? district,
    @JsonKey(name: 'has_user_voted') bool? hasUserVoted,
    @JsonKey(name: 'is_user_volunteer') bool? isUserVolunteer,
    @JsonKey(name: 'volunteers_count') int? volunteersCount,
    @JsonKey(name: 'leaders_count') int? leadersCount,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}

// Helper function to parse datetime strings with or without timezone info
DateTime _parseDateTime(dynamic value) {
  if (value == null) return DateTime.now();
  
  String dateString = value.toString();
  
  // If the string doesn't contain 'T' or 'Z', it's probably in Laravel's default format
  if (!dateString.contains('T') && !dateString.contains('Z')) {
    // Laravel default format: "2025-06-15 20:23:24"
    // Add 'T' to make it ISO 8601 compliant and assume UTC
    if (dateString.contains(' ')) {
      dateString = dateString.replaceFirst(' ', 'T') + 'Z';
    }
  }
  
  try {
    return DateTime.parse(dateString);
  } catch (e) {
    // Fallback to current time if parsing fails
    return DateTime.now();
  }
}

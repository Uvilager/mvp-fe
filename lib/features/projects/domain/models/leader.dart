import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mvp_fe/features/auth/domain/models/user.dart';
import 'package:mvp_fe/features/projects/domain/models/project.dart';

part 'leader.freezed.dart';
part 'leader.g.dart';

@freezed
sealed class Leader with _$Leader {
  const factory Leader({
    required int id,
    @JsonKey(name: 'project_id') int? projectId,
    Project? project, // Add the nested project object (optional for now)
    required String status,
    String? message,
    @JsonKey(name: 'date', fromJson: _parseDateTimeNullable) DateTime? date,
    @JsonKey(name: 'created_at', fromJson: _parseDateTimeNullable) DateTime? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _parseDateTimeNullable) DateTime? updatedAt,
    User? user, // Will be loaded when needed
  }) = _Leader;

  factory Leader.fromJson(Map<String, dynamic> json) =>
      _$LeaderFromJson(json);
}

// Helper function to parse nullable datetime strings
DateTime? _parseDateTimeNullable(dynamic value) {
  if (value == null) return null;
  
  String dateString = value.toString();
  
  // If the string doesn't contain 'T' or 'Z', it's probably in Laravel's default format
  if (!dateString.contains('T') && !dateString.contains('Z')) {
    // Laravel default format: "2025-06-15 20:23:24"
    // Add 'T' to make it ISO 8601 compatible
    dateString = dateString.replaceFirst(' ', 'T');
    // Add 'Z' to indicate UTC
    if (!dateString.endsWith('Z')) {
      dateString += 'Z';
    }
  }
  
  try {
    return DateTime.parse(dateString);
  } catch (e) {
    // Return null if parsing fails
    return null;
  }
} 
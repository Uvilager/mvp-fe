import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mvp_fe/features/auth/domain/models/user.dart';

part 'volunteer.freezed.dart';
part 'volunteer.g.dart';

@freezed
sealed class Volunteer with _$Volunteer {
  const factory Volunteer({
    required int id,
    @JsonKey(name: 'project_id') required int projectId,
    @JsonKey(name: 'user_id') required int userId,
    required String status,
    String? message,
    @JsonKey(name: 'date', fromJson: _parseDateTimeNullable) DateTime? date,
    @JsonKey(name: 'created_at', fromJson: _parseDateTimeNullable) DateTime? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _parseDateTimeNullable) DateTime? updatedAt,
    @JsonKey(name: 'attendance', fromJson: _parseAttendance) bool? attendance, // Attendance status
    User? user, // Will be loaded when needed
  }) = _Volunteer;

  factory Volunteer.fromJson(Map<String, dynamic> json) =>
      _$VolunteerFromJson(json);
}

// Helper function to parse attendance (handles both int and bool)
bool? _parseAttendance(dynamic value) {
  if (value == null) return null;
  
  if (value is bool) return value;
  if (value is int) return value == 1;
  if (value is String) {
    if (value == '1' || value.toLowerCase() == 'true') return true;
    if (value == '0' || value.toLowerCase() == 'false') return false;
  }
  
  return null;
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
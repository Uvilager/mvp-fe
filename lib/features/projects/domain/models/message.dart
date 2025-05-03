import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mvp_fe/features/auth/domain/models/user.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
sealed class Message with _$Message {
  const factory Message({
    required int id,
    required String message,
    @JsonKey(name: 'created_at', fromJson: _parseDateTime) required DateTime createdAt,
    User? user, // Will be loaded when needed
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}

// Helper function to parse datetime strings with or without timezone info
DateTime _parseDateTime(dynamic value) {
  if (value == null) return DateTime.now();
  
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
    // Fallback to current time if parsing fails
    return DateTime.now();
  }
} 
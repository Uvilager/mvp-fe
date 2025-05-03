import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag.freezed.dart';
part 'tag.g.dart';

@freezed
sealed class Tag with _$Tag {
  const factory Tag({
    required int id,
    required String name,
    // Removed slug as it's not in the backend model
    // required String slug,
    // Added timestamps from backend model
    @JsonKey(name: 'created_at', fromJson: _parseDateTimeNullable) DateTime? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _parseDateTimeNullable) DateTime? updatedAt,
  }) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}

// Helper function to parse nullable datetime strings
DateTime? _parseDateTimeNullable(dynamic value) {
  if (value == null) return null;
  
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
    // Return null if parsing fails for nullable fields
    return null;
  }
}

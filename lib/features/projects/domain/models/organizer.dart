import 'package:freezed_annotation/freezed_annotation.dart';

part 'organizer.freezed.dart';
part 'organizer.g.dart';

@freezed
sealed class Organizer with _$Organizer {
  const factory Organizer({
    required int id,
    String? district, // Added field
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String username,
    required String phone,
    required String email,
    required String city,
    required String address,
    @JsonKey(name: 'postal_code') required String postalCode,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'created_at', fromJson: _parseDateTime) required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: _parseDateTime) required DateTime updatedAt,
  }) = _Organizer;

  factory Organizer.fromJson(Map<String, dynamic> json) =>
      _$OrganizerFromJson(json);
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

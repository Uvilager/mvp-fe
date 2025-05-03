import 'package:freezed_annotation/freezed_annotation.dart';

part 'sponsor.freezed.dart';
part 'sponsor.g.dart';

@freezed
sealed class Sponsor with _$Sponsor {
  const factory Sponsor({
    required int id,
    // Renamed from name
    required String title,
    // Renamed from websiteUrl and added JsonKey
    @JsonKey(name: 'website') required String website,
    @JsonKey(name: 'logo_url') required String logoUrl,
    // Added missing fields
    String? description,
    required String status,
    @JsonKey(name: 'contact_phone') String? contactPhone,
    @JsonKey(name: 'contact_email') String? contactEmail,
    @JsonKey(name: 'campaign_url') String? campaignUrl,
    String? body,
    @JsonKey(name: 'started_at', fromJson: _parseDateTimeNullable) DateTime? startedAt,
    @JsonKey(name: 'ended_at', fromJson: _parseDateTimeNullable) DateTime? endedAt,
    int? order,
    @JsonKey(name: 'created_at', fromJson: _parseDateTimeNullable) DateTime? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _parseDateTimeNullable) DateTime? updatedAt,
  }) = _Sponsor;

  factory Sponsor.fromJson(Map<String, dynamic> json) =>
      _$SponsorFromJson(json);
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

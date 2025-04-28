import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

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
    @JsonKey(name: 'started_at') DateTime? startedAt,
    @JsonKey(name: 'ended_at') DateTime? endedAt,
    int? order,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Sponsor;

  factory Sponsor.fromJson(Map<String, dynamic> json) =>
      _$SponsorFromJson(json);
}

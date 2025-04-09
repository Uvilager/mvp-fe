import 'package:freezed_annotation/freezed_annotation.dart';

part 'sponsor.freezed.dart';
part 'sponsor.g.dart';

@freezed
sealed class Sponsor with _$Sponsor {
  const factory Sponsor({
    required int id,
    required String title,
    required String description,
    required String website,
    required String status,
    @JsonKey(name: 'contact_phone') required String contactPhone,
    @JsonKey(name: 'contact_email') required String contactEmail,
    @JsonKey(name: 'logo_url') required String logoUrl,
    @JsonKey(name: 'campaign_url') required String campaignUrl,
    required String body,
    required int order,
    @JsonKey(name: 'started_at') required DateTime startedAt,
    @JsonKey(name: 'ended_at') DateTime? endedAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Sponsor;

  factory Sponsor.fromJson(Map<String, dynamic> json) =>
      _$SponsorFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'sponsor.dart';
import 'sponsor_project.dart';

part 'sponsor_detail_response.freezed.dart';
part 'sponsor_detail_response.g.dart';

@freezed
sealed class SponsorDetailResponse with _$SponsorDetailResponse {
  const factory SponsorDetailResponse({
    required Sponsor sponsor,
    required List<SponsorProject> projects,
  }) = _SponsorDetailResponse;

  factory SponsorDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$SponsorDetailResponseFromJson(json);
} 
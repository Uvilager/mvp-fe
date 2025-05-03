// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsor_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SponsorDetailResponse _$SponsorDetailResponseFromJson(
  Map<String, dynamic> json,
) => _SponsorDetailResponse(
  sponsor: Sponsor.fromJson(json['sponsor'] as Map<String, dynamic>),
  projects:
      (json['projects'] as List<dynamic>)
          .map((e) => SponsorProject.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$SponsorDetailResponseToJson(
  _SponsorDetailResponse instance,
) => <String, dynamic>{
  'sponsor': instance.sponsor,
  'projects': instance.projects,
};

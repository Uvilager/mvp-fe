// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Sponsor _$SponsorFromJson(Map<String, dynamic> json) => _Sponsor(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  logoUrl: json['logoUrl'] as String,
  websiteUrl: json['websiteUrl'] as String,
);

Map<String, dynamic> _$SponsorToJson(_Sponsor instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'logoUrl': instance.logoUrl,
  'websiteUrl': instance.websiteUrl,
};

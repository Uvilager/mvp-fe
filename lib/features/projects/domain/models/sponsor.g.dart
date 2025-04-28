// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Sponsor _$SponsorFromJson(Map<String, dynamic> json) => _Sponsor(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  website: json['website'] as String,
  logoUrl: json['logo_url'] as String,
  description: json['description'] as String?,
  status: json['status'] as String,
  contactPhone: json['contact_phone'] as String?,
  contactEmail: json['contact_email'] as String?,
  campaignUrl: json['campaign_url'] as String?,
  body: json['body'] as String?,
  startedAt:
      json['started_at'] == null
          ? null
          : DateTime.parse(json['started_at'] as String),
  endedAt:
      json['ended_at'] == null
          ? null
          : DateTime.parse(json['ended_at'] as String),
  order: (json['order'] as num?)?.toInt(),
  createdAt:
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
  updatedAt:
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$SponsorToJson(_Sponsor instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'website': instance.website,
  'logo_url': instance.logoUrl,
  'description': instance.description,
  'status': instance.status,
  'contact_phone': instance.contactPhone,
  'contact_email': instance.contactEmail,
  'campaign_url': instance.campaignUrl,
  'body': instance.body,
  'started_at': instance.startedAt?.toIso8601String(),
  'ended_at': instance.endedAt?.toIso8601String(),
  'order': instance.order,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};

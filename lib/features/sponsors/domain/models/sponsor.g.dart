// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Sponsor _$SponsorFromJson(Map<String, dynamic> json) => _Sponsor(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  website: json['website'] as String,
  status: json['status'] as String,
  contactPhone: json['contact_phone'] as String,
  contactEmail: json['contact_email'] as String,
  logoUrl: json['logo_url'] as String,
  campaignUrl: json['campaign_url'] as String,
  body: json['body'] as String,
  order: (json['order'] as num).toInt(),
  startedAt: DateTime.parse(json['started_at'] as String),
  endedAt:
      json['ended_at'] == null
          ? null
          : DateTime.parse(json['ended_at'] as String),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$SponsorToJson(_Sponsor instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'website': instance.website,
  'status': instance.status,
  'contact_phone': instance.contactPhone,
  'contact_email': instance.contactEmail,
  'logo_url': instance.logoUrl,
  'campaign_url': instance.campaignUrl,
  'body': instance.body,
  'order': instance.order,
  'started_at': instance.startedAt.toIso8601String(),
  'ended_at': instance.endedAt?.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

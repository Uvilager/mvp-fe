// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fundraiser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Fundraiser _$FundraiserFromJson(Map<String, dynamic> json) => _Fundraiser(
  id: (json['id'] as num).toInt(),
  projectId: (json['project_id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  imageUrl: json['image_url'] as String?,
  type: json['type'] as String,
  status: json['status'] as String,
  startDate: DateTime.parse(json['start_date'] as String),
  endDate: DateTime.parse(json['end_date'] as String),
  goal: (json['goal'] as num).toDouble(),
  raised: (json['raised'] as num).toDouble(),
  raisedPercentage: (json['raised_percentage'] as num).toDouble(),
  uniqueCode: json['unique_code'] as String?,
  daysRemaining: (json['days_remaining'] as num).toDouble(),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$FundraiserToJson(_Fundraiser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.projectId,
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'type': instance.type,
      'status': instance.status,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
      'goal': instance.goal,
      'raised': instance.raised,
      'raised_percentage': instance.raisedPercentage,
      'unique_code': instance.uniqueCode,
      'days_remaining': instance.daysRemaining,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

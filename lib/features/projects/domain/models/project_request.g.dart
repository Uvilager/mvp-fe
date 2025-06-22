// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectRequest _$ProjectRequestFromJson(Map<String, dynamic> json) =>
    _ProjectRequest(
      districtId: (json['districtId'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      startDate:
          json['startDate'] == null
              ? null
              : DateTime.parse(json['startDate'] as String),
      endDate:
          json['endDate'] == null
              ? null
              : DateTime.parse(json['endDate'] as String),
      maxUsers: (json['maxUsers'] as num?)?.toInt(),
      minUsers: (json['minUsers'] as num?)?.toInt(),
      budget: json['budget'] as String?,
    );

Map<String, dynamic> _$ProjectRequestToJson(_ProjectRequest instance) =>
    <String, dynamic>{
      'districtId': instance.districtId,
      'title': instance.title,
      'description': instance.description,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'maxUsers': instance.maxUsers,
      'minUsers': instance.minUsers,
      'budget': instance.budget,
    };

_ProjectRequestResponse _$ProjectRequestResponseFromJson(
  Map<String, dynamic> json,
) => _ProjectRequestResponse(
  id: (json['id'] as num).toInt(),
  organizerId: (json['organizerId'] as num).toInt(),
  districtId: (json['districtId'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  startDate:
      json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
  endDate:
      json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
  maxUsers: (json['maxUsers'] as num?)?.toInt(),
  minUsers: (json['minUsers'] as num?)?.toInt(),
  budget: json['budget'] as String?,
  media: (json['media'] as List<dynamic>?)?.map((e) => e as String).toList(),
  status: json['status'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  district:
      json['district'] == null
          ? null
          : District.fromJson(json['district'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProjectRequestResponseToJson(
  _ProjectRequestResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'organizerId': instance.organizerId,
  'districtId': instance.districtId,
  'title': instance.title,
  'description': instance.description,
  'startDate': instance.startDate?.toIso8601String(),
  'endDate': instance.endDate?.toIso8601String(),
  'maxUsers': instance.maxUsers,
  'minUsers': instance.minUsers,
  'budget': instance.budget,
  'media': instance.media,
  'status': instance.status,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'district': instance.district,
};

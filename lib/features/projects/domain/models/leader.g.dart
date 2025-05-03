// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leader.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Leader _$LeaderFromJson(Map<String, dynamic> json) => _Leader(
  id: (json['id'] as num).toInt(),
  projectId: (json['project_id'] as num?)?.toInt(),
  project:
      json['project'] == null
          ? null
          : Project.fromJson(json['project'] as Map<String, dynamic>),
  status: json['status'] as String,
  message: json['message'] as String?,
  date: _parseDateTimeNullable(json['date']),
  createdAt: _parseDateTimeNullable(json['created_at']),
  updatedAt: _parseDateTimeNullable(json['updated_at']),
  user:
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LeaderToJson(_Leader instance) => <String, dynamic>{
  'id': instance.id,
  'project_id': instance.projectId,
  'project': instance.project,
  'status': instance.status,
  'message': instance.message,
  'date': instance.date?.toIso8601String(),
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'user': instance.user,
};

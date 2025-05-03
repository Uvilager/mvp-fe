// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_project_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProjectStatus _$UserProjectStatusFromJson(Map<String, dynamic> json) =>
    _UserProjectStatus(
      id: (json['id'] as num).toInt(),
      projectId: (json['project_id'] as num).toInt(),
      project:
          json['project'] == null
              ? null
              : Project.fromJson(json['project'] as Map<String, dynamic>),
      userId: (json['user_id'] as num).toInt(),
      status: json['status'] as String,
      message: json['message'] as String?,
      date: json['date'] as String,
      attendance: (json['attendance'] as num?)?.toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$UserProjectStatusToJson(_UserProjectStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.projectId,
      'project': instance.project,
      'user_id': instance.userId,
      'status': instance.status,
      'message': instance.message,
      'date': instance.date,
      'attendance': instance.attendance,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

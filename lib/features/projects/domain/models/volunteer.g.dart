// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volunteer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Volunteer _$VolunteerFromJson(Map<String, dynamic> json) => _Volunteer(
  id: (json['id'] as num).toInt(),
  projectId: (json['project_id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  status: json['status'] as String,
  message: json['message'] as String?,
  date: _parseDateTimeNullable(json['date']),
  createdAt: _parseDateTimeNullable(json['created_at']),
  updatedAt: _parseDateTimeNullable(json['updated_at']),
  attendance: _parseAttendance(json['attendance']),
  user:
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VolunteerToJson(_Volunteer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.projectId,
      'user_id': instance.userId,
      'status': instance.status,
      'message': instance.message,
      'date': instance.date?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'attendance': instance.attendance,
      'user': instance.user,
    };

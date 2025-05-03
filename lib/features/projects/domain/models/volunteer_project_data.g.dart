// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volunteer_project_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VolunteerProjectData _$VolunteerProjectDataFromJson(
  Map<String, dynamic> json,
) => _VolunteerProjectData(
  project: Project.fromJson(json['project'] as Map<String, dynamic>),
  isLeader: json['is_leader'] as bool,
  leaders:
      (json['leaders'] as List<dynamic>)
          .map((e) => Leader.fromJson(e as Map<String, dynamic>))
          .toList(),
  volunteers:
      (json['volunteers'] as List<dynamic>)
          .map((e) => Volunteer.fromJson(e as Map<String, dynamic>))
          .toList(),
  messages:
      (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$VolunteerProjectDataToJson(
  _VolunteerProjectData instance,
) => <String, dynamic>{
  'project': instance.project,
  'is_leader': instance.isLeader,
  'leaders': instance.leaders,
  'volunteers': instance.volunteers,
  'messages': instance.messages,
};

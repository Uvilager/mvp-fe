// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_volunteering.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardVolunteering _$DashboardVolunteeringFromJson(
  Map<String, dynamic> json,
) => _DashboardVolunteering(
  active:
      (json['active'] as List<dynamic>)
          .map((e) => UserProjectStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
  previous:
      (json['previous'] as List<dynamic>)
          .map((e) => UserProjectStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$DashboardVolunteeringToJson(
  _DashboardVolunteering instance,
) => <String, dynamic>{
  'active': instance.active,
  'previous': instance.previous,
};

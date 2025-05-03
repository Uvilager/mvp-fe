// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardData _$DashboardDataFromJson(Map<String, dynamic> json) =>
    _DashboardData(
      volunteering: DashboardVolunteering.fromJson(
        json['volunteering'] as Map<String, dynamic>,
      ),
      leading: json['leading'] as List<dynamic>,
      projects:
          (json['projects'] as List<dynamic>)
              .map((e) => Project.fromJson(e as Map<String, dynamic>))
              .toList(),
      leaderboard: json['leaderboard'] as List<dynamic>?,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DashboardDataToJson(_DashboardData instance) =>
    <String, dynamic>{
      'volunteering': instance.volunteering,
      'leading': instance.leading,
      'projects': instance.projects,
      'leaderboard': instance.leaderboard,
      'user': instance.user,
    };

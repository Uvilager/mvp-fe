// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsor_project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SponsorProject _$SponsorProjectFromJson(Map<String, dynamic> json) =>
    _SponsorProject(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      body: json['body'] as String?,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      maxUsers: (json['max_users'] as num).toInt(),
      minUsers: (json['min_users'] as num).toInt(),
      status: json['status'] as String,
      projectUrl: json['project_url'] as String?,
      upvotes: (json['upvotes'] as num).toInt(),
      downvotes: (json['downvotes'] as num).toInt(),
      budget: json['budget'] as String,
      pointsEarned: (json['points_earned'] as num).toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      district: json['district'] as String?,
    );

Map<String, dynamic> _$SponsorProjectToJson(_SponsorProject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'body': instance.body,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'max_users': instance.maxUsers,
      'min_users': instance.minUsers,
      'status': instance.status,
      'project_url': instance.projectUrl,
      'upvotes': instance.upvotes,
      'downvotes': instance.downvotes,
      'budget': instance.budget,
      'points_earned': instance.pointsEarned,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'district': instance.district,
    };

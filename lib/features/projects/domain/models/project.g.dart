// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Project _$ProjectFromJson(Map<String, dynamic> json) => _Project(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  body: json['body'] as String?,
  startDate: DateTime.parse(json['start_date'] as String),
  endDate: DateTime.parse(json['end_date'] as String),
  maxUsers: (json['max_users'] as num).toInt(),
  minUsers: (json['min_users'] as num).toInt(),
  status: json['status'] as String,
  projectUrl: json['project_url'] as String?,
  upvotes: (json['upvotes'] as num).toInt(),
  downvotes: (json['downvotes'] as num).toInt(),
  budget: json['budget'] as String,
  pointsEarned: (json['points_earned'] as num).toInt(),
  organizer: Organizer.fromJson(json['organizer'] as Map<String, dynamic>),
  tags:
      (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
  sponsors:
      (json['sponsors'] as List<dynamic>)
          .map((e) => Sponsor.fromJson(e as Map<String, dynamic>))
          .toList(),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$ProjectToJson(_Project instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'body': instance.body,
  'start_date': instance.startDate.toIso8601String(),
  'end_date': instance.endDate.toIso8601String(),
  'max_users': instance.maxUsers,
  'min_users': instance.minUsers,
  'status': instance.status,
  'project_url': instance.projectUrl,
  'upvotes': instance.upvotes,
  'downvotes': instance.downvotes,
  'budget': instance.budget,
  'points_earned': instance.pointsEarned,
  'organizer': instance.organizer,
  'tags': instance.tags,
  'sponsors': instance.sponsors,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

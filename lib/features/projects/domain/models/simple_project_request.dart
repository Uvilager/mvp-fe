import 'dart:io';
import 'simple_district.dart';

class ProjectRequest {
  final int districtId;
  final String title;
  final String description;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? maxUsers;
  final int? minUsers;
  final String? budget;
  final List<File>? mediaFiles;

  const ProjectRequest({
    required this.districtId,
    required this.title,
    required this.description,
    this.startDate,
    this.endDate,
    this.maxUsers,
    this.minUsers,
    this.budget,
    this.mediaFiles,
  });

  factory ProjectRequest.fromJson(Map<String, dynamic> json) {
    return ProjectRequest(
      districtId: json['district_id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      startDate: json['start_date'] != null 
          ? DateTime.parse(json['start_date'] as String)
          : null,
      endDate: json['end_date'] != null 
          ? DateTime.parse(json['end_date'] as String)
          : null,
      maxUsers: json['max_users'] as int?,
      minUsers: json['min_users'] as int?,
      budget: json['budget'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'district_id': districtId,
      'title': title,
      'description': description,
      'start_date': startDate?.toIso8601String(),
      'end_date': endDate?.toIso8601String(),
      'max_users': maxUsers,
      'min_users': minUsers,
      'budget': budget,
    };
  }
}

class ProjectRequestResponse {
  final int id;
  final int organizerId;
  final int districtId;
  final String title;
  final String description;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? maxUsers;
  final int? minUsers;
  final String? budget;
  final List<String>? media;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final District? district;

  const ProjectRequestResponse({
    required this.id,
    required this.organizerId,
    required this.districtId,
    required this.title,
    required this.description,
    this.startDate,
    this.endDate,
    this.maxUsers,
    this.minUsers,
    this.budget,
    this.media,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.district,
  });

  factory ProjectRequestResponse.fromJson(Map<String, dynamic> json) {
    return ProjectRequestResponse(
      id: json['id'] as int,
      organizerId: json['organizer_id'] as int,
      districtId: json['district_id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      startDate: json['start_date'] != null 
          ? DateTime.parse(json['start_date'] as String)
          : null,
      endDate: json['end_date'] != null 
          ? DateTime.parse(json['end_date'] as String)
          : null,
      maxUsers: json['max_users'] as int?,
      minUsers: json['min_users'] as int?,
      budget: json['budget'] as String?,
      media: json['media'] != null 
          ? List<String>.from(json['media'] as List)
          : null,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      district: json['district'] != null 
          ? District.fromJson(json['district'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'organizer_id': organizerId,
      'district_id': districtId,
      'title': title,
      'description': description,
      'start_date': startDate?.toIso8601String(),
      'end_date': endDate?.toIso8601String(),
      'max_users': maxUsers,
      'min_users': minUsers,
      'budget': budget,
      'media': media,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'district': district?.toJson(),
    };
  }
} 
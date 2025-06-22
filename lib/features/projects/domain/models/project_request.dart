import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:io';
import 'district.dart';

part 'project_request.freezed.dart';
part 'project_request.g.dart';

@freezed
class ProjectRequest with _$ProjectRequest {
  const factory ProjectRequest({
    required int districtId,
    required String title,
    required String description,
    DateTime? startDate,
    DateTime? endDate,
    int? maxUsers,
    int? minUsers,
    String? budget,
    @JsonKey(includeFromJson: false, includeToJson: false) List<File>? mediaFiles,
  }) = _ProjectRequest;

  factory ProjectRequest.fromJson(Map<String, dynamic> json) => _$ProjectRequestFromJson(json);
}

@freezed
class ProjectRequestResponse with _$ProjectRequestResponse {
  const factory ProjectRequestResponse({
    required int id,
    required int organizerId,
    required int districtId,
    required String title,
    required String description,
    DateTime? startDate,
    DateTime? endDate,
    int? maxUsers,
    int? minUsers,
    String? budget,
    List<String>? media,
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
    District? district,
  }) = _ProjectRequestResponse;

  factory ProjectRequestResponse.fromJson(Map<String, dynamic> json) => _$ProjectRequestResponseFromJson(json);
} 
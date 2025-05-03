import 'package:freezed_annotation/freezed_annotation.dart';
import 'project.dart';
import 'leader.dart';
import 'volunteer.dart';
import 'message.dart';

part 'volunteer_project_data.freezed.dart';
part 'volunteer_project_data.g.dart';

@freezed
sealed class VolunteerProjectData with _$VolunteerProjectData {
  const factory VolunteerProjectData({
    required Project project,
    @JsonKey(name: 'is_leader') required bool isLeader,
    required List<Leader> leaders,
    required List<Volunteer> volunteers,
    required List<Message> messages,
  }) = _VolunteerProjectData;

  factory VolunteerProjectData.fromJson(Map<String, dynamic> json) =>
      _$VolunteerProjectDataFromJson(json);
} 
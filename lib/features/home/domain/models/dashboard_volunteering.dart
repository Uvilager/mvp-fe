import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_project_status.dart'; // Import the status model

part 'dashboard_volunteering.freezed.dart';
part 'dashboard_volunteering.g.dart';

@freezed
abstract class DashboardVolunteering with _$DashboardVolunteering {
  const factory DashboardVolunteering({
    required List<UserProjectStatus> active,
    required List<UserProjectStatus> previous,
  }) = _DashboardVolunteering;

  factory DashboardVolunteering.fromJson(Map<String, dynamic> json) =>
      _$DashboardVolunteeringFromJson(json);
}

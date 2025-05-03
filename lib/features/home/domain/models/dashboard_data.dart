import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mvp_fe/features/auth/domain/models/user.dart'; // Import User model
import 'package:mvp_fe/features/projects/domain/models/project.dart'; // Import Project model
import 'dashboard_volunteering.dart'; // Import Volunteering model

part 'dashboard_data.freezed.dart';
part 'dashboard_data.g.dart';

@freezed
abstract class DashboardData with _$DashboardData {
  const factory DashboardData({
    required DashboardVolunteering volunteering, // Corrected spelling from API
    required List<dynamic> leading, // Use dynamic for now to avoid serialization issues
    required List<Project> projects,
    List<dynamic>? leaderboard, // Make nullable since it can be null in API response
    required User user,
  }) = _DashboardData;

  factory DashboardData.fromJson(Map<String, dynamic> json) =>
      _$DashboardDataFromJson(json);
}

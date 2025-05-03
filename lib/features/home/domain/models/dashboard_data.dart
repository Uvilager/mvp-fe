import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mvp_fe/features/auth/domain/models/user.dart'; // Import User model
import 'package:mvp_fe/features/projects/domain/models/project.dart'; // Import Project model
import 'dashboard_volunteering.dart'; // Import Volunteering model

part 'dashboard_data.freezed.dart';
part 'dashboard_data.g.dart';

@freezed
abstract class DashboardData with _$DashboardData {
  const factory DashboardData({
    required DashboardVolunteering volonteering, // Corrected spelling from API
    required List<dynamic>
    leading, // Assuming 'leading' is similar to 'volunteering' or just IDs for now
    required List<Project> projects,
    required List<dynamic>
    leaderboard, // Using dynamic for now, can refine if needed
    required User user,
  }) = _DashboardData;

  factory DashboardData.fromJson(Map<String, dynamic> json) =>
      _$DashboardDataFromJson(json);
}

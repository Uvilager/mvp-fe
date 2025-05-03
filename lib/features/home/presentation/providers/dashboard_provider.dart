import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/dashboard_repository_impl.dart'; // Import repository provider
import '../../domain/models/dashboard_data.dart'; // Import the data model

part 'dashboard_provider.g.dart';

// Provider to fetch the dashboard data
@riverpod
Future<DashboardData> dashboardData(DashboardDataRef ref) async {
  final repository = ref.watch(dashboardRepositoryProvider);
  // Keep the data alive even if not watched temporarily
  ref.keepAlive();
  return repository.getDashboardData();
}

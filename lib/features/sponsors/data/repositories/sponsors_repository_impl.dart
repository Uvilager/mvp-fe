import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mvp_fe/core/network/dio_provider.dart'; // Import the dio provider
import 'package:mvp_fe/features/sponsors/domain/models/sponsor.dart';
import 'package:mvp_fe/features/sponsors/domain/repositories/sponsors_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart'; // Import riverpod annotation

part 'sponsors_repository_impl.g.dart'; // Add part directive for generated file

// Define the provider using riverpod generator
// This function provides the SponsorsRepository (abstract type)
@riverpod
SponsorsRepository sponsorsRepository(SponsorsRepositoryRef ref) {
  // Corrected Ref type
  final dio = ref.watch(dioProvider); // Watch the dioProvider
  // It returns an instance of the implementation class
  return SponsorsRepositoryImpl(dio);
}

// The implementation class remains the same, implementing the abstract class
class SponsorsRepositoryImpl implements SponsorsRepository {
  final Dio _dio;

  // Constructor takes Dio, injected by the provider function above
  SponsorsRepositoryImpl(this._dio);

  @override
  Future<List<Sponsor>> getSponsors() async {
    try {
      // Assuming the injected Dio instance has the base URL configured
      final response = await _dio.get('/sponsors');

      if (response.statusCode == 200 && response.data != null) {
        Map<String, dynamic> responseData;
        if (response.data is Map<String, dynamic>) {
          responseData = response.data;
        } else if (response.data is String) {
          responseData =
              jsonDecode(response.data as String) as Map<String, dynamic>;
        } else {
          throw Exception(
            'Unexpected response data type: ${response.data.runtimeType}',
          );
        }

        if (responseData.containsKey('data') && responseData['data'] is List) {
          final sponsorsData = responseData['data'] as List;
          return sponsorsData
              .map(
                (sponsorJson) =>
                    Sponsor.fromJson(sponsorJson as Map<String, dynamic>),
              )
              .toList();
        } else {
          throw Exception(
            'Invalid response format: "data" key is missing or not a list.',
          );
        }
      } else {
        throw Exception(
          'Failed to load sponsors: Status code ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      print(
        'DioError fetching sponsors: ${e.message}',
      ); // TODO: Replace with proper logging
      throw Exception('Network error fetching sponsors: ${e.message}');
    } catch (e) {
      print('Error fetching sponsors: $e'); // TODO: Replace with proper logging
      throw Exception('An unexpected error occurred while loading sponsors.');
    }
  }
}

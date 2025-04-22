import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mvp_fe/core/network/dio_provider.dart';
import 'package:mvp_fe/features/fundraisers/domain/models/fundraiser.dart';
import 'package:mvp_fe/features/fundraisers/domain/repositories/fundraisers_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fundraisers_repository_impl.g.dart';

@riverpod
FundraisersRepository fundraisersRepository(FundraisersRepositoryRef ref) {
  // Corrected Ref type
  final dio = ref.watch(dioProvider);
  return FundraisersRepositoryImpl(dio);
}

class FundraisersRepositoryImpl implements FundraisersRepository {
  final Dio _dio;

  FundraisersRepositoryImpl(this._dio);

  @override
  Future<List<Fundraiser>> getFundraisers() async {
    try {
      final response = await _dio.get('/fundraisers');

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
          final fundraisersData = responseData['data'] as List;
          return fundraisersData
              .map(
                (fundraiserJson) =>
                    Fundraiser.fromJson(fundraiserJson as Map<String, dynamic>),
              )
              .toList();
        } else {
          // Handle cases where 'data' key might be missing or not a list,
          // based on the API response structure.
          // If the API directly returns a list under 'data', this check is good.
          // If the API might return an empty list directly, adjust accordingly.
          throw Exception(
            'Invalid response format: "data" key is missing or not a list.',
          );
        }
      } else {
        throw Exception(
          'Failed to load fundraisers: Status code ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      print(
        'DioError fetching fundraisers: ${e.message}',
      ); // TODO: Replace with proper logging
      throw Exception('Network error fetching fundraisers: ${e.message}');
    } catch (e) {
      print(
        'Error fetching fundraisers: $e',
      ); // TODO: Replace with proper logging
      throw Exception(
        'An unexpected error occurred while loading fundraisers.',
      );
    }
  }

  @override
  Future<Fundraiser> getFundraiser(int id) async {
    try {
      final response = await _dio.get('/fundraisers/$id');

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
        // Assuming the single fundraiser is directly under the 'data' key
        if (responseData.containsKey('data') &&
            responseData['data'] is Map<String, dynamic>) {
          return Fundraiser.fromJson(
            responseData['data'] as Map<String, dynamic>,
          );
        } else {
          throw Exception('Invalid response format for single fundraiser.');
        }
      } else {
        throw Exception(
          'Failed to load fundraiser $id: Status code ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      print(
        'DioError fetching fundraiser $id: ${e.message}',
      ); // TODO: Replace with proper logging
      throw Exception('Network error fetching fundraiser $id: ${e.message}');
    } catch (e) {
      print(
        'Error fetching fundraiser $id: $e',
      ); // TODO: Replace with proper logging
      throw Exception(
        'An unexpected error occurred while loading fundraiser $id.',
      );
    }
  }
} // Added missing closing brace for the class

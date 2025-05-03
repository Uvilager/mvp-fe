import 'package:dio/dio.dart';
import 'package:mvp_fe/core/network/dio_provider.dart';
import 'package:mvp_fe/features/auth/domain/models/user.dart';
import 'package:mvp_fe/features/auth/presentation/providers/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_provider.g.dart';

// Request models to match Laravel SettingController requirements
class UpdateSettingsRequest {
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String? phone;
  final String? city;
  final String? address;
  final String? postalCode;

  UpdateSettingsRequest({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    this.phone,
    this.city,
    this.address,
    this.postalCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'username': username,
      'email': email,
      if (phone != null) 'phone': phone,
      if (city != null) 'city': city,
      if (address != null) 'address': address,
      if (postalCode != null) 'postal_code': postalCode,
    };
  }
}

class UpdatePasswordRequest {
  final String currentPassword;
  final String password;
  final String passwordConfirmation;

  UpdatePasswordRequest({
    required this.currentPassword,
    required this.password,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() {
    return {
      'current_password': currentPassword,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
  }
}

@riverpod
class Settings extends _$Settings {
  @override
  User? build() {
    // Get the current user from auth state
    final authState = ref.watch(authProvider);
    return authState.whenOrNull(
      data: (state) => state.when(
        authenticated: (user) => user,
        unauthenticated: () => null,
      ),
    );
  }

  Future<String> updateSettings(UpdateSettingsRequest request) async {
    final dio = ref.read(dioProvider);
    
    try {
      final response = await dio.patch('/settings', data: request.toJson());
      
      if (response.statusCode == 200 && response.data != null) {
        // Update the user in auth state
        final updatedUser = User.fromJson(response.data['data']);
        ref.invalidate(authProvider);
        
        return response.data['message'] ?? 'Podaci su uspešno ažurirani';
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'Failed to update settings (Status code: ${response.statusCode})',
          type: DioExceptionType.badResponse,
        );
      }
    } on DioException catch (e) {
      print('Update settings failed: ${e.response?.data ?? e.message}');
      rethrow;
    } catch (e) {
      print('Update settings failed unexpectedly: $e');
      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<String> updatePassword(UpdatePasswordRequest request) async {
    final dio = ref.read(dioProvider);
    
    try {
      final response = await dio.patch('/settings/password', data: request.toJson());
      
      if (response.statusCode == 200 && response.data != null) {
        return response.data['message'] ?? 'Lozinka je uspešno ažurirana';
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'Failed to update password (Status code: ${response.statusCode})',
          type: DioExceptionType.badResponse,
        );
      }
    } on DioException catch (e) {
      print('Update password failed: ${e.response?.data ?? e.message}');
      rethrow;
    } catch (e) {
      print('Update password failed unexpectedly: $e');
      throw Exception('An unexpected error occurred: $e');
    }
  }
} 
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/errors/app_exception.dart';
import '../../../../core/network/dio_provider.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../domain/models/auth_request.dart';
import '../../domain/models/user.dart';
import '../../domain/repositories/auth_repository.dart';

part 'auth_repository_impl.g.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;
  final SecureStorage _storage;

  AuthRepositoryImpl({required Dio dio, required SecureStorage storage})
    : _dio = dio,
      _storage = storage;

  @override
  Future<User> login(LoginRequest request) async {
    log('Starting login process...');
    log('Request data: ${request.toJson()}');
    log('Dio base URL: ${_dio.options.baseUrl}');

    try {
      log('Making POST request to /login...');
      final response = await _dio.post(
        '/login',
        data: request.toJson(),
        options: Options(
          headers: {'Accept': 'application/json'},
          validateStatus:
              (status) => true, // Accept all status codes for debugging
        ),
      );

      log('Response received:');
      log('Status code: ${response.statusCode}');
      log('Response data: ${response.data}');
      log('Response headers: ${response.headers}');

      if (response.statusCode != 200) {
        // Create a fake DioException to reuse the error handling logic
        final dioException = DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );
        throw _handleDioException(dioException);
      }

      // Extract token from the data object
      final token = response.data['data']['token'] as String;
      await _storage.setToken(token);
      log('Token stored successfully');

      // Since we don't get user data in the login response,
      // we need to fetch it separately
      final userResponse = await _dio.get('/me');
      return User.fromJson(userResponse.data['data']);
    } on DioException catch (e) {
      log('DioException caught:');
      log('Type: ${e.type}');
      log('Message: ${e.message}');
      log('Response: ${e.response?.data}');
      log('Error: ${e.error}');
      throw _handleDioException(e);
    } on AppException {
      // Don't wrap AppExceptions (AuthException, ValidationException, etc.)
      log('AppException caught, re-throwing without wrapping');
      rethrow;
    } catch (e) {
      log('Unexpected error: $e');
      throw ServerException('Unexpected error: $e');
    }
  }

  @override
  Future<User> register(RegisterRequest request) async {
    log('Starting registration process...');
    log('Request data: ${request.toJson()}');
    log('Dio base URL: ${_dio.options.baseUrl}');

    try {
      log('Making POST request to /register...');
      final response = await _dio.post(
        '/register',
        data: request.toJson(),
        options: Options(
          headers: {'Accept': 'application/json'},
          validateStatus:
              (status) => true, // Accept all status codes for debugging
        ),
      );

      log('Response received:');
      log('Status code: ${response.statusCode}');
      log('Response data: ${response.data}');
      log('Response headers: ${response.headers}');

      if (response.statusCode != 200) {
        // Create a fake DioException to reuse the error handling logic
        final dioException = DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );
        throw _handleDioException(dioException);
      }

      // Extract token from the data object
      final token = response.data['data']['token'] as String;
      await _storage.setToken(token);
      log('Token stored successfully');

      // Extract user data from the response
      return User.fromJson(response.data['data']['user']);
    } on DioException catch (e) {
      log('DioException caught:');
      log('Type: ${e.type}');
      log('Message: ${e.message}');
      log('Response: ${e.response?.data}');
      log('Error: ${e.error}');
      throw _handleDioException(e);
    } on AppException {
      // Don't wrap AppExceptions (AuthException, ValidationException, etc.)
      log('AppException caught, re-throwing without wrapping');
      rethrow;
    } catch (e) {
      log('Unexpected error: $e');
      throw ServerException('Unexpected error: $e');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _dio.post('/logout');
    } finally {
      await _storage.deleteToken();
    }
  }

  @override
  Future<User?> getCurrentUser() async {
    try {
      final token = await _storage.getToken();
      if (token == null) return null;

      final response = await _dio.get('/me');
      log('Data: ${response.data}');
      return User.fromJson(response.data['data']);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        await _storage.deleteToken();
        return null;
      }
      throw _handleDioException(e);
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    final token = await _storage.getToken();
    return token != null;
  }

  @override
  Future<User> updateUserDetails(Map<String, dynamic> data) async {
    log('Updating user details...');
    // Filter out null or empty string values before sending,
    // as the API expects nullable fields but Dio might send empty strings otherwise.
    final filteredData = Map<String, dynamic>.from(data)..removeWhere(
      (key, value) => value == null || (value is String && value.isEmpty),
    );
    log('Filtered Data: $filteredData');

    try {
      final response = await _dio.patch(
        '/settings',
        data: filteredData, // Send filtered data
        options: Options(headers: {'Accept': 'application/json'}),
      );

      log('Update response status: ${response.statusCode}');
      log('Update response data: ${response.data}');

      if (response.statusCode != 200) {
        // Attempt to parse Laravel validation errors if status is 422
        if (response.statusCode == 422 && response.data?['errors'] != null) {
          throw ValidationException(response.data['errors']);
        }
        throw ServerException(
          'Server returned ${response.statusCode}: ${response.data}',
        );
      }

      // Assuming the response contains the updated user data under 'data' key
      return User.fromJson(response.data['data']);
    } on DioException catch (e) {
      log('DioException during update: $e');
      throw _handleDioException(e);
    } catch (e) {
      log('Unexpected error during update: $e');
      throw ServerException('Unexpected error during update: $e');
    }
  }

  AppException _handleDioException(DioException e) {
    log('_handleDioException called');
    log('Exception type: ${e.type}');
    log('Status code: ${e.response?.statusCode}');
    log('Response data: ${e.response?.data}');
    
    if (e.type == DioExceptionType.connectionTimeout) {
      return const NetworkException('Connection timeout');
    }

    if (e.response == null) {
      return const NetworkException('No internet connection');
    }

    final responseData = e.response!.data;
    log('Extracted responseData: $responseData');
    log('ResponseData type: ${responseData.runtimeType}');
    
    switch (e.response!.statusCode) {
      case 302:
        log('Handling 302 status code');
        // Handle the specific format: {status: 302, message: "Login failed.", data: "Incorrect password."}
        if (responseData is Map<String, dynamic>) {
          log('ResponseData is Map, extracting error message...');
          final dataField = responseData['data'];
          final messageField = responseData['message'];
          log('Data field: $dataField');
          log('Message field: $messageField');
          
          final errorMessage = dataField?.toString() ?? 
                              messageField?.toString() ?? 
                              'Authentication failed';
          log('Final error message: $errorMessage');
          
          final authException = AuthException(errorMessage);
          log('Created AuthException: $authException');
          return authException;
        }
        log('ResponseData is not Map, returning default AuthException');
        return const AuthException('Authentication failed');
      case 401:
        log('Handling 401 status code');
        return const AuthException('Invalid credentials');
      case 422:
        log('Handling 422 status code');
        final errors = responseData['errors'] as Map<String, dynamic>;
        return ValidationException(errors);
      default:
        log('Handling default status code: ${e.response!.statusCode}');
        // Try to extract a meaningful error message from the response
        if (responseData is Map<String, dynamic>) {
          final errorMessage = responseData['data']?.toString() ?? 
                              responseData['message']?.toString() ?? 
                              'Something went wrong';
          return ServerException(errorMessage);
        }
        return const ServerException('Something went wrong');
    }
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  final storage = ref.watch(secureStorageProvider);

  return AuthRepositoryImpl(dio: dio, storage: storage);
}

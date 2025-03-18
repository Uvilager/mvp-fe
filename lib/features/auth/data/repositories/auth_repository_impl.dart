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
  
  AuthRepositoryImpl({
    required Dio dio,
    required SecureStorage storage,
  })  : _dio = dio,
        _storage = storage;

  @override
  Future<User> login(LoginRequest request) async {
    try {
      final response = await _dio.post(
        '/login',
        data: request.toJson(),
      );

      final token = response.data['token'] as String;
      await _storage.setToken(token);

      return User.fromJson(response.data['user']);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  @override
  Future<User> register(RegisterRequest request) async {
    try {
      final response = await _dio.post(
        '/register',
        data: request.toJson(),
      );

      final token = response.data['token'] as String;
      await _storage.setToken(token);

      return User.fromJson(response.data['user']);
    } on DioException catch (e) {
      throw _handleDioException(e);
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
      return User.fromJson(response.data['user']);
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

  AppException _handleDioException(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return const NetworkException('Connection timeout');
    }

    if (e.response == null) {
      return const NetworkException('No internet connection');
    }

    switch (e.response!.statusCode) {
      case 401:
        return const AuthException('Invalid credentials');
      case 422:
        final errors = e.response!.data['errors'] as Map<String, dynamic>;
        return ValidationException(errors);
      default:
        return const ServerException('Something went wrong');
    }
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  final storage = ref.watch(secureStorageProvider);
  
  return AuthRepositoryImpl(
    dio: dio,
    storage: storage,
  );
} 
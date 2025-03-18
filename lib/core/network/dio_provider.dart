import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:developer';

import '../storage/secure_storage.dart';

part 'dio_provider.g.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorage storage;

  AuthInterceptor(this.storage);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    log('Dio Request:');
    log('URL: ${options.uri}');
    log('Method: ${options.method}');
    log('Headers: ${options.headers}');
    log('Data: ${options.data}');
    
    final token = await storage.getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    options.headers['Accept'] = 'application/json';
    handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    log('Dio Response:');
    log('Status: ${response.statusCode}');
    log('Data: ${response.data}');
    handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    log('Dio Error:');
    log('Type: ${err.type}');
    log('Message: ${err.message}');
    log('Response: ${err.response?.data}');
    handler.next(err);
  }
}

@riverpod
Dio dio(DioRef ref) {
  final storage = ref.watch(secureStorageProvider);
  
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://68.183.218.115/api',
      headers: {'Accept': 'application/json'},
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  // Add logging interceptor
  dio.interceptors.add(LogInterceptor(
    request: true,
    requestHeader: true,
    requestBody: true,
    responseHeader: true,
    responseBody: true,
    error: true,
    logPrint: (object) => log(object.toString()),
  ));

  // Add auth interceptor
  dio.interceptors.add(AuthInterceptor(storage));

  return dio;
} 
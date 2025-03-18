abstract class AppException implements Exception {
  final String message;
  const AppException(this.message);
}

class NetworkException extends AppException {
  const NetworkException(super.message);
}

class AuthException extends AppException {
  const AuthException(super.message);
}

class ValidationException extends AppException {
  final Map<String, dynamic> errors;
  const ValidationException(this.errors) : super('Validation failed');
}

class ServerException extends AppException {
  const ServerException(super.message);
} 
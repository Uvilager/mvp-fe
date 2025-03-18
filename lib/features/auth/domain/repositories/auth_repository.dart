import '../models/auth_request.dart';
import '../models/user.dart';

abstract class AuthRepository {
  Future<User> login(LoginRequest request);
  Future<User> register(RegisterRequest request);
  Future<void> logout();
  Future<User?> getCurrentUser();
  Future<bool> isAuthenticated();
} 
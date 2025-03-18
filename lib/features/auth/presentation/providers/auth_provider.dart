import 'package:mvp_fe/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/auth_request.dart';
import '../../domain/models/auth_state.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  Future<AuthState> build() async {
    final repository = ref.watch(authRepositoryProvider);
    
    // Check if user is already authenticated
    final user = await repository.getCurrentUser();
    if (user != null) {
      return AuthState.authenticated(user);
    }
    
    return const AuthState.unauthenticated();
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    
    state = await AsyncValue.guard(() async {
      final repository = ref.read(authRepositoryProvider);
      final user = await repository.login(
        LoginRequest(email: email, password: password),
      );
      return AuthState.authenticated(user);
    });
  }

  Future<void> register({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String password,
    required String passwordConfirmation,
    String? phone,
    String? city,
    String? address,
    String? postalCode,
    String? avatarUrl,
  }) async {
    state = const AsyncValue.loading();
    
    state = await AsyncValue.guard(() async {
      final repository = ref.read(authRepositoryProvider);
      final user = await repository.register(
        RegisterRequest(
          firstName: firstName,
          lastName: lastName,
          username: username,
          email: email,
          password: password,
          passwordConfirmation: passwordConfirmation,
          phone: phone,
          city: city,
          address: address,
          postalCode: postalCode,
          avatarUrl: avatarUrl,
        ),
      );
      return AuthState.authenticated(user);
    });
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    
    state = await AsyncValue.guard(() async {
      final repository = ref.read(authRepositoryProvider);
      await repository.logout();
      return const AuthState.unauthenticated();
    });
  }
} 
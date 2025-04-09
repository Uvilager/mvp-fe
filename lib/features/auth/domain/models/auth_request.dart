import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_request.freezed.dart';
part 'auth_request.g.dart';

@freezed
abstract class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String email,
    required String password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);
}

@freezed
abstract class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String username,
    required String email,
    required String password,
    @JsonKey(name: 'password_confirmation') required String passwordConfirmation,
    String? phone,
    String? city,
    String? address,
    @JsonKey(name: 'postal_code') String? postalCode,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => _$RegisterRequestFromJson(json);
} 
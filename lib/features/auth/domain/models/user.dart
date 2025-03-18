import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    String? phone,
    String? city,
    String? address,
    @JsonKey(name: 'postal_code') String? postalCode,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
} 
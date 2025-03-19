import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'organizer.freezed.dart';
part 'organizer.g.dart';

@freezed
sealed class Organizer with _$Organizer {
  const factory Organizer({
    required int id,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String username,
    required String phone,
    required String email,
    required String city,
    required String address,
    @JsonKey(name: 'postal_code') required String postalCode,
    @JsonKey(name: 'avatar_url') required String avatarUrl,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Organizer;

  factory Organizer.fromJson(Map<String, dynamic> json) => _$OrganizerFromJson(json);
} 
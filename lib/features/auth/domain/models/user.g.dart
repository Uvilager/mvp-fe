// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  username: json['username'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String?,
  city: json['city'] as String?,
  address: json['address'] as String?,
  postalCode: json['postal_code'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  emailVerifiedAt:
      json['email_verified_at'] == null
          ? null
          : DateTime.parse(json['email_verified_at'] as String),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'username': instance.username,
  'email': instance.email,
  'phone': instance.phone,
  'city': instance.city,
  'address': instance.address,
  'postal_code': instance.postalCode,
  'avatar_url': instance.avatarUrl,
  'email_verified_at': instance.emailVerifiedAt?.toIso8601String(),
};

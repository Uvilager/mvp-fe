// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Organizer _$OrganizerFromJson(Map<String, dynamic> json) => _Organizer(
  id: (json['id'] as num).toInt(),
  district: json['district'] as String?,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  username: json['username'] as String,
  phone: json['phone'] as String,
  email: json['email'] as String,
  city: json['city'] as String,
  address: json['address'] as String,
  postalCode: json['postal_code'] as String,
  avatarUrl: json['avatar_url'] as String?,
  createdAt: _parseDateTime(json['created_at']),
  updatedAt: _parseDateTime(json['updated_at']),
);

Map<String, dynamic> _$OrganizerToJson(_Organizer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'district': instance.district,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'username': instance.username,
      'phone': instance.phone,
      'email': instance.email,
      'city': instance.city,
      'address': instance.address,
      'postal_code': instance.postalCode,
      'avatar_url': instance.avatarUrl,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'volunteer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Volunteer {

 int get id;@JsonKey(name: 'project_id') int get projectId;@JsonKey(name: 'user_id') int get userId; String get status; String? get message;@JsonKey(name: 'date', fromJson: _parseDateTimeNullable) DateTime? get date;@JsonKey(name: 'created_at', fromJson: _parseDateTimeNullable) DateTime? get createdAt;@JsonKey(name: 'updated_at', fromJson: _parseDateTimeNullable) DateTime? get updatedAt;@JsonKey(name: 'attendance', fromJson: _parseAttendance) bool? get attendance;// Attendance status
 User? get user;
/// Create a copy of Volunteer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VolunteerCopyWith<Volunteer> get copyWith => _$VolunteerCopyWithImpl<Volunteer>(this as Volunteer, _$identity);

  /// Serializes this Volunteer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Volunteer&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.date, date) || other.date == date)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.attendance, attendance) || other.attendance == attendance)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,userId,status,message,date,createdAt,updatedAt,attendance,user);

@override
String toString() {
  return 'Volunteer(id: $id, projectId: $projectId, userId: $userId, status: $status, message: $message, date: $date, createdAt: $createdAt, updatedAt: $updatedAt, attendance: $attendance, user: $user)';
}


}

/// @nodoc
abstract mixin class $VolunteerCopyWith<$Res>  {
  factory $VolunteerCopyWith(Volunteer value, $Res Function(Volunteer) _then) = _$VolunteerCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'project_id') int projectId,@JsonKey(name: 'user_id') int userId, String status, String? message,@JsonKey(name: 'date', fromJson: _parseDateTimeNullable) DateTime? date,@JsonKey(name: 'created_at', fromJson: _parseDateTimeNullable) DateTime? createdAt,@JsonKey(name: 'updated_at', fromJson: _parseDateTimeNullable) DateTime? updatedAt,@JsonKey(name: 'attendance', fromJson: _parseAttendance) bool? attendance, User? user
});


$UserCopyWith<$Res>? get user;

}
/// @nodoc
class _$VolunteerCopyWithImpl<$Res>
    implements $VolunteerCopyWith<$Res> {
  _$VolunteerCopyWithImpl(this._self, this._then);

  final Volunteer _self;
  final $Res Function(Volunteer) _then;

/// Create a copy of Volunteer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? projectId = null,Object? userId = null,Object? status = null,Object? message = freezed,Object? date = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? attendance = freezed,Object? user = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,attendance: freezed == attendance ? _self.attendance : attendance // ignore: cast_nullable_to_non_nullable
as bool?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}
/// Create a copy of Volunteer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Volunteer implements Volunteer {
  const _Volunteer({required this.id, @JsonKey(name: 'project_id') required this.projectId, @JsonKey(name: 'user_id') required this.userId, required this.status, this.message, @JsonKey(name: 'date', fromJson: _parseDateTimeNullable) this.date, @JsonKey(name: 'created_at', fromJson: _parseDateTimeNullable) this.createdAt, @JsonKey(name: 'updated_at', fromJson: _parseDateTimeNullable) this.updatedAt, @JsonKey(name: 'attendance', fromJson: _parseAttendance) this.attendance, this.user});
  factory _Volunteer.fromJson(Map<String, dynamic> json) => _$VolunteerFromJson(json);

@override final  int id;
@override@JsonKey(name: 'project_id') final  int projectId;
@override@JsonKey(name: 'user_id') final  int userId;
@override final  String status;
@override final  String? message;
@override@JsonKey(name: 'date', fromJson: _parseDateTimeNullable) final  DateTime? date;
@override@JsonKey(name: 'created_at', fromJson: _parseDateTimeNullable) final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _parseDateTimeNullable) final  DateTime? updatedAt;
@override@JsonKey(name: 'attendance', fromJson: _parseAttendance) final  bool? attendance;
// Attendance status
@override final  User? user;

/// Create a copy of Volunteer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VolunteerCopyWith<_Volunteer> get copyWith => __$VolunteerCopyWithImpl<_Volunteer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VolunteerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Volunteer&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.date, date) || other.date == date)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.attendance, attendance) || other.attendance == attendance)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,userId,status,message,date,createdAt,updatedAt,attendance,user);

@override
String toString() {
  return 'Volunteer(id: $id, projectId: $projectId, userId: $userId, status: $status, message: $message, date: $date, createdAt: $createdAt, updatedAt: $updatedAt, attendance: $attendance, user: $user)';
}


}

/// @nodoc
abstract mixin class _$VolunteerCopyWith<$Res> implements $VolunteerCopyWith<$Res> {
  factory _$VolunteerCopyWith(_Volunteer value, $Res Function(_Volunteer) _then) = __$VolunteerCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'project_id') int projectId,@JsonKey(name: 'user_id') int userId, String status, String? message,@JsonKey(name: 'date', fromJson: _parseDateTimeNullable) DateTime? date,@JsonKey(name: 'created_at', fromJson: _parseDateTimeNullable) DateTime? createdAt,@JsonKey(name: 'updated_at', fromJson: _parseDateTimeNullable) DateTime? updatedAt,@JsonKey(name: 'attendance', fromJson: _parseAttendance) bool? attendance, User? user
});


@override $UserCopyWith<$Res>? get user;

}
/// @nodoc
class __$VolunteerCopyWithImpl<$Res>
    implements _$VolunteerCopyWith<$Res> {
  __$VolunteerCopyWithImpl(this._self, this._then);

  final _Volunteer _self;
  final $Res Function(_Volunteer) _then;

/// Create a copy of Volunteer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? projectId = null,Object? userId = null,Object? status = null,Object? message = freezed,Object? date = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? attendance = freezed,Object? user = freezed,}) {
  return _then(_Volunteer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,attendance: freezed == attendance ? _self.attendance : attendance // ignore: cast_nullable_to_non_nullable
as bool?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}

/// Create a copy of Volunteer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on

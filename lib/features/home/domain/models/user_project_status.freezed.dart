// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_project_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProjectStatus {

 int get id;@JsonKey(name: 'project_id') int get projectId; Project? get project;// Make the nested project object nullable
@JsonKey(name: 'user_id') int get userId; String get status; String? get message; String get date;// Assuming date is always present
 int? get attendance;// Add attendance field
@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;
/// Create a copy of UserProjectStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProjectStatusCopyWith<UserProjectStatus> get copyWith => _$UserProjectStatusCopyWithImpl<UserProjectStatus>(this as UserProjectStatus, _$identity);

  /// Serializes this UserProjectStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProjectStatus&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.project, project) || other.project == project)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.date, date) || other.date == date)&&(identical(other.attendance, attendance) || other.attendance == attendance)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,project,userId,status,message,date,attendance,createdAt,updatedAt);

@override
String toString() {
  return 'UserProjectStatus(id: $id, projectId: $projectId, project: $project, userId: $userId, status: $status, message: $message, date: $date, attendance: $attendance, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $UserProjectStatusCopyWith<$Res>  {
  factory $UserProjectStatusCopyWith(UserProjectStatus value, $Res Function(UserProjectStatus) _then) = _$UserProjectStatusCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'project_id') int projectId, Project? project,@JsonKey(name: 'user_id') int userId, String status, String? message, String date, int? attendance,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});


$ProjectCopyWith<$Res>? get project;

}
/// @nodoc
class _$UserProjectStatusCopyWithImpl<$Res>
    implements $UserProjectStatusCopyWith<$Res> {
  _$UserProjectStatusCopyWithImpl(this._self, this._then);

  final UserProjectStatus _self;
  final $Res Function(UserProjectStatus) _then;

/// Create a copy of UserProjectStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? projectId = null,Object? project = freezed,Object? userId = null,Object? status = null,Object? message = freezed,Object? date = null,Object? attendance = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as int,project: freezed == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as Project?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,attendance: freezed == attendance ? _self.attendance : attendance // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of UserProjectStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectCopyWith<$Res>? get project {
    if (_self.project == null) {
    return null;
  }

  return $ProjectCopyWith<$Res>(_self.project!, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _UserProjectStatus implements UserProjectStatus {
  const _UserProjectStatus({required this.id, @JsonKey(name: 'project_id') required this.projectId, this.project, @JsonKey(name: 'user_id') required this.userId, required this.status, this.message, required this.date, this.attendance, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _UserProjectStatus.fromJson(Map<String, dynamic> json) => _$UserProjectStatusFromJson(json);

@override final  int id;
@override@JsonKey(name: 'project_id') final  int projectId;
@override final  Project? project;
// Make the nested project object nullable
@override@JsonKey(name: 'user_id') final  int userId;
@override final  String status;
@override final  String? message;
@override final  String date;
// Assuming date is always present
@override final  int? attendance;
// Add attendance field
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;

/// Create a copy of UserProjectStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProjectStatusCopyWith<_UserProjectStatus> get copyWith => __$UserProjectStatusCopyWithImpl<_UserProjectStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProjectStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProjectStatus&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.project, project) || other.project == project)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.date, date) || other.date == date)&&(identical(other.attendance, attendance) || other.attendance == attendance)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,project,userId,status,message,date,attendance,createdAt,updatedAt);

@override
String toString() {
  return 'UserProjectStatus(id: $id, projectId: $projectId, project: $project, userId: $userId, status: $status, message: $message, date: $date, attendance: $attendance, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserProjectStatusCopyWith<$Res> implements $UserProjectStatusCopyWith<$Res> {
  factory _$UserProjectStatusCopyWith(_UserProjectStatus value, $Res Function(_UserProjectStatus) _then) = __$UserProjectStatusCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'project_id') int projectId, Project? project,@JsonKey(name: 'user_id') int userId, String status, String? message, String date, int? attendance,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});


@override $ProjectCopyWith<$Res>? get project;

}
/// @nodoc
class __$UserProjectStatusCopyWithImpl<$Res>
    implements _$UserProjectStatusCopyWith<$Res> {
  __$UserProjectStatusCopyWithImpl(this._self, this._then);

  final _UserProjectStatus _self;
  final $Res Function(_UserProjectStatus) _then;

/// Create a copy of UserProjectStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? projectId = null,Object? project = freezed,Object? userId = null,Object? status = null,Object? message = freezed,Object? date = null,Object? attendance = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_UserProjectStatus(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as int,project: freezed == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as Project?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,attendance: freezed == attendance ? _self.attendance : attendance // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of UserProjectStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectCopyWith<$Res>? get project {
    if (_self.project == null) {
    return null;
  }

  return $ProjectCopyWith<$Res>(_self.project!, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}

// dart format on

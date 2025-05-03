// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leader.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Leader {

 int get id;@JsonKey(name: 'project_id') int? get projectId; Project? get project;// Add the nested project object (optional for now)
 String get status; String? get message;@JsonKey(name: 'date', fromJson: _parseDateTimeNullable) DateTime? get date;@JsonKey(name: 'created_at', fromJson: _parseDateTimeNullable) DateTime? get createdAt;@JsonKey(name: 'updated_at', fromJson: _parseDateTimeNullable) DateTime? get updatedAt; User? get user;
/// Create a copy of Leader
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaderCopyWith<Leader> get copyWith => _$LeaderCopyWithImpl<Leader>(this as Leader, _$identity);

  /// Serializes this Leader to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Leader&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.project, project) || other.project == project)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.date, date) || other.date == date)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,project,status,message,date,createdAt,updatedAt,user);

@override
String toString() {
  return 'Leader(id: $id, projectId: $projectId, project: $project, status: $status, message: $message, date: $date, createdAt: $createdAt, updatedAt: $updatedAt, user: $user)';
}


}

/// @nodoc
abstract mixin class $LeaderCopyWith<$Res>  {
  factory $LeaderCopyWith(Leader value, $Res Function(Leader) _then) = _$LeaderCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'project_id') int? projectId, Project? project, String status, String? message,@JsonKey(name: 'date', fromJson: _parseDateTimeNullable) DateTime? date,@JsonKey(name: 'created_at', fromJson: _parseDateTimeNullable) DateTime? createdAt,@JsonKey(name: 'updated_at', fromJson: _parseDateTimeNullable) DateTime? updatedAt, User? user
});


$ProjectCopyWith<$Res>? get project;$UserCopyWith<$Res>? get user;

}
/// @nodoc
class _$LeaderCopyWithImpl<$Res>
    implements $LeaderCopyWith<$Res> {
  _$LeaderCopyWithImpl(this._self, this._then);

  final Leader _self;
  final $Res Function(Leader) _then;

/// Create a copy of Leader
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? projectId = freezed,Object? project = freezed,Object? status = null,Object? message = freezed,Object? date = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? user = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as int?,project: freezed == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as Project?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}
/// Create a copy of Leader
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
}/// Create a copy of Leader
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

class _Leader implements Leader {
  const _Leader({required this.id, @JsonKey(name: 'project_id') this.projectId, this.project, required this.status, this.message, @JsonKey(name: 'date', fromJson: _parseDateTimeNullable) this.date, @JsonKey(name: 'created_at', fromJson: _parseDateTimeNullable) this.createdAt, @JsonKey(name: 'updated_at', fromJson: _parseDateTimeNullable) this.updatedAt, this.user});
  factory _Leader.fromJson(Map<String, dynamic> json) => _$LeaderFromJson(json);

@override final  int id;
@override@JsonKey(name: 'project_id') final  int? projectId;
@override final  Project? project;
// Add the nested project object (optional for now)
@override final  String status;
@override final  String? message;
@override@JsonKey(name: 'date', fromJson: _parseDateTimeNullable) final  DateTime? date;
@override@JsonKey(name: 'created_at', fromJson: _parseDateTimeNullable) final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _parseDateTimeNullable) final  DateTime? updatedAt;
@override final  User? user;

/// Create a copy of Leader
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaderCopyWith<_Leader> get copyWith => __$LeaderCopyWithImpl<_Leader>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Leader&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.project, project) || other.project == project)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.date, date) || other.date == date)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,project,status,message,date,createdAt,updatedAt,user);

@override
String toString() {
  return 'Leader(id: $id, projectId: $projectId, project: $project, status: $status, message: $message, date: $date, createdAt: $createdAt, updatedAt: $updatedAt, user: $user)';
}


}

/// @nodoc
abstract mixin class _$LeaderCopyWith<$Res> implements $LeaderCopyWith<$Res> {
  factory _$LeaderCopyWith(_Leader value, $Res Function(_Leader) _then) = __$LeaderCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'project_id') int? projectId, Project? project, String status, String? message,@JsonKey(name: 'date', fromJson: _parseDateTimeNullable) DateTime? date,@JsonKey(name: 'created_at', fromJson: _parseDateTimeNullable) DateTime? createdAt,@JsonKey(name: 'updated_at', fromJson: _parseDateTimeNullable) DateTime? updatedAt, User? user
});


@override $ProjectCopyWith<$Res>? get project;@override $UserCopyWith<$Res>? get user;

}
/// @nodoc
class __$LeaderCopyWithImpl<$Res>
    implements _$LeaderCopyWith<$Res> {
  __$LeaderCopyWithImpl(this._self, this._then);

  final _Leader _self;
  final $Res Function(_Leader) _then;

/// Create a copy of Leader
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? projectId = freezed,Object? project = freezed,Object? status = null,Object? message = freezed,Object? date = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? user = freezed,}) {
  return _then(_Leader(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as int?,project: freezed == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as Project?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}

/// Create a copy of Leader
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
}/// Create a copy of Leader
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

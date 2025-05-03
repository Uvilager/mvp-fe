// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardData {

 DashboardVolunteering get volunteering;// Corrected spelling from API
 List<dynamic> get leading;// Use dynamic for now to avoid serialization issues
 List<Project> get projects; List<dynamic>? get leaderboard;// Make nullable since it can be null in API response
 User get user;
/// Create a copy of DashboardData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardDataCopyWith<DashboardData> get copyWith => _$DashboardDataCopyWithImpl<DashboardData>(this as DashboardData, _$identity);

  /// Serializes this DashboardData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardData&&(identical(other.volunteering, volunteering) || other.volunteering == volunteering)&&const DeepCollectionEquality().equals(other.leading, leading)&&const DeepCollectionEquality().equals(other.projects, projects)&&const DeepCollectionEquality().equals(other.leaderboard, leaderboard)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,volunteering,const DeepCollectionEquality().hash(leading),const DeepCollectionEquality().hash(projects),const DeepCollectionEquality().hash(leaderboard),user);

@override
String toString() {
  return 'DashboardData(volunteering: $volunteering, leading: $leading, projects: $projects, leaderboard: $leaderboard, user: $user)';
}


}

/// @nodoc
abstract mixin class $DashboardDataCopyWith<$Res>  {
  factory $DashboardDataCopyWith(DashboardData value, $Res Function(DashboardData) _then) = _$DashboardDataCopyWithImpl;
@useResult
$Res call({
 DashboardVolunteering volunteering, List<dynamic> leading, List<Project> projects, List<dynamic>? leaderboard, User user
});


$DashboardVolunteeringCopyWith<$Res> get volunteering;$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$DashboardDataCopyWithImpl<$Res>
    implements $DashboardDataCopyWith<$Res> {
  _$DashboardDataCopyWithImpl(this._self, this._then);

  final DashboardData _self;
  final $Res Function(DashboardData) _then;

/// Create a copy of DashboardData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? volunteering = null,Object? leading = null,Object? projects = null,Object? leaderboard = freezed,Object? user = null,}) {
  return _then(_self.copyWith(
volunteering: null == volunteering ? _self.volunteering : volunteering // ignore: cast_nullable_to_non_nullable
as DashboardVolunteering,leading: null == leading ? _self.leading : leading // ignore: cast_nullable_to_non_nullable
as List<dynamic>,projects: null == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as List<Project>,leaderboard: freezed == leaderboard ? _self.leaderboard : leaderboard // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}
/// Create a copy of DashboardData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardVolunteeringCopyWith<$Res> get volunteering {
  
  return $DashboardVolunteeringCopyWith<$Res>(_self.volunteering, (value) {
    return _then(_self.copyWith(volunteering: value));
  });
}/// Create a copy of DashboardData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _DashboardData implements DashboardData {
  const _DashboardData({required this.volunteering, required final  List<dynamic> leading, required final  List<Project> projects, final  List<dynamic>? leaderboard, required this.user}): _leading = leading,_projects = projects,_leaderboard = leaderboard;
  factory _DashboardData.fromJson(Map<String, dynamic> json) => _$DashboardDataFromJson(json);

@override final  DashboardVolunteering volunteering;
// Corrected spelling from API
 final  List<dynamic> _leading;
// Corrected spelling from API
@override List<dynamic> get leading {
  if (_leading is EqualUnmodifiableListView) return _leading;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_leading);
}

// Use dynamic for now to avoid serialization issues
 final  List<Project> _projects;
// Use dynamic for now to avoid serialization issues
@override List<Project> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}

 final  List<dynamic>? _leaderboard;
@override List<dynamic>? get leaderboard {
  final value = _leaderboard;
  if (value == null) return null;
  if (_leaderboard is EqualUnmodifiableListView) return _leaderboard;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// Make nullable since it can be null in API response
@override final  User user;

/// Create a copy of DashboardData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardDataCopyWith<_DashboardData> get copyWith => __$DashboardDataCopyWithImpl<_DashboardData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardData&&(identical(other.volunteering, volunteering) || other.volunteering == volunteering)&&const DeepCollectionEquality().equals(other._leading, _leading)&&const DeepCollectionEquality().equals(other._projects, _projects)&&const DeepCollectionEquality().equals(other._leaderboard, _leaderboard)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,volunteering,const DeepCollectionEquality().hash(_leading),const DeepCollectionEquality().hash(_projects),const DeepCollectionEquality().hash(_leaderboard),user);

@override
String toString() {
  return 'DashboardData(volunteering: $volunteering, leading: $leading, projects: $projects, leaderboard: $leaderboard, user: $user)';
}


}

/// @nodoc
abstract mixin class _$DashboardDataCopyWith<$Res> implements $DashboardDataCopyWith<$Res> {
  factory _$DashboardDataCopyWith(_DashboardData value, $Res Function(_DashboardData) _then) = __$DashboardDataCopyWithImpl;
@override @useResult
$Res call({
 DashboardVolunteering volunteering, List<dynamic> leading, List<Project> projects, List<dynamic>? leaderboard, User user
});


@override $DashboardVolunteeringCopyWith<$Res> get volunteering;@override $UserCopyWith<$Res> get user;

}
/// @nodoc
class __$DashboardDataCopyWithImpl<$Res>
    implements _$DashboardDataCopyWith<$Res> {
  __$DashboardDataCopyWithImpl(this._self, this._then);

  final _DashboardData _self;
  final $Res Function(_DashboardData) _then;

/// Create a copy of DashboardData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? volunteering = null,Object? leading = null,Object? projects = null,Object? leaderboard = freezed,Object? user = null,}) {
  return _then(_DashboardData(
volunteering: null == volunteering ? _self.volunteering : volunteering // ignore: cast_nullable_to_non_nullable
as DashboardVolunteering,leading: null == leading ? _self._leading : leading // ignore: cast_nullable_to_non_nullable
as List<dynamic>,projects: null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<Project>,leaderboard: freezed == leaderboard ? _self._leaderboard : leaderboard // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of DashboardData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardVolunteeringCopyWith<$Res> get volunteering {
  
  return $DashboardVolunteeringCopyWith<$Res>(_self.volunteering, (value) {
    return _then(_self.copyWith(volunteering: value));
  });
}/// Create a copy of DashboardData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on

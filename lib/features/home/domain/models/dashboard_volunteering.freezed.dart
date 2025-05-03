// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_volunteering.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardVolunteering {

 List<UserProjectStatus> get active; List<UserProjectStatus> get previous;
/// Create a copy of DashboardVolunteering
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardVolunteeringCopyWith<DashboardVolunteering> get copyWith => _$DashboardVolunteeringCopyWithImpl<DashboardVolunteering>(this as DashboardVolunteering, _$identity);

  /// Serializes this DashboardVolunteering to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardVolunteering&&const DeepCollectionEquality().equals(other.active, active)&&const DeepCollectionEquality().equals(other.previous, previous));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(active),const DeepCollectionEquality().hash(previous));

@override
String toString() {
  return 'DashboardVolunteering(active: $active, previous: $previous)';
}


}

/// @nodoc
abstract mixin class $DashboardVolunteeringCopyWith<$Res>  {
  factory $DashboardVolunteeringCopyWith(DashboardVolunteering value, $Res Function(DashboardVolunteering) _then) = _$DashboardVolunteeringCopyWithImpl;
@useResult
$Res call({
 List<UserProjectStatus> active, List<UserProjectStatus> previous
});




}
/// @nodoc
class _$DashboardVolunteeringCopyWithImpl<$Res>
    implements $DashboardVolunteeringCopyWith<$Res> {
  _$DashboardVolunteeringCopyWithImpl(this._self, this._then);

  final DashboardVolunteering _self;
  final $Res Function(DashboardVolunteering) _then;

/// Create a copy of DashboardVolunteering
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? active = null,Object? previous = null,}) {
  return _then(_self.copyWith(
active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as List<UserProjectStatus>,previous: null == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as List<UserProjectStatus>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DashboardVolunteering implements DashboardVolunteering {
  const _DashboardVolunteering({required final  List<UserProjectStatus> active, required final  List<UserProjectStatus> previous}): _active = active,_previous = previous;
  factory _DashboardVolunteering.fromJson(Map<String, dynamic> json) => _$DashboardVolunteeringFromJson(json);

 final  List<UserProjectStatus> _active;
@override List<UserProjectStatus> get active {
  if (_active is EqualUnmodifiableListView) return _active;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_active);
}

 final  List<UserProjectStatus> _previous;
@override List<UserProjectStatus> get previous {
  if (_previous is EqualUnmodifiableListView) return _previous;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_previous);
}


/// Create a copy of DashboardVolunteering
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardVolunteeringCopyWith<_DashboardVolunteering> get copyWith => __$DashboardVolunteeringCopyWithImpl<_DashboardVolunteering>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardVolunteeringToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardVolunteering&&const DeepCollectionEquality().equals(other._active, _active)&&const DeepCollectionEquality().equals(other._previous, _previous));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_active),const DeepCollectionEquality().hash(_previous));

@override
String toString() {
  return 'DashboardVolunteering(active: $active, previous: $previous)';
}


}

/// @nodoc
abstract mixin class _$DashboardVolunteeringCopyWith<$Res> implements $DashboardVolunteeringCopyWith<$Res> {
  factory _$DashboardVolunteeringCopyWith(_DashboardVolunteering value, $Res Function(_DashboardVolunteering) _then) = __$DashboardVolunteeringCopyWithImpl;
@override @useResult
$Res call({
 List<UserProjectStatus> active, List<UserProjectStatus> previous
});




}
/// @nodoc
class __$DashboardVolunteeringCopyWithImpl<$Res>
    implements _$DashboardVolunteeringCopyWith<$Res> {
  __$DashboardVolunteeringCopyWithImpl(this._self, this._then);

  final _DashboardVolunteering _self;
  final $Res Function(_DashboardVolunteering) _then;

/// Create a copy of DashboardVolunteering
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? active = null,Object? previous = null,}) {
  return _then(_DashboardVolunteering(
active: null == active ? _self._active : active // ignore: cast_nullable_to_non_nullable
as List<UserProjectStatus>,previous: null == previous ? _self._previous : previous // ignore: cast_nullable_to_non_nullable
as List<UserProjectStatus>,
  ));
}


}

// dart format on

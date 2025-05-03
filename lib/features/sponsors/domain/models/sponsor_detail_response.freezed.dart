// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sponsor_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SponsorDetailResponse {

 Sponsor get sponsor; List<SponsorProject> get projects;
/// Create a copy of SponsorDetailResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorDetailResponseCopyWith<SponsorDetailResponse> get copyWith => _$SponsorDetailResponseCopyWithImpl<SponsorDetailResponse>(this as SponsorDetailResponse, _$identity);

  /// Serializes this SponsorDetailResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsorDetailResponse&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor)&&const DeepCollectionEquality().equals(other.projects, projects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sponsor,const DeepCollectionEquality().hash(projects));

@override
String toString() {
  return 'SponsorDetailResponse(sponsor: $sponsor, projects: $projects)';
}


}

/// @nodoc
abstract mixin class $SponsorDetailResponseCopyWith<$Res>  {
  factory $SponsorDetailResponseCopyWith(SponsorDetailResponse value, $Res Function(SponsorDetailResponse) _then) = _$SponsorDetailResponseCopyWithImpl;
@useResult
$Res call({
 Sponsor sponsor, List<SponsorProject> projects
});


$SponsorCopyWith<$Res> get sponsor;

}
/// @nodoc
class _$SponsorDetailResponseCopyWithImpl<$Res>
    implements $SponsorDetailResponseCopyWith<$Res> {
  _$SponsorDetailResponseCopyWithImpl(this._self, this._then);

  final SponsorDetailResponse _self;
  final $Res Function(SponsorDetailResponse) _then;

/// Create a copy of SponsorDetailResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sponsor = null,Object? projects = null,}) {
  return _then(_self.copyWith(
sponsor: null == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as Sponsor,projects: null == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as List<SponsorProject>,
  ));
}
/// Create a copy of SponsorDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsorCopyWith<$Res> get sponsor {
  
  return $SponsorCopyWith<$Res>(_self.sponsor, (value) {
    return _then(_self.copyWith(sponsor: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _SponsorDetailResponse implements SponsorDetailResponse {
  const _SponsorDetailResponse({required this.sponsor, required final  List<SponsorProject> projects}): _projects = projects;
  factory _SponsorDetailResponse.fromJson(Map<String, dynamic> json) => _$SponsorDetailResponseFromJson(json);

@override final  Sponsor sponsor;
 final  List<SponsorProject> _projects;
@override List<SponsorProject> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}


/// Create a copy of SponsorDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorDetailResponseCopyWith<_SponsorDetailResponse> get copyWith => __$SponsorDetailResponseCopyWithImpl<_SponsorDetailResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorDetailResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsorDetailResponse&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor)&&const DeepCollectionEquality().equals(other._projects, _projects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sponsor,const DeepCollectionEquality().hash(_projects));

@override
String toString() {
  return 'SponsorDetailResponse(sponsor: $sponsor, projects: $projects)';
}


}

/// @nodoc
abstract mixin class _$SponsorDetailResponseCopyWith<$Res> implements $SponsorDetailResponseCopyWith<$Res> {
  factory _$SponsorDetailResponseCopyWith(_SponsorDetailResponse value, $Res Function(_SponsorDetailResponse) _then) = __$SponsorDetailResponseCopyWithImpl;
@override @useResult
$Res call({
 Sponsor sponsor, List<SponsorProject> projects
});


@override $SponsorCopyWith<$Res> get sponsor;

}
/// @nodoc
class __$SponsorDetailResponseCopyWithImpl<$Res>
    implements _$SponsorDetailResponseCopyWith<$Res> {
  __$SponsorDetailResponseCopyWithImpl(this._self, this._then);

  final _SponsorDetailResponse _self;
  final $Res Function(_SponsorDetailResponse) _then;

/// Create a copy of SponsorDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sponsor = null,Object? projects = null,}) {
  return _then(_SponsorDetailResponse(
sponsor: null == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as Sponsor,projects: null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<SponsorProject>,
  ));
}

/// Create a copy of SponsorDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsorCopyWith<$Res> get sponsor {
  
  return $SponsorCopyWith<$Res>(_self.sponsor, (value) {
    return _then(_self.copyWith(sponsor: value));
  });
}
}

// dart format on

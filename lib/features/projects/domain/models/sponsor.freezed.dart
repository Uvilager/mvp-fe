// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sponsor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Sponsor {

 int get id; String get name; String get logoUrl; String get websiteUrl;
/// Create a copy of Sponsor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorCopyWith<Sponsor> get copyWith => _$SponsorCopyWithImpl<Sponsor>(this as Sponsor, _$identity);

  /// Serializes this Sponsor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sponsor&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,logoUrl,websiteUrl);

@override
String toString() {
  return 'Sponsor(id: $id, name: $name, logoUrl: $logoUrl, websiteUrl: $websiteUrl)';
}


}

/// @nodoc
abstract mixin class $SponsorCopyWith<$Res>  {
  factory $SponsorCopyWith(Sponsor value, $Res Function(Sponsor) _then) = _$SponsorCopyWithImpl;
@useResult
$Res call({
 int id, String name, String logoUrl, String websiteUrl
});




}
/// @nodoc
class _$SponsorCopyWithImpl<$Res>
    implements $SponsorCopyWith<$Res> {
  _$SponsorCopyWithImpl(this._self, this._then);

  final Sponsor _self;
  final $Res Function(Sponsor) _then;

/// Create a copy of Sponsor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? logoUrl = null,Object? websiteUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,websiteUrl: null == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Sponsor implements Sponsor {
  const _Sponsor({required this.id, required this.name, required this.logoUrl, required this.websiteUrl});
  factory _Sponsor.fromJson(Map<String, dynamic> json) => _$SponsorFromJson(json);

@override final  int id;
@override final  String name;
@override final  String logoUrl;
@override final  String websiteUrl;

/// Create a copy of Sponsor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorCopyWith<_Sponsor> get copyWith => __$SponsorCopyWithImpl<_Sponsor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sponsor&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,logoUrl,websiteUrl);

@override
String toString() {
  return 'Sponsor(id: $id, name: $name, logoUrl: $logoUrl, websiteUrl: $websiteUrl)';
}


}

/// @nodoc
abstract mixin class _$SponsorCopyWith<$Res> implements $SponsorCopyWith<$Res> {
  factory _$SponsorCopyWith(_Sponsor value, $Res Function(_Sponsor) _then) = __$SponsorCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String logoUrl, String websiteUrl
});




}
/// @nodoc
class __$SponsorCopyWithImpl<$Res>
    implements _$SponsorCopyWith<$Res> {
  __$SponsorCopyWithImpl(this._self, this._then);

  final _Sponsor _self;
  final $Res Function(_Sponsor) _then;

/// Create a copy of Sponsor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? logoUrl = null,Object? websiteUrl = null,}) {
  return _then(_Sponsor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,websiteUrl: null == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

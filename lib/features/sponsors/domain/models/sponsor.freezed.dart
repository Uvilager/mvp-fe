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

 int get id; String get title; String get description; String get website; String get status;@JsonKey(name: 'contact_phone') String get contactPhone;@JsonKey(name: 'contact_email') String get contactEmail;@JsonKey(name: 'logo_url') String get logoUrl;@JsonKey(name: 'campaign_url') String get campaignUrl; String get body; int get order;@JsonKey(name: 'started_at') DateTime get startedAt;@JsonKey(name: 'ended_at') DateTime? get endedAt;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of Sponsor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorCopyWith<Sponsor> get copyWith => _$SponsorCopyWithImpl<Sponsor>(this as Sponsor, _$identity);

  /// Serializes this Sponsor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sponsor&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.website, website) || other.website == website)&&(identical(other.status, status) || other.status == status)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.campaignUrl, campaignUrl) || other.campaignUrl == campaignUrl)&&(identical(other.body, body) || other.body == body)&&(identical(other.order, order) || other.order == order)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,website,status,contactPhone,contactEmail,logoUrl,campaignUrl,body,order,startedAt,endedAt,createdAt,updatedAt);

@override
String toString() {
  return 'Sponsor(id: $id, title: $title, description: $description, website: $website, status: $status, contactPhone: $contactPhone, contactEmail: $contactEmail, logoUrl: $logoUrl, campaignUrl: $campaignUrl, body: $body, order: $order, startedAt: $startedAt, endedAt: $endedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SponsorCopyWith<$Res>  {
  factory $SponsorCopyWith(Sponsor value, $Res Function(Sponsor) _then) = _$SponsorCopyWithImpl;
@useResult
$Res call({
 int id, String title, String description, String website, String status,@JsonKey(name: 'contact_phone') String contactPhone,@JsonKey(name: 'contact_email') String contactEmail,@JsonKey(name: 'logo_url') String logoUrl,@JsonKey(name: 'campaign_url') String campaignUrl, String body, int order,@JsonKey(name: 'started_at') DateTime startedAt,@JsonKey(name: 'ended_at') DateTime? endedAt,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? website = null,Object? status = null,Object? contactPhone = null,Object? contactEmail = null,Object? logoUrl = null,Object? campaignUrl = null,Object? body = null,Object? order = null,Object? startedAt = null,Object? endedAt = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,website: null == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,contactPhone: null == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String,contactEmail: null == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,campaignUrl: null == campaignUrl ? _self.campaignUrl : campaignUrl // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Sponsor implements Sponsor {
  const _Sponsor({required this.id, required this.title, required this.description, required this.website, required this.status, @JsonKey(name: 'contact_phone') required this.contactPhone, @JsonKey(name: 'contact_email') required this.contactEmail, @JsonKey(name: 'logo_url') required this.logoUrl, @JsonKey(name: 'campaign_url') required this.campaignUrl, required this.body, required this.order, @JsonKey(name: 'started_at') required this.startedAt, @JsonKey(name: 'ended_at') this.endedAt, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _Sponsor.fromJson(Map<String, dynamic> json) => _$SponsorFromJson(json);

@override final  int id;
@override final  String title;
@override final  String description;
@override final  String website;
@override final  String status;
@override@JsonKey(name: 'contact_phone') final  String contactPhone;
@override@JsonKey(name: 'contact_email') final  String contactEmail;
@override@JsonKey(name: 'logo_url') final  String logoUrl;
@override@JsonKey(name: 'campaign_url') final  String campaignUrl;
@override final  String body;
@override final  int order;
@override@JsonKey(name: 'started_at') final  DateTime startedAt;
@override@JsonKey(name: 'ended_at') final  DateTime? endedAt;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sponsor&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.website, website) || other.website == website)&&(identical(other.status, status) || other.status == status)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.campaignUrl, campaignUrl) || other.campaignUrl == campaignUrl)&&(identical(other.body, body) || other.body == body)&&(identical(other.order, order) || other.order == order)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,website,status,contactPhone,contactEmail,logoUrl,campaignUrl,body,order,startedAt,endedAt,createdAt,updatedAt);

@override
String toString() {
  return 'Sponsor(id: $id, title: $title, description: $description, website: $website, status: $status, contactPhone: $contactPhone, contactEmail: $contactEmail, logoUrl: $logoUrl, campaignUrl: $campaignUrl, body: $body, order: $order, startedAt: $startedAt, endedAt: $endedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SponsorCopyWith<$Res> implements $SponsorCopyWith<$Res> {
  factory _$SponsorCopyWith(_Sponsor value, $Res Function(_Sponsor) _then) = __$SponsorCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String description, String website, String status,@JsonKey(name: 'contact_phone') String contactPhone,@JsonKey(name: 'contact_email') String contactEmail,@JsonKey(name: 'logo_url') String logoUrl,@JsonKey(name: 'campaign_url') String campaignUrl, String body, int order,@JsonKey(name: 'started_at') DateTime startedAt,@JsonKey(name: 'ended_at') DateTime? endedAt,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? website = null,Object? status = null,Object? contactPhone = null,Object? contactEmail = null,Object? logoUrl = null,Object? campaignUrl = null,Object? body = null,Object? order = null,Object? startedAt = null,Object? endedAt = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Sponsor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,website: null == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,contactPhone: null == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String,contactEmail: null == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,campaignUrl: null == campaignUrl ? _self.campaignUrl : campaignUrl // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on

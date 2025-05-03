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

 int get id;// Renamed from name
 String get title;// Renamed from websiteUrl and added JsonKey
@JsonKey(name: 'website') String get website;@JsonKey(name: 'logo_url') String get logoUrl;// Added missing fields
 String? get description; String get status;@JsonKey(name: 'contact_phone') String? get contactPhone;@JsonKey(name: 'contact_email') String? get contactEmail;@JsonKey(name: 'campaign_url') String? get campaignUrl; String? get body;@JsonKey(name: 'started_at', fromJson: _parseDateTimeNullable) DateTime? get startedAt;@JsonKey(name: 'ended_at', fromJson: _parseDateTimeNullable) DateTime? get endedAt; int? get order;@JsonKey(name: 'created_at', fromJson: _parseDateTimeNullable) DateTime? get createdAt;@JsonKey(name: 'updated_at', fromJson: _parseDateTimeNullable) DateTime? get updatedAt;
/// Create a copy of Sponsor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorCopyWith<Sponsor> get copyWith => _$SponsorCopyWithImpl<Sponsor>(this as Sponsor, _$identity);

  /// Serializes this Sponsor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sponsor&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.website, website) || other.website == website)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&(identical(other.campaignUrl, campaignUrl) || other.campaignUrl == campaignUrl)&&(identical(other.body, body) || other.body == body)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.order, order) || other.order == order)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,website,logoUrl,description,status,contactPhone,contactEmail,campaignUrl,body,startedAt,endedAt,order,createdAt,updatedAt);

@override
String toString() {
  return 'Sponsor(id: $id, title: $title, website: $website, logoUrl: $logoUrl, description: $description, status: $status, contactPhone: $contactPhone, contactEmail: $contactEmail, campaignUrl: $campaignUrl, body: $body, startedAt: $startedAt, endedAt: $endedAt, order: $order, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SponsorCopyWith<$Res>  {
  factory $SponsorCopyWith(Sponsor value, $Res Function(Sponsor) _then) = _$SponsorCopyWithImpl;
@useResult
$Res call({
 int id, String title,@JsonKey(name: 'website') String website,@JsonKey(name: 'logo_url') String logoUrl, String? description, String status,@JsonKey(name: 'contact_phone') String? contactPhone,@JsonKey(name: 'contact_email') String? contactEmail,@JsonKey(name: 'campaign_url') String? campaignUrl, String? body,@JsonKey(name: 'started_at', fromJson: _parseDateTimeNullable) DateTime? startedAt,@JsonKey(name: 'ended_at', fromJson: _parseDateTimeNullable) DateTime? endedAt, int? order,@JsonKey(name: 'created_at', fromJson: _parseDateTimeNullable) DateTime? createdAt,@JsonKey(name: 'updated_at', fromJson: _parseDateTimeNullable) DateTime? updatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? website = null,Object? logoUrl = null,Object? description = freezed,Object? status = null,Object? contactPhone = freezed,Object? contactEmail = freezed,Object? campaignUrl = freezed,Object? body = freezed,Object? startedAt = freezed,Object? endedAt = freezed,Object? order = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,website: null == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,campaignUrl: freezed == campaignUrl ? _self.campaignUrl : campaignUrl // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Sponsor implements Sponsor {
  const _Sponsor({required this.id, required this.title, @JsonKey(name: 'website') required this.website, @JsonKey(name: 'logo_url') required this.logoUrl, this.description, required this.status, @JsonKey(name: 'contact_phone') this.contactPhone, @JsonKey(name: 'contact_email') this.contactEmail, @JsonKey(name: 'campaign_url') this.campaignUrl, this.body, @JsonKey(name: 'started_at', fromJson: _parseDateTimeNullable) this.startedAt, @JsonKey(name: 'ended_at', fromJson: _parseDateTimeNullable) this.endedAt, this.order, @JsonKey(name: 'created_at', fromJson: _parseDateTimeNullable) this.createdAt, @JsonKey(name: 'updated_at', fromJson: _parseDateTimeNullable) this.updatedAt});
  factory _Sponsor.fromJson(Map<String, dynamic> json) => _$SponsorFromJson(json);

@override final  int id;
// Renamed from name
@override final  String title;
// Renamed from websiteUrl and added JsonKey
@override@JsonKey(name: 'website') final  String website;
@override@JsonKey(name: 'logo_url') final  String logoUrl;
// Added missing fields
@override final  String? description;
@override final  String status;
@override@JsonKey(name: 'contact_phone') final  String? contactPhone;
@override@JsonKey(name: 'contact_email') final  String? contactEmail;
@override@JsonKey(name: 'campaign_url') final  String? campaignUrl;
@override final  String? body;
@override@JsonKey(name: 'started_at', fromJson: _parseDateTimeNullable) final  DateTime? startedAt;
@override@JsonKey(name: 'ended_at', fromJson: _parseDateTimeNullable) final  DateTime? endedAt;
@override final  int? order;
@override@JsonKey(name: 'created_at', fromJson: _parseDateTimeNullable) final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _parseDateTimeNullable) final  DateTime? updatedAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sponsor&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.website, website) || other.website == website)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&(identical(other.campaignUrl, campaignUrl) || other.campaignUrl == campaignUrl)&&(identical(other.body, body) || other.body == body)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.order, order) || other.order == order)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,website,logoUrl,description,status,contactPhone,contactEmail,campaignUrl,body,startedAt,endedAt,order,createdAt,updatedAt);

@override
String toString() {
  return 'Sponsor(id: $id, title: $title, website: $website, logoUrl: $logoUrl, description: $description, status: $status, contactPhone: $contactPhone, contactEmail: $contactEmail, campaignUrl: $campaignUrl, body: $body, startedAt: $startedAt, endedAt: $endedAt, order: $order, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SponsorCopyWith<$Res> implements $SponsorCopyWith<$Res> {
  factory _$SponsorCopyWith(_Sponsor value, $Res Function(_Sponsor) _then) = __$SponsorCopyWithImpl;
@override @useResult
$Res call({
 int id, String title,@JsonKey(name: 'website') String website,@JsonKey(name: 'logo_url') String logoUrl, String? description, String status,@JsonKey(name: 'contact_phone') String? contactPhone,@JsonKey(name: 'contact_email') String? contactEmail,@JsonKey(name: 'campaign_url') String? campaignUrl, String? body,@JsonKey(name: 'started_at', fromJson: _parseDateTimeNullable) DateTime? startedAt,@JsonKey(name: 'ended_at', fromJson: _parseDateTimeNullable) DateTime? endedAt, int? order,@JsonKey(name: 'created_at', fromJson: _parseDateTimeNullable) DateTime? createdAt,@JsonKey(name: 'updated_at', fromJson: _parseDateTimeNullable) DateTime? updatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? website = null,Object? logoUrl = null,Object? description = freezed,Object? status = null,Object? contactPhone = freezed,Object? contactEmail = freezed,Object? campaignUrl = freezed,Object? body = freezed,Object? startedAt = freezed,Object? endedAt = freezed,Object? order = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Sponsor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,website: null == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,campaignUrl: freezed == campaignUrl ? _self.campaignUrl : campaignUrl // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectRequest {

 int get districtId; String get title; String get description; DateTime? get startDate; DateTime? get endDate; int? get maxUsers; int? get minUsers; String? get budget;@JsonKey(includeFromJson: false, includeToJson: false) List<File>? get mediaFiles;
/// Create a copy of ProjectRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectRequestCopyWith<ProjectRequest> get copyWith => _$ProjectRequestCopyWithImpl<ProjectRequest>(this as ProjectRequest, _$identity);

  /// Serializes this ProjectRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectRequest&&(identical(other.districtId, districtId) || other.districtId == districtId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.maxUsers, maxUsers) || other.maxUsers == maxUsers)&&(identical(other.minUsers, minUsers) || other.minUsers == minUsers)&&(identical(other.budget, budget) || other.budget == budget)&&const DeepCollectionEquality().equals(other.mediaFiles, mediaFiles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,districtId,title,description,startDate,endDate,maxUsers,minUsers,budget,const DeepCollectionEquality().hash(mediaFiles));

@override
String toString() {
  return 'ProjectRequest(districtId: $districtId, title: $title, description: $description, startDate: $startDate, endDate: $endDate, maxUsers: $maxUsers, minUsers: $minUsers, budget: $budget, mediaFiles: $mediaFiles)';
}


}

/// @nodoc
abstract mixin class $ProjectRequestCopyWith<$Res>  {
  factory $ProjectRequestCopyWith(ProjectRequest value, $Res Function(ProjectRequest) _then) = _$ProjectRequestCopyWithImpl;
@useResult
$Res call({
 int districtId, String title, String description, DateTime? startDate, DateTime? endDate, int? maxUsers, int? minUsers, String? budget,@JsonKey(includeFromJson: false, includeToJson: false) List<File>? mediaFiles
});




}
/// @nodoc
class _$ProjectRequestCopyWithImpl<$Res>
    implements $ProjectRequestCopyWith<$Res> {
  _$ProjectRequestCopyWithImpl(this._self, this._then);

  final ProjectRequest _self;
  final $Res Function(ProjectRequest) _then;

/// Create a copy of ProjectRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? districtId = null,Object? title = null,Object? description = null,Object? startDate = freezed,Object? endDate = freezed,Object? maxUsers = freezed,Object? minUsers = freezed,Object? budget = freezed,Object? mediaFiles = freezed,}) {
  return _then(_self.copyWith(
districtId: null == districtId ? _self.districtId : districtId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,maxUsers: freezed == maxUsers ? _self.maxUsers : maxUsers // ignore: cast_nullable_to_non_nullable
as int?,minUsers: freezed == minUsers ? _self.minUsers : minUsers // ignore: cast_nullable_to_non_nullable
as int?,budget: freezed == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as String?,mediaFiles: freezed == mediaFiles ? _self.mediaFiles : mediaFiles // ignore: cast_nullable_to_non_nullable
as List<File>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ProjectRequest implements ProjectRequest {
  const _ProjectRequest({required this.districtId, required this.title, required this.description, this.startDate, this.endDate, this.maxUsers, this.minUsers, this.budget, @JsonKey(includeFromJson: false, includeToJson: false) final  List<File>? mediaFiles}): _mediaFiles = mediaFiles;
  factory _ProjectRequest.fromJson(Map<String, dynamic> json) => _$ProjectRequestFromJson(json);

@override final  int districtId;
@override final  String title;
@override final  String description;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override final  int? maxUsers;
@override final  int? minUsers;
@override final  String? budget;
 final  List<File>? _mediaFiles;
@override@JsonKey(includeFromJson: false, includeToJson: false) List<File>? get mediaFiles {
  final value = _mediaFiles;
  if (value == null) return null;
  if (_mediaFiles is EqualUnmodifiableListView) return _mediaFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProjectRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectRequestCopyWith<_ProjectRequest> get copyWith => __$ProjectRequestCopyWithImpl<_ProjectRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectRequest&&(identical(other.districtId, districtId) || other.districtId == districtId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.maxUsers, maxUsers) || other.maxUsers == maxUsers)&&(identical(other.minUsers, minUsers) || other.minUsers == minUsers)&&(identical(other.budget, budget) || other.budget == budget)&&const DeepCollectionEquality().equals(other._mediaFiles, _mediaFiles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,districtId,title,description,startDate,endDate,maxUsers,minUsers,budget,const DeepCollectionEquality().hash(_mediaFiles));

@override
String toString() {
  return 'ProjectRequest(districtId: $districtId, title: $title, description: $description, startDate: $startDate, endDate: $endDate, maxUsers: $maxUsers, minUsers: $minUsers, budget: $budget, mediaFiles: $mediaFiles)';
}


}

/// @nodoc
abstract mixin class _$ProjectRequestCopyWith<$Res> implements $ProjectRequestCopyWith<$Res> {
  factory _$ProjectRequestCopyWith(_ProjectRequest value, $Res Function(_ProjectRequest) _then) = __$ProjectRequestCopyWithImpl;
@override @useResult
$Res call({
 int districtId, String title, String description, DateTime? startDate, DateTime? endDate, int? maxUsers, int? minUsers, String? budget,@JsonKey(includeFromJson: false, includeToJson: false) List<File>? mediaFiles
});




}
/// @nodoc
class __$ProjectRequestCopyWithImpl<$Res>
    implements _$ProjectRequestCopyWith<$Res> {
  __$ProjectRequestCopyWithImpl(this._self, this._then);

  final _ProjectRequest _self;
  final $Res Function(_ProjectRequest) _then;

/// Create a copy of ProjectRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? districtId = null,Object? title = null,Object? description = null,Object? startDate = freezed,Object? endDate = freezed,Object? maxUsers = freezed,Object? minUsers = freezed,Object? budget = freezed,Object? mediaFiles = freezed,}) {
  return _then(_ProjectRequest(
districtId: null == districtId ? _self.districtId : districtId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,maxUsers: freezed == maxUsers ? _self.maxUsers : maxUsers // ignore: cast_nullable_to_non_nullable
as int?,minUsers: freezed == minUsers ? _self.minUsers : minUsers // ignore: cast_nullable_to_non_nullable
as int?,budget: freezed == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as String?,mediaFiles: freezed == mediaFiles ? _self._mediaFiles : mediaFiles // ignore: cast_nullable_to_non_nullable
as List<File>?,
  ));
}


}


/// @nodoc
mixin _$ProjectRequestResponse {

 int get id; int get organizerId; int get districtId; String get title; String get description; DateTime? get startDate; DateTime? get endDate; int? get maxUsers; int? get minUsers; String? get budget; List<String>? get media; String get status; DateTime get createdAt; DateTime get updatedAt; District? get district;
/// Create a copy of ProjectRequestResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectRequestResponseCopyWith<ProjectRequestResponse> get copyWith => _$ProjectRequestResponseCopyWithImpl<ProjectRequestResponse>(this as ProjectRequestResponse, _$identity);

  /// Serializes this ProjectRequestResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectRequestResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.organizerId, organizerId) || other.organizerId == organizerId)&&(identical(other.districtId, districtId) || other.districtId == districtId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.maxUsers, maxUsers) || other.maxUsers == maxUsers)&&(identical(other.minUsers, minUsers) || other.minUsers == minUsers)&&(identical(other.budget, budget) || other.budget == budget)&&const DeepCollectionEquality().equals(other.media, media)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.district, district) || other.district == district));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,organizerId,districtId,title,description,startDate,endDate,maxUsers,minUsers,budget,const DeepCollectionEquality().hash(media),status,createdAt,updatedAt,district);

@override
String toString() {
  return 'ProjectRequestResponse(id: $id, organizerId: $organizerId, districtId: $districtId, title: $title, description: $description, startDate: $startDate, endDate: $endDate, maxUsers: $maxUsers, minUsers: $minUsers, budget: $budget, media: $media, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, district: $district)';
}


}

/// @nodoc
abstract mixin class $ProjectRequestResponseCopyWith<$Res>  {
  factory $ProjectRequestResponseCopyWith(ProjectRequestResponse value, $Res Function(ProjectRequestResponse) _then) = _$ProjectRequestResponseCopyWithImpl;
@useResult
$Res call({
 int id, int organizerId, int districtId, String title, String description, DateTime? startDate, DateTime? endDate, int? maxUsers, int? minUsers, String? budget, List<String>? media, String status, DateTime createdAt, DateTime updatedAt, District? district
});


$DistrictCopyWith<$Res>? get district;

}
/// @nodoc
class _$ProjectRequestResponseCopyWithImpl<$Res>
    implements $ProjectRequestResponseCopyWith<$Res> {
  _$ProjectRequestResponseCopyWithImpl(this._self, this._then);

  final ProjectRequestResponse _self;
  final $Res Function(ProjectRequestResponse) _then;

/// Create a copy of ProjectRequestResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? organizerId = null,Object? districtId = null,Object? title = null,Object? description = null,Object? startDate = freezed,Object? endDate = freezed,Object? maxUsers = freezed,Object? minUsers = freezed,Object? budget = freezed,Object? media = freezed,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? district = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,organizerId: null == organizerId ? _self.organizerId : organizerId // ignore: cast_nullable_to_non_nullable
as int,districtId: null == districtId ? _self.districtId : districtId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,maxUsers: freezed == maxUsers ? _self.maxUsers : maxUsers // ignore: cast_nullable_to_non_nullable
as int?,minUsers: freezed == minUsers ? _self.minUsers : minUsers // ignore: cast_nullable_to_non_nullable
as int?,budget: freezed == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as String?,media: freezed == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as List<String>?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as District?,
  ));
}
/// Create a copy of ProjectRequestResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DistrictCopyWith<$Res>? get district {
    if (_self.district == null) {
    return null;
  }

  return $DistrictCopyWith<$Res>(_self.district!, (value) {
    return _then(_self.copyWith(district: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ProjectRequestResponse implements ProjectRequestResponse {
  const _ProjectRequestResponse({required this.id, required this.organizerId, required this.districtId, required this.title, required this.description, this.startDate, this.endDate, this.maxUsers, this.minUsers, this.budget, final  List<String>? media, required this.status, required this.createdAt, required this.updatedAt, this.district}): _media = media;
  factory _ProjectRequestResponse.fromJson(Map<String, dynamic> json) => _$ProjectRequestResponseFromJson(json);

@override final  int id;
@override final  int organizerId;
@override final  int districtId;
@override final  String title;
@override final  String description;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override final  int? maxUsers;
@override final  int? minUsers;
@override final  String? budget;
 final  List<String>? _media;
@override List<String>? get media {
  final value = _media;
  if (value == null) return null;
  if (_media is EqualUnmodifiableListView) return _media;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String status;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  District? district;

/// Create a copy of ProjectRequestResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectRequestResponseCopyWith<_ProjectRequestResponse> get copyWith => __$ProjectRequestResponseCopyWithImpl<_ProjectRequestResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectRequestResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectRequestResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.organizerId, organizerId) || other.organizerId == organizerId)&&(identical(other.districtId, districtId) || other.districtId == districtId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.maxUsers, maxUsers) || other.maxUsers == maxUsers)&&(identical(other.minUsers, minUsers) || other.minUsers == minUsers)&&(identical(other.budget, budget) || other.budget == budget)&&const DeepCollectionEquality().equals(other._media, _media)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.district, district) || other.district == district));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,organizerId,districtId,title,description,startDate,endDate,maxUsers,minUsers,budget,const DeepCollectionEquality().hash(_media),status,createdAt,updatedAt,district);

@override
String toString() {
  return 'ProjectRequestResponse(id: $id, organizerId: $organizerId, districtId: $districtId, title: $title, description: $description, startDate: $startDate, endDate: $endDate, maxUsers: $maxUsers, minUsers: $minUsers, budget: $budget, media: $media, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, district: $district)';
}


}

/// @nodoc
abstract mixin class _$ProjectRequestResponseCopyWith<$Res> implements $ProjectRequestResponseCopyWith<$Res> {
  factory _$ProjectRequestResponseCopyWith(_ProjectRequestResponse value, $Res Function(_ProjectRequestResponse) _then) = __$ProjectRequestResponseCopyWithImpl;
@override @useResult
$Res call({
 int id, int organizerId, int districtId, String title, String description, DateTime? startDate, DateTime? endDate, int? maxUsers, int? minUsers, String? budget, List<String>? media, String status, DateTime createdAt, DateTime updatedAt, District? district
});


@override $DistrictCopyWith<$Res>? get district;

}
/// @nodoc
class __$ProjectRequestResponseCopyWithImpl<$Res>
    implements _$ProjectRequestResponseCopyWith<$Res> {
  __$ProjectRequestResponseCopyWithImpl(this._self, this._then);

  final _ProjectRequestResponse _self;
  final $Res Function(_ProjectRequestResponse) _then;

/// Create a copy of ProjectRequestResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? organizerId = null,Object? districtId = null,Object? title = null,Object? description = null,Object? startDate = freezed,Object? endDate = freezed,Object? maxUsers = freezed,Object? minUsers = freezed,Object? budget = freezed,Object? media = freezed,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? district = freezed,}) {
  return _then(_ProjectRequestResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,organizerId: null == organizerId ? _self.organizerId : organizerId // ignore: cast_nullable_to_non_nullable
as int,districtId: null == districtId ? _self.districtId : districtId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,maxUsers: freezed == maxUsers ? _self.maxUsers : maxUsers // ignore: cast_nullable_to_non_nullable
as int?,minUsers: freezed == minUsers ? _self.minUsers : minUsers // ignore: cast_nullable_to_non_nullable
as int?,budget: freezed == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as String?,media: freezed == media ? _self._media : media // ignore: cast_nullable_to_non_nullable
as List<String>?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as District?,
  ));
}

/// Create a copy of ProjectRequestResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DistrictCopyWith<$Res>? get district {
    if (_self.district == null) {
    return null;
  }

  return $DistrictCopyWith<$Res>(_self.district!, (value) {
    return _then(_self.copyWith(district: value));
  });
}
}

// dart format on

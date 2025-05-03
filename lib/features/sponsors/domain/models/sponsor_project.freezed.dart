// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sponsor_project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SponsorProject {

 int get id; String get title; String get description; String? get body;@JsonKey(name: 'start_date') String get startDate;@JsonKey(name: 'end_date') String get endDate;@JsonKey(name: 'max_users') int get maxUsers;@JsonKey(name: 'min_users') int get minUsers; String get status;@JsonKey(name: 'project_url') String? get projectUrl; int get upvotes; int get downvotes; String get budget;@JsonKey(name: 'points_earned') int get pointsEarned;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt; String? get district;
/// Create a copy of SponsorProject
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorProjectCopyWith<SponsorProject> get copyWith => _$SponsorProjectCopyWithImpl<SponsorProject>(this as SponsorProject, _$identity);

  /// Serializes this SponsorProject to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsorProject&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.body, body) || other.body == body)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.maxUsers, maxUsers) || other.maxUsers == maxUsers)&&(identical(other.minUsers, minUsers) || other.minUsers == minUsers)&&(identical(other.status, status) || other.status == status)&&(identical(other.projectUrl, projectUrl) || other.projectUrl == projectUrl)&&(identical(other.upvotes, upvotes) || other.upvotes == upvotes)&&(identical(other.downvotes, downvotes) || other.downvotes == downvotes)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.pointsEarned, pointsEarned) || other.pointsEarned == pointsEarned)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.district, district) || other.district == district));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,body,startDate,endDate,maxUsers,minUsers,status,projectUrl,upvotes,downvotes,budget,pointsEarned,createdAt,updatedAt,district);

@override
String toString() {
  return 'SponsorProject(id: $id, title: $title, description: $description, body: $body, startDate: $startDate, endDate: $endDate, maxUsers: $maxUsers, minUsers: $minUsers, status: $status, projectUrl: $projectUrl, upvotes: $upvotes, downvotes: $downvotes, budget: $budget, pointsEarned: $pointsEarned, createdAt: $createdAt, updatedAt: $updatedAt, district: $district)';
}


}

/// @nodoc
abstract mixin class $SponsorProjectCopyWith<$Res>  {
  factory $SponsorProjectCopyWith(SponsorProject value, $Res Function(SponsorProject) _then) = _$SponsorProjectCopyWithImpl;
@useResult
$Res call({
 int id, String title, String description, String? body,@JsonKey(name: 'start_date') String startDate,@JsonKey(name: 'end_date') String endDate,@JsonKey(name: 'max_users') int maxUsers,@JsonKey(name: 'min_users') int minUsers, String status,@JsonKey(name: 'project_url') String? projectUrl, int upvotes, int downvotes, String budget,@JsonKey(name: 'points_earned') int pointsEarned,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt, String? district
});




}
/// @nodoc
class _$SponsorProjectCopyWithImpl<$Res>
    implements $SponsorProjectCopyWith<$Res> {
  _$SponsorProjectCopyWithImpl(this._self, this._then);

  final SponsorProject _self;
  final $Res Function(SponsorProject) _then;

/// Create a copy of SponsorProject
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? body = freezed,Object? startDate = null,Object? endDate = null,Object? maxUsers = null,Object? minUsers = null,Object? status = null,Object? projectUrl = freezed,Object? upvotes = null,Object? downvotes = null,Object? budget = null,Object? pointsEarned = null,Object? createdAt = null,Object? updatedAt = null,Object? district = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,maxUsers: null == maxUsers ? _self.maxUsers : maxUsers // ignore: cast_nullable_to_non_nullable
as int,minUsers: null == minUsers ? _self.minUsers : minUsers // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,projectUrl: freezed == projectUrl ? _self.projectUrl : projectUrl // ignore: cast_nullable_to_non_nullable
as String?,upvotes: null == upvotes ? _self.upvotes : upvotes // ignore: cast_nullable_to_non_nullable
as int,downvotes: null == downvotes ? _self.downvotes : downvotes // ignore: cast_nullable_to_non_nullable
as int,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as String,pointsEarned: null == pointsEarned ? _self.pointsEarned : pointsEarned // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SponsorProject implements SponsorProject {
  const _SponsorProject({required this.id, required this.title, required this.description, this.body, @JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'end_date') required this.endDate, @JsonKey(name: 'max_users') required this.maxUsers, @JsonKey(name: 'min_users') required this.minUsers, required this.status, @JsonKey(name: 'project_url') this.projectUrl, required this.upvotes, required this.downvotes, required this.budget, @JsonKey(name: 'points_earned') required this.pointsEarned, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, this.district});
  factory _SponsorProject.fromJson(Map<String, dynamic> json) => _$SponsorProjectFromJson(json);

@override final  int id;
@override final  String title;
@override final  String description;
@override final  String? body;
@override@JsonKey(name: 'start_date') final  String startDate;
@override@JsonKey(name: 'end_date') final  String endDate;
@override@JsonKey(name: 'max_users') final  int maxUsers;
@override@JsonKey(name: 'min_users') final  int minUsers;
@override final  String status;
@override@JsonKey(name: 'project_url') final  String? projectUrl;
@override final  int upvotes;
@override final  int downvotes;
@override final  String budget;
@override@JsonKey(name: 'points_earned') final  int pointsEarned;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;
@override final  String? district;

/// Create a copy of SponsorProject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorProjectCopyWith<_SponsorProject> get copyWith => __$SponsorProjectCopyWithImpl<_SponsorProject>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorProjectToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsorProject&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.body, body) || other.body == body)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.maxUsers, maxUsers) || other.maxUsers == maxUsers)&&(identical(other.minUsers, minUsers) || other.minUsers == minUsers)&&(identical(other.status, status) || other.status == status)&&(identical(other.projectUrl, projectUrl) || other.projectUrl == projectUrl)&&(identical(other.upvotes, upvotes) || other.upvotes == upvotes)&&(identical(other.downvotes, downvotes) || other.downvotes == downvotes)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.pointsEarned, pointsEarned) || other.pointsEarned == pointsEarned)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.district, district) || other.district == district));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,body,startDate,endDate,maxUsers,minUsers,status,projectUrl,upvotes,downvotes,budget,pointsEarned,createdAt,updatedAt,district);

@override
String toString() {
  return 'SponsorProject(id: $id, title: $title, description: $description, body: $body, startDate: $startDate, endDate: $endDate, maxUsers: $maxUsers, minUsers: $minUsers, status: $status, projectUrl: $projectUrl, upvotes: $upvotes, downvotes: $downvotes, budget: $budget, pointsEarned: $pointsEarned, createdAt: $createdAt, updatedAt: $updatedAt, district: $district)';
}


}

/// @nodoc
abstract mixin class _$SponsorProjectCopyWith<$Res> implements $SponsorProjectCopyWith<$Res> {
  factory _$SponsorProjectCopyWith(_SponsorProject value, $Res Function(_SponsorProject) _then) = __$SponsorProjectCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String description, String? body,@JsonKey(name: 'start_date') String startDate,@JsonKey(name: 'end_date') String endDate,@JsonKey(name: 'max_users') int maxUsers,@JsonKey(name: 'min_users') int minUsers, String status,@JsonKey(name: 'project_url') String? projectUrl, int upvotes, int downvotes, String budget,@JsonKey(name: 'points_earned') int pointsEarned,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt, String? district
});




}
/// @nodoc
class __$SponsorProjectCopyWithImpl<$Res>
    implements _$SponsorProjectCopyWith<$Res> {
  __$SponsorProjectCopyWithImpl(this._self, this._then);

  final _SponsorProject _self;
  final $Res Function(_SponsorProject) _then;

/// Create a copy of SponsorProject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? body = freezed,Object? startDate = null,Object? endDate = null,Object? maxUsers = null,Object? minUsers = null,Object? status = null,Object? projectUrl = freezed,Object? upvotes = null,Object? downvotes = null,Object? budget = null,Object? pointsEarned = null,Object? createdAt = null,Object? updatedAt = null,Object? district = freezed,}) {
  return _then(_SponsorProject(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,maxUsers: null == maxUsers ? _self.maxUsers : maxUsers // ignore: cast_nullable_to_non_nullable
as int,minUsers: null == minUsers ? _self.minUsers : minUsers // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,projectUrl: freezed == projectUrl ? _self.projectUrl : projectUrl // ignore: cast_nullable_to_non_nullable
as String?,upvotes: null == upvotes ? _self.upvotes : upvotes // ignore: cast_nullable_to_non_nullable
as int,downvotes: null == downvotes ? _self.downvotes : downvotes // ignore: cast_nullable_to_non_nullable
as int,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as String,pointsEarned: null == pointsEarned ? _self.pointsEarned : pointsEarned // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Project {

 int get id; String get title; String get description; String? get body;@JsonKey(name: 'start_date') DateTime get startDate;@JsonKey(name: 'end_date') DateTime get endDate;@JsonKey(name: 'max_users') int get maxUsers;@JsonKey(name: 'min_users') int get minUsers; String get status;@JsonKey(name: 'project_url') String? get projectUrl; int get upvotes; int get downvotes; String get budget;@JsonKey(name: 'points_earned') int get pointsEarned; Organizer? get organizer; List<Tag>? get tags; List<Sponsor>? get sponsors;@JsonKey(name: 'created_at', fromJson: _parseDateTime) DateTime get createdAt;@JsonKey(name: 'updated_at', fromJson: _parseDateTime) DateTime get updatedAt;// Added fields based on backend comparison
 String? get district;@JsonKey(name: 'has_user_voted') bool? get hasUserVoted;@JsonKey(name: 'is_user_volunteer') bool? get isUserVolunteer;@JsonKey(name: 'is_user_leader') bool? get isUserLeader;@JsonKey(name: 'volunteers_count') int? get volunteersCount;@JsonKey(name: 'leaders_count') int? get leadersCount;
/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectCopyWith<Project> get copyWith => _$ProjectCopyWithImpl<Project>(this as Project, _$identity);

  /// Serializes this Project to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Project&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.body, body) || other.body == body)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.maxUsers, maxUsers) || other.maxUsers == maxUsers)&&(identical(other.minUsers, minUsers) || other.minUsers == minUsers)&&(identical(other.status, status) || other.status == status)&&(identical(other.projectUrl, projectUrl) || other.projectUrl == projectUrl)&&(identical(other.upvotes, upvotes) || other.upvotes == upvotes)&&(identical(other.downvotes, downvotes) || other.downvotes == downvotes)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.pointsEarned, pointsEarned) || other.pointsEarned == pointsEarned)&&(identical(other.organizer, organizer) || other.organizer == organizer)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.sponsors, sponsors)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.district, district) || other.district == district)&&(identical(other.hasUserVoted, hasUserVoted) || other.hasUserVoted == hasUserVoted)&&(identical(other.isUserVolunteer, isUserVolunteer) || other.isUserVolunteer == isUserVolunteer)&&(identical(other.isUserLeader, isUserLeader) || other.isUserLeader == isUserLeader)&&(identical(other.volunteersCount, volunteersCount) || other.volunteersCount == volunteersCount)&&(identical(other.leadersCount, leadersCount) || other.leadersCount == leadersCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,body,startDate,endDate,maxUsers,minUsers,status,projectUrl,upvotes,downvotes,budget,pointsEarned,organizer,const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(sponsors),createdAt,updatedAt,district,hasUserVoted,isUserVolunteer,isUserLeader,volunteersCount,leadersCount]);

@override
String toString() {
  return 'Project(id: $id, title: $title, description: $description, body: $body, startDate: $startDate, endDate: $endDate, maxUsers: $maxUsers, minUsers: $minUsers, status: $status, projectUrl: $projectUrl, upvotes: $upvotes, downvotes: $downvotes, budget: $budget, pointsEarned: $pointsEarned, organizer: $organizer, tags: $tags, sponsors: $sponsors, createdAt: $createdAt, updatedAt: $updatedAt, district: $district, hasUserVoted: $hasUserVoted, isUserVolunteer: $isUserVolunteer, isUserLeader: $isUserLeader, volunteersCount: $volunteersCount, leadersCount: $leadersCount)';
}


}

/// @nodoc
abstract mixin class $ProjectCopyWith<$Res>  {
  factory $ProjectCopyWith(Project value, $Res Function(Project) _then) = _$ProjectCopyWithImpl;
@useResult
$Res call({
 int id, String title, String description, String? body,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime endDate,@JsonKey(name: 'max_users') int maxUsers,@JsonKey(name: 'min_users') int minUsers, String status,@JsonKey(name: 'project_url') String? projectUrl, int upvotes, int downvotes, String budget,@JsonKey(name: 'points_earned') int pointsEarned, Organizer? organizer, List<Tag>? tags, List<Sponsor>? sponsors,@JsonKey(name: 'created_at', fromJson: _parseDateTime) DateTime createdAt,@JsonKey(name: 'updated_at', fromJson: _parseDateTime) DateTime updatedAt, String? district,@JsonKey(name: 'has_user_voted') bool? hasUserVoted,@JsonKey(name: 'is_user_volunteer') bool? isUserVolunteer,@JsonKey(name: 'is_user_leader') bool? isUserLeader,@JsonKey(name: 'volunteers_count') int? volunteersCount,@JsonKey(name: 'leaders_count') int? leadersCount
});


$OrganizerCopyWith<$Res>? get organizer;

}
/// @nodoc
class _$ProjectCopyWithImpl<$Res>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._self, this._then);

  final Project _self;
  final $Res Function(Project) _then;

/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? body = freezed,Object? startDate = null,Object? endDate = null,Object? maxUsers = null,Object? minUsers = null,Object? status = null,Object? projectUrl = freezed,Object? upvotes = null,Object? downvotes = null,Object? budget = null,Object? pointsEarned = null,Object? organizer = freezed,Object? tags = freezed,Object? sponsors = freezed,Object? createdAt = null,Object? updatedAt = null,Object? district = freezed,Object? hasUserVoted = freezed,Object? isUserVolunteer = freezed,Object? isUserLeader = freezed,Object? volunteersCount = freezed,Object? leadersCount = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,maxUsers: null == maxUsers ? _self.maxUsers : maxUsers // ignore: cast_nullable_to_non_nullable
as int,minUsers: null == minUsers ? _self.minUsers : minUsers // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,projectUrl: freezed == projectUrl ? _self.projectUrl : projectUrl // ignore: cast_nullable_to_non_nullable
as String?,upvotes: null == upvotes ? _self.upvotes : upvotes // ignore: cast_nullable_to_non_nullable
as int,downvotes: null == downvotes ? _self.downvotes : downvotes // ignore: cast_nullable_to_non_nullable
as int,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as String,pointsEarned: null == pointsEarned ? _self.pointsEarned : pointsEarned // ignore: cast_nullable_to_non_nullable
as int,organizer: freezed == organizer ? _self.organizer : organizer // ignore: cast_nullable_to_non_nullable
as Organizer?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<Tag>?,sponsors: freezed == sponsors ? _self.sponsors : sponsors // ignore: cast_nullable_to_non_nullable
as List<Sponsor>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,hasUserVoted: freezed == hasUserVoted ? _self.hasUserVoted : hasUserVoted // ignore: cast_nullable_to_non_nullable
as bool?,isUserVolunteer: freezed == isUserVolunteer ? _self.isUserVolunteer : isUserVolunteer // ignore: cast_nullable_to_non_nullable
as bool?,isUserLeader: freezed == isUserLeader ? _self.isUserLeader : isUserLeader // ignore: cast_nullable_to_non_nullable
as bool?,volunteersCount: freezed == volunteersCount ? _self.volunteersCount : volunteersCount // ignore: cast_nullable_to_non_nullable
as int?,leadersCount: freezed == leadersCount ? _self.leadersCount : leadersCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrganizerCopyWith<$Res>? get organizer {
    if (_self.organizer == null) {
    return null;
  }

  return $OrganizerCopyWith<$Res>(_self.organizer!, (value) {
    return _then(_self.copyWith(organizer: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Project implements Project {
  const _Project({required this.id, required this.title, required this.description, this.body, @JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'end_date') required this.endDate, @JsonKey(name: 'max_users') required this.maxUsers, @JsonKey(name: 'min_users') required this.minUsers, required this.status, @JsonKey(name: 'project_url') this.projectUrl, required this.upvotes, required this.downvotes, required this.budget, @JsonKey(name: 'points_earned') required this.pointsEarned, this.organizer, final  List<Tag>? tags, final  List<Sponsor>? sponsors, @JsonKey(name: 'created_at', fromJson: _parseDateTime) required this.createdAt, @JsonKey(name: 'updated_at', fromJson: _parseDateTime) required this.updatedAt, this.district, @JsonKey(name: 'has_user_voted') this.hasUserVoted, @JsonKey(name: 'is_user_volunteer') this.isUserVolunteer, @JsonKey(name: 'is_user_leader') this.isUserLeader, @JsonKey(name: 'volunteers_count') this.volunteersCount, @JsonKey(name: 'leaders_count') this.leadersCount}): _tags = tags,_sponsors = sponsors;
  factory _Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);

@override final  int id;
@override final  String title;
@override final  String description;
@override final  String? body;
@override@JsonKey(name: 'start_date') final  DateTime startDate;
@override@JsonKey(name: 'end_date') final  DateTime endDate;
@override@JsonKey(name: 'max_users') final  int maxUsers;
@override@JsonKey(name: 'min_users') final  int minUsers;
@override final  String status;
@override@JsonKey(name: 'project_url') final  String? projectUrl;
@override final  int upvotes;
@override final  int downvotes;
@override final  String budget;
@override@JsonKey(name: 'points_earned') final  int pointsEarned;
@override final  Organizer? organizer;
 final  List<Tag>? _tags;
@override List<Tag>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Sponsor>? _sponsors;
@override List<Sponsor>? get sponsors {
  final value = _sponsors;
  if (value == null) return null;
  if (_sponsors is EqualUnmodifiableListView) return _sponsors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'created_at', fromJson: _parseDateTime) final  DateTime createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _parseDateTime) final  DateTime updatedAt;
// Added fields based on backend comparison
@override final  String? district;
@override@JsonKey(name: 'has_user_voted') final  bool? hasUserVoted;
@override@JsonKey(name: 'is_user_volunteer') final  bool? isUserVolunteer;
@override@JsonKey(name: 'is_user_leader') final  bool? isUserLeader;
@override@JsonKey(name: 'volunteers_count') final  int? volunteersCount;
@override@JsonKey(name: 'leaders_count') final  int? leadersCount;

/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectCopyWith<_Project> get copyWith => __$ProjectCopyWithImpl<_Project>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Project&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.body, body) || other.body == body)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.maxUsers, maxUsers) || other.maxUsers == maxUsers)&&(identical(other.minUsers, minUsers) || other.minUsers == minUsers)&&(identical(other.status, status) || other.status == status)&&(identical(other.projectUrl, projectUrl) || other.projectUrl == projectUrl)&&(identical(other.upvotes, upvotes) || other.upvotes == upvotes)&&(identical(other.downvotes, downvotes) || other.downvotes == downvotes)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.pointsEarned, pointsEarned) || other.pointsEarned == pointsEarned)&&(identical(other.organizer, organizer) || other.organizer == organizer)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._sponsors, _sponsors)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.district, district) || other.district == district)&&(identical(other.hasUserVoted, hasUserVoted) || other.hasUserVoted == hasUserVoted)&&(identical(other.isUserVolunteer, isUserVolunteer) || other.isUserVolunteer == isUserVolunteer)&&(identical(other.isUserLeader, isUserLeader) || other.isUserLeader == isUserLeader)&&(identical(other.volunteersCount, volunteersCount) || other.volunteersCount == volunteersCount)&&(identical(other.leadersCount, leadersCount) || other.leadersCount == leadersCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,body,startDate,endDate,maxUsers,minUsers,status,projectUrl,upvotes,downvotes,budget,pointsEarned,organizer,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_sponsors),createdAt,updatedAt,district,hasUserVoted,isUserVolunteer,isUserLeader,volunteersCount,leadersCount]);

@override
String toString() {
  return 'Project(id: $id, title: $title, description: $description, body: $body, startDate: $startDate, endDate: $endDate, maxUsers: $maxUsers, minUsers: $minUsers, status: $status, projectUrl: $projectUrl, upvotes: $upvotes, downvotes: $downvotes, budget: $budget, pointsEarned: $pointsEarned, organizer: $organizer, tags: $tags, sponsors: $sponsors, createdAt: $createdAt, updatedAt: $updatedAt, district: $district, hasUserVoted: $hasUserVoted, isUserVolunteer: $isUserVolunteer, isUserLeader: $isUserLeader, volunteersCount: $volunteersCount, leadersCount: $leadersCount)';
}


}

/// @nodoc
abstract mixin class _$ProjectCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$ProjectCopyWith(_Project value, $Res Function(_Project) _then) = __$ProjectCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String description, String? body,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime endDate,@JsonKey(name: 'max_users') int maxUsers,@JsonKey(name: 'min_users') int minUsers, String status,@JsonKey(name: 'project_url') String? projectUrl, int upvotes, int downvotes, String budget,@JsonKey(name: 'points_earned') int pointsEarned, Organizer? organizer, List<Tag>? tags, List<Sponsor>? sponsors,@JsonKey(name: 'created_at', fromJson: _parseDateTime) DateTime createdAt,@JsonKey(name: 'updated_at', fromJson: _parseDateTime) DateTime updatedAt, String? district,@JsonKey(name: 'has_user_voted') bool? hasUserVoted,@JsonKey(name: 'is_user_volunteer') bool? isUserVolunteer,@JsonKey(name: 'is_user_leader') bool? isUserLeader,@JsonKey(name: 'volunteers_count') int? volunteersCount,@JsonKey(name: 'leaders_count') int? leadersCount
});


@override $OrganizerCopyWith<$Res>? get organizer;

}
/// @nodoc
class __$ProjectCopyWithImpl<$Res>
    implements _$ProjectCopyWith<$Res> {
  __$ProjectCopyWithImpl(this._self, this._then);

  final _Project _self;
  final $Res Function(_Project) _then;

/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? body = freezed,Object? startDate = null,Object? endDate = null,Object? maxUsers = null,Object? minUsers = null,Object? status = null,Object? projectUrl = freezed,Object? upvotes = null,Object? downvotes = null,Object? budget = null,Object? pointsEarned = null,Object? organizer = freezed,Object? tags = freezed,Object? sponsors = freezed,Object? createdAt = null,Object? updatedAt = null,Object? district = freezed,Object? hasUserVoted = freezed,Object? isUserVolunteer = freezed,Object? isUserLeader = freezed,Object? volunteersCount = freezed,Object? leadersCount = freezed,}) {
  return _then(_Project(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,maxUsers: null == maxUsers ? _self.maxUsers : maxUsers // ignore: cast_nullable_to_non_nullable
as int,minUsers: null == minUsers ? _self.minUsers : minUsers // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,projectUrl: freezed == projectUrl ? _self.projectUrl : projectUrl // ignore: cast_nullable_to_non_nullable
as String?,upvotes: null == upvotes ? _self.upvotes : upvotes // ignore: cast_nullable_to_non_nullable
as int,downvotes: null == downvotes ? _self.downvotes : downvotes // ignore: cast_nullable_to_non_nullable
as int,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as String,pointsEarned: null == pointsEarned ? _self.pointsEarned : pointsEarned // ignore: cast_nullable_to_non_nullable
as int,organizer: freezed == organizer ? _self.organizer : organizer // ignore: cast_nullable_to_non_nullable
as Organizer?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<Tag>?,sponsors: freezed == sponsors ? _self._sponsors : sponsors // ignore: cast_nullable_to_non_nullable
as List<Sponsor>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,hasUserVoted: freezed == hasUserVoted ? _self.hasUserVoted : hasUserVoted // ignore: cast_nullable_to_non_nullable
as bool?,isUserVolunteer: freezed == isUserVolunteer ? _self.isUserVolunteer : isUserVolunteer // ignore: cast_nullable_to_non_nullable
as bool?,isUserLeader: freezed == isUserLeader ? _self.isUserLeader : isUserLeader // ignore: cast_nullable_to_non_nullable
as bool?,volunteersCount: freezed == volunteersCount ? _self.volunteersCount : volunteersCount // ignore: cast_nullable_to_non_nullable
as int?,leadersCount: freezed == leadersCount ? _self.leadersCount : leadersCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrganizerCopyWith<$Res>? get organizer {
    if (_self.organizer == null) {
    return null;
  }

  return $OrganizerCopyWith<$Res>(_self.organizer!, (value) {
    return _then(_self.copyWith(organizer: value));
  });
}
}

// dart format on

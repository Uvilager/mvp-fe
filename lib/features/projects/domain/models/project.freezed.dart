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

 int get id; String get title; String get description; String? get body;@JsonKey(name: 'start_date') DateTime get startDate;@JsonKey(name: 'end_date') DateTime get endDate;@JsonKey(name: 'max_users') int get maxUsers;@JsonKey(name: 'min_users') int get minUsers; String get status;@JsonKey(name: 'project_url') String? get projectUrl; int get upvotes; int get downvotes; String get budget;@JsonKey(name: 'points_earned') int get pointsEarned; Organizer get organizer; List<Tag> get tags; List<Sponsor> get sponsors;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectCopyWith<Project> get copyWith => _$ProjectCopyWithImpl<Project>(this as Project, _$identity);

  /// Serializes this Project to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Project&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.body, body) || other.body == body)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.maxUsers, maxUsers) || other.maxUsers == maxUsers)&&(identical(other.minUsers, minUsers) || other.minUsers == minUsers)&&(identical(other.status, status) || other.status == status)&&(identical(other.projectUrl, projectUrl) || other.projectUrl == projectUrl)&&(identical(other.upvotes, upvotes) || other.upvotes == upvotes)&&(identical(other.downvotes, downvotes) || other.downvotes == downvotes)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.pointsEarned, pointsEarned) || other.pointsEarned == pointsEarned)&&(identical(other.organizer, organizer) || other.organizer == organizer)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.sponsors, sponsors)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,body,startDate,endDate,maxUsers,minUsers,status,projectUrl,upvotes,downvotes,budget,pointsEarned,organizer,const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(sponsors),createdAt,updatedAt]);

@override
String toString() {
  return 'Project(id: $id, title: $title, description: $description, body: $body, startDate: $startDate, endDate: $endDate, maxUsers: $maxUsers, minUsers: $minUsers, status: $status, projectUrl: $projectUrl, upvotes: $upvotes, downvotes: $downvotes, budget: $budget, pointsEarned: $pointsEarned, organizer: $organizer, tags: $tags, sponsors: $sponsors, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ProjectCopyWith<$Res>  {
  factory $ProjectCopyWith(Project value, $Res Function(Project) _then) = _$ProjectCopyWithImpl;
@useResult
$Res call({
 int id, String title, String description, String? body,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime endDate,@JsonKey(name: 'max_users') int maxUsers,@JsonKey(name: 'min_users') int minUsers, String status,@JsonKey(name: 'project_url') String? projectUrl, int upvotes, int downvotes, String budget,@JsonKey(name: 'points_earned') int pointsEarned, Organizer organizer, List<Tag> tags, List<Sponsor> sponsors,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});


$OrganizerCopyWith<$Res> get organizer;

}
/// @nodoc
class _$ProjectCopyWithImpl<$Res>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._self, this._then);

  final Project _self;
  final $Res Function(Project) _then;

/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? body = freezed,Object? startDate = null,Object? endDate = null,Object? maxUsers = null,Object? minUsers = null,Object? status = null,Object? projectUrl = freezed,Object? upvotes = null,Object? downvotes = null,Object? budget = null,Object? pointsEarned = null,Object? organizer = null,Object? tags = null,Object? sponsors = null,Object? createdAt = null,Object? updatedAt = null,}) {
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
as int,organizer: null == organizer ? _self.organizer : organizer // ignore: cast_nullable_to_non_nullable
as Organizer,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<Tag>,sponsors: null == sponsors ? _self.sponsors : sponsors // ignore: cast_nullable_to_non_nullable
as List<Sponsor>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrganizerCopyWith<$Res> get organizer {
  
  return $OrganizerCopyWith<$Res>(_self.organizer, (value) {
    return _then(_self.copyWith(organizer: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Project implements Project {
  const _Project({required this.id, required this.title, required this.description, this.body, @JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'end_date') required this.endDate, @JsonKey(name: 'max_users') required this.maxUsers, @JsonKey(name: 'min_users') required this.minUsers, required this.status, @JsonKey(name: 'project_url') this.projectUrl, required this.upvotes, required this.downvotes, required this.budget, @JsonKey(name: 'points_earned') required this.pointsEarned, required this.organizer, required final  List<Tag> tags, required final  List<Sponsor> sponsors, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt}): _tags = tags,_sponsors = sponsors;
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
@override final  Organizer organizer;
 final  List<Tag> _tags;
@override List<Tag> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  List<Sponsor> _sponsors;
@override List<Sponsor> get sponsors {
  if (_sponsors is EqualUnmodifiableListView) return _sponsors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sponsors);
}

@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Project&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.body, body) || other.body == body)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.maxUsers, maxUsers) || other.maxUsers == maxUsers)&&(identical(other.minUsers, minUsers) || other.minUsers == minUsers)&&(identical(other.status, status) || other.status == status)&&(identical(other.projectUrl, projectUrl) || other.projectUrl == projectUrl)&&(identical(other.upvotes, upvotes) || other.upvotes == upvotes)&&(identical(other.downvotes, downvotes) || other.downvotes == downvotes)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.pointsEarned, pointsEarned) || other.pointsEarned == pointsEarned)&&(identical(other.organizer, organizer) || other.organizer == organizer)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._sponsors, _sponsors)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,body,startDate,endDate,maxUsers,minUsers,status,projectUrl,upvotes,downvotes,budget,pointsEarned,organizer,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_sponsors),createdAt,updatedAt]);

@override
String toString() {
  return 'Project(id: $id, title: $title, description: $description, body: $body, startDate: $startDate, endDate: $endDate, maxUsers: $maxUsers, minUsers: $minUsers, status: $status, projectUrl: $projectUrl, upvotes: $upvotes, downvotes: $downvotes, budget: $budget, pointsEarned: $pointsEarned, organizer: $organizer, tags: $tags, sponsors: $sponsors, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ProjectCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$ProjectCopyWith(_Project value, $Res Function(_Project) _then) = __$ProjectCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String description, String? body,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime endDate,@JsonKey(name: 'max_users') int maxUsers,@JsonKey(name: 'min_users') int minUsers, String status,@JsonKey(name: 'project_url') String? projectUrl, int upvotes, int downvotes, String budget,@JsonKey(name: 'points_earned') int pointsEarned, Organizer organizer, List<Tag> tags, List<Sponsor> sponsors,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});


@override $OrganizerCopyWith<$Res> get organizer;

}
/// @nodoc
class __$ProjectCopyWithImpl<$Res>
    implements _$ProjectCopyWith<$Res> {
  __$ProjectCopyWithImpl(this._self, this._then);

  final _Project _self;
  final $Res Function(_Project) _then;

/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? body = freezed,Object? startDate = null,Object? endDate = null,Object? maxUsers = null,Object? minUsers = null,Object? status = null,Object? projectUrl = freezed,Object? upvotes = null,Object? downvotes = null,Object? budget = null,Object? pointsEarned = null,Object? organizer = null,Object? tags = null,Object? sponsors = null,Object? createdAt = null,Object? updatedAt = null,}) {
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
as int,organizer: null == organizer ? _self.organizer : organizer // ignore: cast_nullable_to_non_nullable
as Organizer,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<Tag>,sponsors: null == sponsors ? _self._sponsors : sponsors // ignore: cast_nullable_to_non_nullable
as List<Sponsor>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrganizerCopyWith<$Res> get organizer {
  
  return $OrganizerCopyWith<$Res>(_self.organizer, (value) {
    return _then(_self.copyWith(organizer: value));
  });
}
}

// dart format on

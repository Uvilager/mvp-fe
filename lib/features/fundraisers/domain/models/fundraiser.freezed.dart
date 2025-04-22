// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fundraiser.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Fundraiser {

 int get id;@JsonKey(name: 'project_id') int get projectId; String get title; String get description;@JsonKey(name: 'image_url') String? get imageUrl; String get type; String get status;@JsonKey(name: 'start_date') DateTime get startDate;@JsonKey(name: 'end_date') DateTime get endDate; double get goal;// Assuming goal can be decimal
 double get raised;// Assuming raised can be decimal
@JsonKey(name: 'raised_percentage') double get raisedPercentage;@JsonKey(name: 'unique_code') String? get uniqueCode;@JsonKey(name: 'days_remaining') double get daysRemaining;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of Fundraiser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FundraiserCopyWith<Fundraiser> get copyWith => _$FundraiserCopyWithImpl<Fundraiser>(this as Fundraiser, _$identity);

  /// Serializes this Fundraiser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Fundraiser&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.raised, raised) || other.raised == raised)&&(identical(other.raisedPercentage, raisedPercentage) || other.raisedPercentage == raisedPercentage)&&(identical(other.uniqueCode, uniqueCode) || other.uniqueCode == uniqueCode)&&(identical(other.daysRemaining, daysRemaining) || other.daysRemaining == daysRemaining)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,title,description,imageUrl,type,status,startDate,endDate,goal,raised,raisedPercentage,uniqueCode,daysRemaining,createdAt,updatedAt);

@override
String toString() {
  return 'Fundraiser(id: $id, projectId: $projectId, title: $title, description: $description, imageUrl: $imageUrl, type: $type, status: $status, startDate: $startDate, endDate: $endDate, goal: $goal, raised: $raised, raisedPercentage: $raisedPercentage, uniqueCode: $uniqueCode, daysRemaining: $daysRemaining, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $FundraiserCopyWith<$Res>  {
  factory $FundraiserCopyWith(Fundraiser value, $Res Function(Fundraiser) _then) = _$FundraiserCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'project_id') int projectId, String title, String description,@JsonKey(name: 'image_url') String? imageUrl, String type, String status,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime endDate, double goal, double raised,@JsonKey(name: 'raised_percentage') double raisedPercentage,@JsonKey(name: 'unique_code') String? uniqueCode,@JsonKey(name: 'days_remaining') double daysRemaining,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$FundraiserCopyWithImpl<$Res>
    implements $FundraiserCopyWith<$Res> {
  _$FundraiserCopyWithImpl(this._self, this._then);

  final Fundraiser _self;
  final $Res Function(Fundraiser) _then;

/// Create a copy of Fundraiser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? projectId = null,Object? title = null,Object? description = null,Object? imageUrl = freezed,Object? type = null,Object? status = null,Object? startDate = null,Object? endDate = null,Object? goal = null,Object? raised = null,Object? raisedPercentage = null,Object? uniqueCode = freezed,Object? daysRemaining = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as double,raised: null == raised ? _self.raised : raised // ignore: cast_nullable_to_non_nullable
as double,raisedPercentage: null == raisedPercentage ? _self.raisedPercentage : raisedPercentage // ignore: cast_nullable_to_non_nullable
as double,uniqueCode: freezed == uniqueCode ? _self.uniqueCode : uniqueCode // ignore: cast_nullable_to_non_nullable
as String?,daysRemaining: null == daysRemaining ? _self.daysRemaining : daysRemaining // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Fundraiser implements Fundraiser {
  const _Fundraiser({required this.id, @JsonKey(name: 'project_id') required this.projectId, required this.title, required this.description, @JsonKey(name: 'image_url') this.imageUrl, required this.type, required this.status, @JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'end_date') required this.endDate, required this.goal, required this.raised, @JsonKey(name: 'raised_percentage') required this.raisedPercentage, @JsonKey(name: 'unique_code') this.uniqueCode, @JsonKey(name: 'days_remaining') required this.daysRemaining, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _Fundraiser.fromJson(Map<String, dynamic> json) => _$FundraiserFromJson(json);

@override final  int id;
@override@JsonKey(name: 'project_id') final  int projectId;
@override final  String title;
@override final  String description;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override final  String type;
@override final  String status;
@override@JsonKey(name: 'start_date') final  DateTime startDate;
@override@JsonKey(name: 'end_date') final  DateTime endDate;
@override final  double goal;
// Assuming goal can be decimal
@override final  double raised;
// Assuming raised can be decimal
@override@JsonKey(name: 'raised_percentage') final  double raisedPercentage;
@override@JsonKey(name: 'unique_code') final  String? uniqueCode;
@override@JsonKey(name: 'days_remaining') final  double daysRemaining;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of Fundraiser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FundraiserCopyWith<_Fundraiser> get copyWith => __$FundraiserCopyWithImpl<_Fundraiser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FundraiserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Fundraiser&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.raised, raised) || other.raised == raised)&&(identical(other.raisedPercentage, raisedPercentage) || other.raisedPercentage == raisedPercentage)&&(identical(other.uniqueCode, uniqueCode) || other.uniqueCode == uniqueCode)&&(identical(other.daysRemaining, daysRemaining) || other.daysRemaining == daysRemaining)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,title,description,imageUrl,type,status,startDate,endDate,goal,raised,raisedPercentage,uniqueCode,daysRemaining,createdAt,updatedAt);

@override
String toString() {
  return 'Fundraiser(id: $id, projectId: $projectId, title: $title, description: $description, imageUrl: $imageUrl, type: $type, status: $status, startDate: $startDate, endDate: $endDate, goal: $goal, raised: $raised, raisedPercentage: $raisedPercentage, uniqueCode: $uniqueCode, daysRemaining: $daysRemaining, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$FundraiserCopyWith<$Res> implements $FundraiserCopyWith<$Res> {
  factory _$FundraiserCopyWith(_Fundraiser value, $Res Function(_Fundraiser) _then) = __$FundraiserCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'project_id') int projectId, String title, String description,@JsonKey(name: 'image_url') String? imageUrl, String type, String status,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime endDate, double goal, double raised,@JsonKey(name: 'raised_percentage') double raisedPercentage,@JsonKey(name: 'unique_code') String? uniqueCode,@JsonKey(name: 'days_remaining') double daysRemaining,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$FundraiserCopyWithImpl<$Res>
    implements _$FundraiserCopyWith<$Res> {
  __$FundraiserCopyWithImpl(this._self, this._then);

  final _Fundraiser _self;
  final $Res Function(_Fundraiser) _then;

/// Create a copy of Fundraiser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? projectId = null,Object? title = null,Object? description = null,Object? imageUrl = freezed,Object? type = null,Object? status = null,Object? startDate = null,Object? endDate = null,Object? goal = null,Object? raised = null,Object? raisedPercentage = null,Object? uniqueCode = freezed,Object? daysRemaining = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Fundraiser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as double,raised: null == raised ? _self.raised : raised // ignore: cast_nullable_to_non_nullable
as double,raisedPercentage: null == raisedPercentage ? _self.raisedPercentage : raisedPercentage // ignore: cast_nullable_to_non_nullable
as double,uniqueCode: freezed == uniqueCode ? _self.uniqueCode : uniqueCode // ignore: cast_nullable_to_non_nullable
as String?,daysRemaining: null == daysRemaining ? _self.daysRemaining : daysRemaining // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on

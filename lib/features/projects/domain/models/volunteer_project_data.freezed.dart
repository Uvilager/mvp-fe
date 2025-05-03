// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'volunteer_project_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VolunteerProjectData {

 Project get project;@JsonKey(name: 'is_leader') bool get isLeader; List<Leader> get leaders; List<Volunteer> get volunteers; List<Message> get messages;
/// Create a copy of VolunteerProjectData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VolunteerProjectDataCopyWith<VolunteerProjectData> get copyWith => _$VolunteerProjectDataCopyWithImpl<VolunteerProjectData>(this as VolunteerProjectData, _$identity);

  /// Serializes this VolunteerProjectData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VolunteerProjectData&&(identical(other.project, project) || other.project == project)&&(identical(other.isLeader, isLeader) || other.isLeader == isLeader)&&const DeepCollectionEquality().equals(other.leaders, leaders)&&const DeepCollectionEquality().equals(other.volunteers, volunteers)&&const DeepCollectionEquality().equals(other.messages, messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,project,isLeader,const DeepCollectionEquality().hash(leaders),const DeepCollectionEquality().hash(volunteers),const DeepCollectionEquality().hash(messages));

@override
String toString() {
  return 'VolunteerProjectData(project: $project, isLeader: $isLeader, leaders: $leaders, volunteers: $volunteers, messages: $messages)';
}


}

/// @nodoc
abstract mixin class $VolunteerProjectDataCopyWith<$Res>  {
  factory $VolunteerProjectDataCopyWith(VolunteerProjectData value, $Res Function(VolunteerProjectData) _then) = _$VolunteerProjectDataCopyWithImpl;
@useResult
$Res call({
 Project project,@JsonKey(name: 'is_leader') bool isLeader, List<Leader> leaders, List<Volunteer> volunteers, List<Message> messages
});


$ProjectCopyWith<$Res> get project;

}
/// @nodoc
class _$VolunteerProjectDataCopyWithImpl<$Res>
    implements $VolunteerProjectDataCopyWith<$Res> {
  _$VolunteerProjectDataCopyWithImpl(this._self, this._then);

  final VolunteerProjectData _self;
  final $Res Function(VolunteerProjectData) _then;

/// Create a copy of VolunteerProjectData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? project = null,Object? isLeader = null,Object? leaders = null,Object? volunteers = null,Object? messages = null,}) {
  return _then(_self.copyWith(
project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as Project,isLeader: null == isLeader ? _self.isLeader : isLeader // ignore: cast_nullable_to_non_nullable
as bool,leaders: null == leaders ? _self.leaders : leaders // ignore: cast_nullable_to_non_nullable
as List<Leader>,volunteers: null == volunteers ? _self.volunteers : volunteers // ignore: cast_nullable_to_non_nullable
as List<Volunteer>,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,
  ));
}
/// Create a copy of VolunteerProjectData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectCopyWith<$Res> get project {
  
  return $ProjectCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _VolunteerProjectData implements VolunteerProjectData {
  const _VolunteerProjectData({required this.project, @JsonKey(name: 'is_leader') required this.isLeader, required final  List<Leader> leaders, required final  List<Volunteer> volunteers, required final  List<Message> messages}): _leaders = leaders,_volunteers = volunteers,_messages = messages;
  factory _VolunteerProjectData.fromJson(Map<String, dynamic> json) => _$VolunteerProjectDataFromJson(json);

@override final  Project project;
@override@JsonKey(name: 'is_leader') final  bool isLeader;
 final  List<Leader> _leaders;
@override List<Leader> get leaders {
  if (_leaders is EqualUnmodifiableListView) return _leaders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_leaders);
}

 final  List<Volunteer> _volunteers;
@override List<Volunteer> get volunteers {
  if (_volunteers is EqualUnmodifiableListView) return _volunteers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_volunteers);
}

 final  List<Message> _messages;
@override List<Message> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of VolunteerProjectData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VolunteerProjectDataCopyWith<_VolunteerProjectData> get copyWith => __$VolunteerProjectDataCopyWithImpl<_VolunteerProjectData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VolunteerProjectDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VolunteerProjectData&&(identical(other.project, project) || other.project == project)&&(identical(other.isLeader, isLeader) || other.isLeader == isLeader)&&const DeepCollectionEquality().equals(other._leaders, _leaders)&&const DeepCollectionEquality().equals(other._volunteers, _volunteers)&&const DeepCollectionEquality().equals(other._messages, _messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,project,isLeader,const DeepCollectionEquality().hash(_leaders),const DeepCollectionEquality().hash(_volunteers),const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'VolunteerProjectData(project: $project, isLeader: $isLeader, leaders: $leaders, volunteers: $volunteers, messages: $messages)';
}


}

/// @nodoc
abstract mixin class _$VolunteerProjectDataCopyWith<$Res> implements $VolunteerProjectDataCopyWith<$Res> {
  factory _$VolunteerProjectDataCopyWith(_VolunteerProjectData value, $Res Function(_VolunteerProjectData) _then) = __$VolunteerProjectDataCopyWithImpl;
@override @useResult
$Res call({
 Project project,@JsonKey(name: 'is_leader') bool isLeader, List<Leader> leaders, List<Volunteer> volunteers, List<Message> messages
});


@override $ProjectCopyWith<$Res> get project;

}
/// @nodoc
class __$VolunteerProjectDataCopyWithImpl<$Res>
    implements _$VolunteerProjectDataCopyWith<$Res> {
  __$VolunteerProjectDataCopyWithImpl(this._self, this._then);

  final _VolunteerProjectData _self;
  final $Res Function(_VolunteerProjectData) _then;

/// Create a copy of VolunteerProjectData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? project = null,Object? isLeader = null,Object? leaders = null,Object? volunteers = null,Object? messages = null,}) {
  return _then(_VolunteerProjectData(
project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as Project,isLeader: null == isLeader ? _self.isLeader : isLeader // ignore: cast_nullable_to_non_nullable
as bool,leaders: null == leaders ? _self._leaders : leaders // ignore: cast_nullable_to_non_nullable
as List<Leader>,volunteers: null == volunteers ? _self._volunteers : volunteers // ignore: cast_nullable_to_non_nullable
as List<Volunteer>,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,
  ));
}

/// Create a copy of VolunteerProjectData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectCopyWith<$Res> get project {
  
  return $ProjectCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}

// dart format on

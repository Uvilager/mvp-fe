import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tag.freezed.dart';
part 'tag.g.dart';

@freezed
sealed class Tag with _$Tag {
  const factory Tag({
    required int id,
    required String name,
    required String slug,
  }) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
} 
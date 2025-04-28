import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tag.freezed.dart';
part 'tag.g.dart';

@freezed
sealed class Tag with _$Tag {
  const factory Tag({
    required int id,
    required String name,
    // Removed slug as it's not in the backend model
    // required String slug,
    // Added timestamps from backend model
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}

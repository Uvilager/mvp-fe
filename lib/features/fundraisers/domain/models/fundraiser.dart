import 'package:freezed_annotation/freezed_annotation.dart';

part 'fundraiser.freezed.dart';
part 'fundraiser.g.dart';

@freezed
sealed class Fundraiser with _$Fundraiser {
  const factory Fundraiser({
    required int id,
    @JsonKey(name: 'project_id') required int projectId,
    required String title,
    required String description,
    @JsonKey(name: 'image_url') String? imageUrl,
    required String type,
    required String status,
    @JsonKey(name: 'start_date') required DateTime startDate,
    @JsonKey(name: 'end_date') required DateTime endDate,
    required double goal, // Assuming goal can be decimal
    required double raised, // Assuming raised can be decimal
    @JsonKey(name: 'raised_percentage') required double raisedPercentage,
    @JsonKey(name: 'unique_code') String? uniqueCode,
    @JsonKey(name: 'days_remaining') required double daysRemaining,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Fundraiser;

  factory Fundraiser.fromJson(Map<String, dynamic> json) =>
      _$FundraiserFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sponsor.freezed.dart';
part 'sponsor.g.dart';

@freezed
sealed class Sponsor with _$Sponsor {
  const factory Sponsor({
    required int id,
    required String name,
    required String logoUrl,
    required String websiteUrl,
  }) = _Sponsor;

  factory Sponsor.fromJson(Map<String, dynamic> json) => _$SponsorFromJson(json);
} 
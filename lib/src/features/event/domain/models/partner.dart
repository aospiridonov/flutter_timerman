import 'package:freezed_annotation/freezed_annotation.dart';

part 'partner.freezed.dart';
part 'partner.g.dart';

@freezed
class Partner with _$Partner {
  factory Partner({
    @JsonKey(ignore: true, includeIfNull: false) @Default('') String id,
    required String title,
    required String imageUrl,
    required String linkUrl,
  }) = _Partner;

  factory Partner.fromJson(Map<String, dynamic> json) =>
      _$PartnerFromJson(json);
}

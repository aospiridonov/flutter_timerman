import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../event/domain/models/partner.dart';
import 'type.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  @JsonSerializable(explicitToJson: true)
  const factory Event({
    @JsonKey(ignore: true, includeIfNull: false) @Default('') String id,
    required String dateLabel,
    required DateTime date,
    required String title,
    required String imageUrl,
    required String shortDescription,
    required String longDescription,
    required String price,
    @Default(<Type>[]) List<Type> types,
  }) = _Event;

  factory Event.empty() => Event(
        title: '',
        date: DateTime.now(),
        dateLabel: '',
        imageUrl: '',
        longDescription: '',
        price: '',
        shortDescription: '',
      );

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}

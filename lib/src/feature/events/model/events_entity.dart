import 'package:flutter_timerman/src/feature/events/model/event_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'events_entity.freezed.dart';
part 'events_entity.g.dart';

@freezed
class EventsEntity with _$EventsEntity {
  const factory EventsEntity({
    required String dateLabel,
    required DateTime date,
    required String title,
    required String imageUrl,
    required String description,
    @Default(<EventType>[]) List<EventType> eventTypes,
  }) = _EventsEntity;

  factory EventsEntity.fromJson(Map<String, dynamic> json) =>
      _$EventsEntityFromJson(json);
}

part of 'events_bloc.dart';

@freezed
class EventsEvent with _$EventsEvent {
  const factory EventsEvent.fetch({
    required Filter filter,
  }) = EventsEventFetch;
}

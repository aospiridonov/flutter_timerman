part of 'events_bloc.dart';

@freezed
class EventsState with _$EventsState {
  const factory EventsState.initial() = EventsStateInitial;
  const factory EventsState.loading() = EventsStateLoading;
  const factory EventsState.success({required List<Event> events}) =
      EventsStateSuccess;
  const factory EventsState.failure() = EventsStateFailure;

  factory EventsState.fromJson(Map<String, dynamic> json) =>
      _$EventsStateFromJson(json);
}

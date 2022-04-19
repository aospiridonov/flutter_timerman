part of 'event_bloc.dart';

@freezed
class EventState with _$EventState {
  const factory EventState.init() = EventStateInit;
  const factory EventState.loaded({required Event event}) = EventStateLoaded;
  const factory EventState.modified({required Event event}) =
      EventStateModified;
  const factory EventState.deleted({required String eventId}) =
      EventStateDeleted;
}

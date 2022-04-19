part of 'event_bloc.dart';

@freezed
class EventEvent with _$EventEvent {
  const factory EventEvent.init({required Event event}) = EventEventInit;
  const factory EventEvent.add({required Event event}) = EventEventAdd;
  const factory EventEvent.update({required Event event}) = EventEventUpdate;
  const factory EventEvent.delete({required String eventId}) = EventEventDelete;
}

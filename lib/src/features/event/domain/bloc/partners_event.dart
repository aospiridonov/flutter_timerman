part of 'partners_bloc.dart';

@freezed
class PartnersEvent with _$PartnersEvent {
  const factory PartnersEvent.fetch({required String eventId}) =
      PartnersEventFetch;
}

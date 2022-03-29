import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/models.dart';
import '../repositrory/repository.dart';

part 'events_bloc.freezed.dart';
part 'events_bloc.g.dart';

part 'events_state.dart';
part 'events_event.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  EventsBloc({required EventsRepository repository})
      : _repository = repository,
        super(const EventsState.loading()) {
    on<EventsEventFetch>(_onFetchEvents);
  }

  final EventsRepository _repository;

  Future<void> _onFetchEvents(
    EventsEventFetch event,
    Emitter<EventsState> emit,
  ) async {
    emit(const EventsState.loading());
    
    await emit.forEach<List<Event>>(
      _repository.getEvents(filter: event.filter),
      onData: (events) => EventsState.success(events: events),
      onError: (_, __) => const EventsState.failure(),
    );
  }
}

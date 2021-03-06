import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timerman/src/features/event/domain/repository/event_repository.dart';
import 'package:flutter_timerman/src/features/events/domain/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_bloc.freezed.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  EventBloc({required EventRepository repository})
      : _repository = repository,
        super(const EventStateInit()) {
    on<EventEventInit>(_onInitEvent);
    on<EventEventAdd>(_onAddEvent);
    on<EventEventUpdate>(_onUpdateEvent);
    on<EventEventDelete>(_onDeleteEvent);
  }

  final EventRepository _repository;

  Future<void> _onInitEvent(EventEventInit event, Emitter emit) async {
    emit(EventStateLoaded(event: event.event));
  }

  Future<void> _onAddEvent(EventEventAdd event, Emitter emit) async {
    //repository and callback as fetch
    //emit(EventStat)
  }

  Future<void> _onUpdateEvent(EventEventUpdate event, Emitter emit) async {
    //
  }

  Future<void> _onDeleteEvent(EventEventDelete event, Emitter emit) async {
    //TODO: think about it
    //emit(EventState.deleted(eventId: _event.id));
  }
}

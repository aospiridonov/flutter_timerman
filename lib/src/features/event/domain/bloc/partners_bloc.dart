import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timerman/src/features/event/domain/models/models.dart';
import 'package:flutter_timerman/src/features/event/domain/repository/event_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'partners_bloc.freezed.dart';
part 'partners_bloc.g.dart';

part 'partners_event.dart';
part 'partners_state.dart';

class PartnersBloc extends Bloc<PartnersEvent, PartnersState> {
  PartnersBloc({required EventRepository repository})
      : _repository = repository,
        super(const PartnersState.loading()) {
    on<PartnersEventFetch>(_onFetchPartners);
  }

  final EventRepository _repository;

  Future<void> _onFetchPartners(
    PartnersEventFetch event,
    Emitter<PartnersState> emit,
  ) async {
    emit(const PartnersState.loading());
    await emit.forEach<List<Partner>>(
      _repository.getPartners(eventId: event.eventId),
      onData: (partners) => PartnersState.success(partners: partners),
      onError: (_, __) => const PartnersState.failure(),
    );
  }
}

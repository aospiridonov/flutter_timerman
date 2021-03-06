import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timerman/src/features/event/data/repository/firebase_event_repository.dart';
import 'package:flutter_timerman/src/features/event/domain/bloc/event_bloc.dart';
import 'package:flutter_timerman/src/features/event/domain/bloc/partners_bloc.dart';
import 'package:flutter_timerman/src/features/event/presentation/widgets/event_view.dart';
import 'package:flutter_timerman/src/features/events/domain/models/models.dart';

class EventPage extends StatelessWidget {
  const EventPage({
    Key? key,
  }) : super(key: key);

  static Route<void> route({required Event event}) {
    return MaterialPageRoute(
      fullscreenDialog: false,
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                EventBloc(repository: FirebaseEventRepository())
                  ..add(EventEventInit(event: event)),
          ),
          BlocProvider(
            create: (context) =>
                PartnersBloc(repository: FirebaseEventRepository()),
          ),
        ],
        child: const EventPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PartnersBloc, PartnersState>(
          listener: (context, state) {
            // TODO: implement listener
          },
        ),
        BlocListener<EventBloc, EventState>(
          listener: (context, state) {
            if (state is EventStateLoaded) {
              context
                  .read<PartnersBloc>()
                  .add(PartnersEvent.fetch(eventId: state.event.id));
            }
          },
        ),
      ],
      child: const EventView(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timerman/src/features/events/data/repository/firestore_events_repository.dart';
import 'package:flutter_timerman/src/features/events/domain/bloc/events_bloc.dart';
import '../widgets/widgets.dart';
import '../../domain/models/models.dart';
import 'package:page_transition/page_transition.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<EventsBloc, EventsState>(
          bloc: EventsBloc(repository: FirestoreEventsRepository())
            ..add(EventsEventFetch(filter: Filter())),
          builder: (context, state) {
            if (state is EventsStateLoading) {
              return const Center(
                child: CircularProgressIndicator(), //TODO: add cupertino
              );
            } else if (state is! EventsStateSuccess) {
              return Container();
            }
            // is EventsStateSuccess
            return EventsWidget(events: state.events);
          },
        ),
        Row(
          children: _filterEvents(),
        ),
      ],
    );
  }

  Widget _topButton({
    required String title,
    required Icon icon,
    required VoidCallback? onPressed,
  }) {
    return Expanded(
      child: OutlinedButton.icon(
        icon: icon,
        label: Text(title),
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          primary: const Color(0xFFC81426),
          onSurface: Colors.black,
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          textStyle: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }

  List<Widget> _filterEvents() {
    return [
      _topButton(
        icon: const Icon(Icons.ac_unit),
        title: 'Virtual',
        onPressed: () {},
      ),
      const SizedBox(
        width: 1,
      ),
      _topButton(
        icon: const Icon(Icons.access_alarm),
        title: 'Real',
        onPressed: null,
      ),
    ];
  }
}

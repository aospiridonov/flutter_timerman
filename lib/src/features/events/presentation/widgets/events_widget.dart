import 'package:flutter/material.dart';
import '../../domain/models/models.dart';
import 'event_widget.dart';

class EventsWidget extends StatelessWidget {
  const EventsWidget({Key? key, required this.events}) : super(key: key);

  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(
        left: 5,
        right: 5,
        top: 45,
        bottom: 5,
      ),
      itemCount: events.length,
      itemBuilder: (context, index) => EventWidget(event: events[index]),
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 10,
      ),
    );
    ;
  }
}

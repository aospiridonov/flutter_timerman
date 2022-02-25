import 'package:flutter/material.dart';
import 'package:flutter_timerman/src/feature/events/model/events_entity.dart';
import 'package:flutter_timerman/src/feature/events/widget/event_preview_widget.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({
    Key? key,
    required this.events,
  }) : super(key: key);

  final List<EventsEntity> events;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: ListView.separated(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
              top: 45,
              bottom: 5,
            ),
            itemCount: events.length,
            itemBuilder: (context, index) =>
                EventPreviewWidget(event: events[index]),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 10,
            ),
          ),
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
        icon: const Icon(Icons.ac_unit),
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

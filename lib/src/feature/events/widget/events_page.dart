import 'package:flutter/material.dart';
import 'package:flutter_timerman/src/feature/events/widget/event_preview_widget.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: _filterEvents(),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: 10,
            itemBuilder: (context, index) => const EventPreviewWidget(),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 10,
            ),
          ),
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
          padding: const EdgeInsets.all(10),
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

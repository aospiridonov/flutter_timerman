import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timerman/src/features/events/domain/models/models.dart';
import 'package:flutter_timerman/src/features/participate_event/widget/participate_event_page.dart';

import 'package:page_transition/page_transition.dart';

class EventPage extends StatelessWidget {
  const EventPage({
    Key? key,
    required this.event,
  }) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('О событии'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                event.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Center(
              child: Text(event.dateLabel),
            ),
            const SizedBox(height: 5),
            _makeImage(),
            const SizedBox(height: 5),
            Row(
              children: [
                const Text('Стоимость:'),
                const SizedBox(width: 5),
                Text(event.price),
              ],
            ),
            const SizedBox(height: 5),
            const Text('Описание:'),
            const SizedBox(height: 5),
            Text(
              event.longDescription,
              softWrap: true,
            ),
            const SizedBox(height: 5),
            const Text('Партнеры:'),
            //ResponsiveGridList or ResponsiveSliverGridList
            const Spacer(),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                alignment: Alignment.centerLeft,
              ),
              child: const Text(
                'Положение о соревновании',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () => _onParticipate(context),
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                onSurface: Colors.black,
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                textStyle: const TextStyle(
                  //color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
                //side: BorderSide(color: Colors.white, width: 2),
              ),
              child: const Text(
                'УЧАСТВОВАТЬ',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _makeImage() {
    return Container(
      color: Colors.black.withOpacity(0.6),
      height: 200,
      child: CachedNetworkImage(
        maxWidthDiskCache: 500,
        imageUrl: event.imageUrl,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.srcATop,
              ),
              image: imageProvider,
            ),
          ),
        ),
      ),
    );
  }

  void _onParticipate(BuildContext context) {
    Navigator.push<void>(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeftWithFade,
        child: ParticipateEventPage(
          event: event,
        ),
        inheritTheme: true,
        alignment: Alignment.topCenter,
        ctx: context,
      ),
    ); //const ,
  }
}

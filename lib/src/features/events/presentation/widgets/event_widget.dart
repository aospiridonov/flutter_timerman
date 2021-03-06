import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_timerman/src/features/event/presentation/pages/event_page.dart';
import '../../domain/models/models.dart';
import 'package:page_transition/page_transition.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({
    Key? key,
    required this.event,
  }) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          _makeBackgroundWiget(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _makeDateWidget(),
                    _makeEventTypesWidget(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    event.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    event.shortDescription,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: OutlinedButton(
                          onPressed: () => _onEventPage(context),
                          style: OutlinedButton.styleFrom(
                            primary: Colors.white,
                            onSurface: Colors.black,
                            backgroundColor: Colors.white.withOpacity(0),
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            textStyle: const TextStyle(
                              //color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                            side: const BorderSide(
                              color: Colors.white,
                              width: 1.1,
                            ),
                          ),
                          child: const Text(
                            '?? ??????????????',
                          ),
                        ),
                      ),
                      Flexible(
                        child: OutlinedButton(
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
                            '??????????????????????',
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _makeEventTypesWidget() {
    final eventTypes = event.types;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List<Widget>.generate(
        eventTypes.length,
        (index) => Container(
          padding: const EdgeInsets.symmetric(
            vertical: 3,
            horizontal: 10,
          ),
          color: Color(eventTypes[index].color),
          child: Text(
            eventTypes[index].label.toUpperCase(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Container _makeDateWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        event.dateLabel,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget _makeBackgroundWiget() {
    return Container(
      color: Colors.black.withOpacity(0.6),
      child: CachedNetworkImage(
        maxWidthDiskCache: 300,
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
        /*
        progressIndicatorBuilder: (context, url, progress) => Center(
          child: CircularProgressIndicator(
            //backgroundColor: Colors.black.withOpacity(0.6),
            color: Colors.white,
            value: progress.progress,
          ),
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.black.withOpacity(0.6),
        ),
        */
      ),
    );
  }

  void _onEventPage(BuildContext context) {
    Navigator.of(context).push(EventPage.route(event: event));
    /*
    Navigator.push<void>(
      context,
      PageTransition(
        type: PageTransitionType.bottomToTop,
        child: EventPage(
          event: event,
        ),
        inheritTheme: true,
        alignment: Alignment.topCenter,
        ctx: context,
      ),
    ); //const ,
    */
  }

  void _onParticipate(BuildContext context) {
    /*
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
    */
  }
}

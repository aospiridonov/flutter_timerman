import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timerman/src/features/event/domain/bloc/event_bloc.dart';

class EventView extends StatelessWidget {
  const EventView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final event = context.select((EventBloc bloc) => bloc.event);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Соревнование',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: BlocBuilder<EventBloc, EventState>(
        builder: (context, state) {
          if (state is! EventStateLoaded) {
            return CircularProgressIndicator();
          } else {
            final event = state.event;
            return Stack(
              children: [
                Container(
                  color: Colors.black.withOpacity(0.6),
                  height: 195,
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
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 160,
                      left: 8,
                      right: 8,
                      bottom: 8,
                    ),
                    child: Container(
                      color: Colors.blue,
                      height: 20,
                    ),
                    
                  ),
                ),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    height: 80,
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

/*
  Container lastPresentation(BuildContext context) {
    //TODO: remove later
    return Container(
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
  */
}

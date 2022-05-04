import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timerman/src/core/util.dart';
import 'package:flutter_timerman/src/features/event/domain/bloc/event_bloc.dart';
import 'package:flutter_timerman/src/features/event/presentation/widgets/partners_view.dart';

class EventView extends StatelessWidget {
  const EventView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final event = context.select((EventBloc bloc) => bloc.event);
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.competition,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: BlocBuilder<EventBloc, EventState>(
        builder: (context, state) {
          if (state is! EventStateLoaded) {
            return const CircularProgressIndicator();
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
                      left: 16,
                      right: 16,
                      bottom: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          //color: Colors.white,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          //color: Colors.white,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          event.title,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF515151),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          event.longDescription,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            //color: Color(0xFF515151),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 24),
                        Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                l10n.partners,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF8F8F8F),
                                ),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(height: 16),
                              PartnersView(),
                              const SizedBox(height: 80),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    height: 80,
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(l10n.participate),
                      ),
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

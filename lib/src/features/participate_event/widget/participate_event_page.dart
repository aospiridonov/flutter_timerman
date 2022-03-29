import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timerman/src/core/widgets/widgets.dart';
import 'package:flutter_timerman/src/features/events/domain/models/models.dart';

class ParticipateEventPage extends StatelessWidget {
  const ParticipateEventPage({
    Key? key,
    required this.event,
  }) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Участвовать'),
      ),
      body: Stack(
        children: [
          _makeBackgroundWiget(),
          Padding(
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
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 45),
                Row(
                  children: [
                    const Text(
                      'Стоимость:',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      event.price,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                CustomCheckbox(
                  onChanged: (bool value) {},
                  value: true,
                  child: Text('asd'),
                ),
                const Spacer(),
                OutlinedButton(
                  onPressed: () {},
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
                    'ОПЛАТИТЬ',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _makeBackgroundWiget() {
    return Container(
      color: Colors.black.withOpacity(0.6),
      child: CachedNetworkImage(
        //maxWidthDiskCache: 600,
        maxHeightDiskCache: 800,
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
}

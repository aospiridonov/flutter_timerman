import 'package:flutter/material.dart';

class EventPreviewWidget extends StatelessWidget {
  const EventPreviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6),
            BlendMode.dstATop,
          ),
          image: AssetImage(
            'assets/images/event_2.jpg',
          ), //NetworkImage("https://picsum.photos/id/237/200/300"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    '5 марта - 5 апреля',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: 100,
                      padding: const EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 20,
                      ),
                      color: Colors.blue,
                      child: Text(
                        'Онлайн'.toUpperCase(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      width: 100,
                      padding: const EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 20,
                      ),
                      color: Colors.cyan,
                      child: Text(
                        'type2'.toUpperCase(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: const Text(
                'Казанский марафон 2022',
                style: TextStyle(
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
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Description \n max two lines',
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
                      onPressed: () {},
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
                        side: const BorderSide(color: Colors.white, width: 1),
                      ),
                      child: const Text(
                        'О СОБЫТИИ',
                      ),
                    ),
                  ),
                  Flexible(
                    child: OutlinedButton(
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
                        'УЧАСТВОВАТЬ',
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

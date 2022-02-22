import 'package:flutter/material.dart';

class EventPreviewWidget extends StatelessWidget {
  const EventPreviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('date'),
              Column(
                children: const [
                  Text('type1'),
                  Text('type2'),
                ],
              ),
            ],
          ),
          const Text('even name'),
          Row(
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
                      fontSize: 18,
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
                      fontSize: 18,
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
          )
        ],
      ),
    );
  }
}

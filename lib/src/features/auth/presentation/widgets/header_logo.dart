import 'package:flutter/material.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      //fit: StackFit.loose,
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/background.jpg',
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Container(
          color: const Color.fromRGBO(0, 0, 0, 0.2),
        ),
        Container(
          margin: const EdgeInsets.only(top: 25),
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: 300,
            //height: 50,
            child: Image.asset(
              'assets/images/timerman.png',
              width: 100,
              //fit: BoxFit.contain,
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_timerman/src/feature/results/model/user_result.dart';

class ResultListItem extends StatelessWidget {
  const ResultListItem({
    Key? key,
    required this.result,
  }) : super(key: key);

  final UserResult result;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      height: 25,
      child: Row(
        children: [
          SizedBox(
            width: 45,
            child: Text(
              result.place.toString(),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              result.userName,
            ),
          ),
          SizedBox(
            width: 40,
            child: Text(
              result.gender,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 50,
            child: Text(
              result.points,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 25,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class ResultListHeader extends StatelessWidget {
  const ResultListHeader({
    Key? key,
    required this.pointLabel,
  }) : super(key: key);

  final String pointLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.lightGreen,
      height: 15,
      child: Row(
        children: [
          const SizedBox(
            width: 45,
            child: Text(
              'Место',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ),
          const Expanded(
            child: Text(
              'ФИО',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ),
          const SizedBox(
            width: 40,
            child: Text(
              'Пол',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(
            width: 50,
            child: Text(
              pointLabel,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          const SizedBox(width: 25),
        ],
      ),
    );
  }
}

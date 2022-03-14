import 'package:flutter/material.dart';
import 'package:flutter_timerman/src/feature/results/model/result_entity.dart';
import 'package:flutter_timerman/src/feature/results/model/user_result.dart';
import 'package:flutter_timerman/src/feature/results/widget/result_preview_widget.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({Key? key}) : super(key: key);

  bool hasPreviouseEvents = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: ListView.separated(
        itemCount: results.length,
        itemBuilder: (context, index) =>
            ResultPreviewWidget(result: results[index]),
        separatorBuilder: _separatorBuilder,
      ),
    );
  }

  Widget _separatorBuilder(BuildContext context, int index) {
    if (results[index].date.isBefore(DateTime.now()) && index != 0) {
      if (!hasPreviouseEvents) {
        hasPreviouseEvents = true;
        return Column(
          children: const [
            Divider(color: Colors.black87),
            Text(
              'Прошлые события',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 5)
          ],
        );
      }
    }

    return const SizedBox(height: 5);
  }

  final results = <ResultEntity>[
    ResultEntity(
      date: DateTime(2022, 5, 15, 17, 30),
      dateLabel: '15 мая 2022',
      eventTitle: 'Казанский марафон 2022',
      usersResult: [
        const UserResult(
          userName: 'Спиридонов Александр О.',
          place: 1,
          gender: 'М',
          points: '1541.1',
        ),
        const UserResult(
          userName: 'Фазульзянова Залия И.',
          place: 2,
          gender: 'Ж',
          points: '1540.1',
        ),
        const UserResult(
          userName: 'Тюрин Кирилл С.',
          place: 3,
          gender: 'М',
          points: '1539.1',
        ),
      ],
      userResult: const UserResult(
        userName: 'Иванов Иван И.',
        place: 1001,
        gender: 'М',
        points: '1531.1',
      ),
    ),
    ResultEntity(
      date: DateTime(2022, 1, 1, 17, 30),
      dateLabel: '4 марта - 4 апреля 2022',
      eventTitle: 'Hourman 3.0',
    ),
    ResultEntity(
      date: DateTime(2022, 2, 6, 23, 59),
      dateLabel: '6 февраля 2022 ',
      eventTitle: 'Открытая тренировка по бегу',
    ),
    ResultEntity(
      date: DateTime(2021, 4, 4, 17, 30),
      dateLabel: '4 марта - 4 апреля 2021',
      eventTitle: 'Hourman 2.0',
    ),
    ResultEntity(
      date: DateTime(2021, 10, 10, 17, 30),
      dateLabel: '10 октября 2021',
      eventTitle: 'Казанский национальный полумарафон',
    ),
    ResultEntity(
      date: DateTime(2021, 6, 27, 17, 30),
      dateLabel: '26 июня 2021',
      eventTitle: 'Ak Bars Bank tour De Tataestan. Almetevsk',
    ),
  ];
}

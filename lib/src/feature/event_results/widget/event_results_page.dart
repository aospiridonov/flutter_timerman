import 'package:flutter/material.dart';
import 'package:flutter_timerman/src/feature/results/model/user_result.dart';
import 'package:flutter_timerman/src/feature/results/widget/result_list_item.dart';

class EventResultsPage extends StatelessWidget {
  const EventResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Подробнее',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          ListView.separated(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
              top: 82,
              bottom: 5,
            ),
            itemCount: results.length,
            itemBuilder: (context, index) => ResultListItem(
              result: results[index],
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 5,
            ),
          ),
          Container(
            color: Colors.red,
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Colors.blue,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Flexible(child: Text('Событие: ')),
                      Expanded(
                        flex: 5,
                        child: Text(
                          'Событие',
                        ),
                      ),
                    ],
                  ),
                ),
                Text('Категории buttons_tabbar'),
                Text('Поиск'),
                Spacer(),
                const ResultListHeader(pointLabel: 'Баллы'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final List<UserResult> results = const [
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
    const UserResult(
      userName: 'Иванов Иван И.',
      place: 1001,
      gender: 'М',
      points: '1531.1',
    ),
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
    const UserResult(
      userName: 'Иванов Иван И.',
      place: 1001,
      gender: 'М',
      points: '1531.1',
    ),
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
    const UserResult(
      userName: 'Иванов Иван И.',
      place: 1001,
      gender: 'М',
      points: '1531.1',
    ),
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
    const UserResult(
      userName: 'Иванов Иван И.',
      place: 1001,
      gender: 'М',
      points: '1531.1',
    ),
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
    const UserResult(
      userName: 'Иванов Иван И.',
      place: 1001,
      gender: 'М',
      points: '1531.1',
    ),
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
    const UserResult(
      userName: 'Иванов Иван И.',
      place: 1001,
      gender: 'М',
      points: '1531.1',
    ),
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
    const UserResult(
      userName: 'Иванов Иван И.',
      place: 1001,
      gender: 'М',
      points: '1531.1',
    ),
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
    const UserResult(
      userName: 'Иванов Иван И.',
      place: 1001,
      gender: 'М',
      points: '1531.1',
    ),
  ];
}

import 'package:flutter/material.dart';
import 'package:flutter_timerman/common/common_widgets/app_bar_title.dart';
import 'package:flutter_timerman/src/common/util/l10n/l10n.dart';
import 'package:flutter_timerman/src/feature/events/model/event_type.dart';
import 'package:flutter_timerman/src/feature/events/model/events_entity.dart';
import 'package:flutter_timerman/src/feature/events/widget/events_page.dart';
import 'package:flutter_timerman/src/feature/results/widget/results_page.dart';
import 'package:flutter_timerman/src/feature/user/widget/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _pages = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    final events = <EventsEntity>[
      EventsEntity(
        date: DateTime.now(),
        dateLabel: 'day month year',
        description: '2 line description',
        imageUrl: 'https://timerman.org/Files/Images/20/9B/9C7A9011.jpg',
        title: 'Event name',
        eventTypes: [
          EventType(
            color: Colors.blue.value,
            label: 'Type event',
          ),
        ],
      ),
      EventsEntity(
        date: DateTime.now(),
        dateLabel: '5 марта - 5 апреля 2022',
        description: 'Месяц тренировок 1 час ежедневно, бег, вело, плаванье',
        imageUrl: 'https://timerman.org/Files/Images/04/26/DSC01660.jpg',
        title: 'Hourman 3.0',
        eventTypes: [
          EventType(
            color: Colors.blue.value,
            label: 'Онлайн',
          ),
        ],
      ),
      EventsEntity(
        date: DateTime.now(),
        dateLabel: '6 февраля 2022',
        description: 'Тренировка по бегу',
        imageUrl: 'https://timerman.org/Files/Images/DA/50/IMG_0369.jpg',
        title: 'Открытая тренировка по бегу',
        eventTypes: [
          EventType(
            color: Colors.pink.value,
            label: 'Беговой клуб',
          ),
          EventType(
            color: const Color(0xFF2AD000).value,
            label: 'Участвую',
          ),
        ],
      ),
    ];

    _pages = [
      EventsPage(
        events: events,
      ),
      const ResultsPage(),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppBarTitle(),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.notifications_none,
              //color: Colors.grey,
            ),
            enableFeedback: false,
          ),
        ],
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.account_circle_rounded),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: const ProfilePage(),
      bottomNavigationBar: _buildBottomNavigationBar(context),
      body: _pages[_selectedIndex],
    );
  }

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBar _buildBottomNavigationBar(BuildContext context) {
    final l10n = context.l10n;
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _selectPage,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.event,
          ),
          label: l10n.events_title,
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.bar_chart,
          ),
          label: l10n.results_title,
        ),
      ],
      elevation: 0,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_timerman/common/common_widgets/app_bar_title.dart';
import 'package:flutter_timerman/src/feature/user/widget/profile_page.dart';
import 'package:flutter_timerman/src/common/util/l10n/l10n.dart';
import 'package:flutter_timerman/src/feature/events/widget/events_page.dart';
import 'package:flutter_timerman/src/feature/results/widget/results_page.dart';

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
    _pages = const [
      EventsPage(),
      ResultsPage(),
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
              icon: const Icon(Icons.menu),
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

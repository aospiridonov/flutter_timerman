import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timerman/src/core/util.dart';
import 'package:flutter_timerman/src/core/widgets/app_bar_title.dart';
import 'package:flutter_timerman/src/features/app/presentation/app_presentation.dart';
import 'package:flutter_timerman/src/features/events/presentation/pages/events_page.dart';
import 'package:flutter_timerman/src/features/results/widget/results_page.dart';
import 'package:flutter_timerman/src/features/user/presentation/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _pages = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    _pages = [
      const ProfilePage(),
      const EventsPage(),
      ResultsPage(),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    final imageUrl = user.photo!;
    final avatar = CircleAvatar(
      radius: 15,
      backgroundImage: NetworkImage(imageUrl),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppBarTitle(),
        actions: _buildActions(),
        leading: _buildLeading(avatar),
      ),
      drawer: _buildDrawer(),
      bottomNavigationBar: _buildBottomNavigationBar(context),
      body: _pages[_selectedIndex],
    );
  }

  Widget _buildLeading(Widget avatar) {
    return Builder(
      builder: (context) {
        return IconButton(
          icon: avatar,
          onPressed: () => Scaffold.of(context).openDrawer(),
        );
      },
    );
  }

  List<Widget> _buildActions() {
    return const [
      IconButton(
        onPressed: null,
        icon: Icon(
          Icons.notifications_none,
          //color: Colors.grey,
        ),
        enableFeedback: false,
      ),
    ];
  }

  Widget _buildDrawer() {
    return const ProfilePage();
  }

  void _selectPage(int index) {
    //Add BLOC
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
            Icons.home,
          ),
          label: l10n.events_title,
        ),
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

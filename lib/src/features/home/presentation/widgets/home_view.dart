import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timerman/src/core/util.dart';
import 'package:flutter_timerman/src/core/widgets/widgets.dart';
import 'package:flutter_timerman/src/features/app/app.dart';
import 'package:flutter_timerman/src/features/events/presentation/pages/events_page.dart';
import 'package:flutter_timerman/src/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter_timerman/src/features/results/widget/results_page.dart';
import 'package:flutter_timerman/src/features/user/domain/bloc/user_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomeView());

  @override
  State<HomeView> createState() => _HomeViewState();
}

//TODO: add bloc for pages for bottom navigation bar

class _HomeViewState extends State<HomeView> {
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
    final appState = context.select((AppBloc bloc) => bloc.state);
    final state = context.watch<UserBloc>().state;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppBarTitle(),
        actions: _buildActions(),
        leading: state.when(
          loading: () =>
              const CircularProgressIndicator.adaptive(strokeWidth: 2),
          loaded: (user) => user.imageUrl.isNotEmpty
              ? _buildLeading(user.imageUrl) //from firebase
              : _buildLeading(appState.user.photo!), //from account
          error: Container.new,
        ),
      ),
      drawer: const ProfilePage(),
      bottomNavigationBar: _buildBottomNavigationBar(context),
      body: _pages[_selectedIndex],
    );
  }

  Widget _buildLeading(String imageUrl) {
    return Builder(
      builder: (context) {
        return IconButton(
          icon: CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(imageUrl),
          ),
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

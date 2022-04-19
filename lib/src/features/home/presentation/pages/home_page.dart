import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timerman/src/features/app/domain/bloc/user_access_bloc.dart';
import 'package:flutter_timerman/src/features/app/presentation/app_presentation.dart';
import 'package:flutter_timerman/src/features/home/presentation/widgets/home_view.dart';
import 'package:flutter_timerman/src/features/user/data/repository/firestore_user_repository.dart';
import 'package:flutter_timerman/src/features/user/domain/bloc/user_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    final userId = user.id;
    //TODO: refactoring to MultiBlocProvider
    return BlocProvider(
      create: (_) => UserAccessBloc()..add(UserAccessEventGet(userId: userId)),
      child: BlocProvider(
        create: (_) => UserBloc(
          repository: FirestoreUserRepository(),
        )..add(UserEvent.get(userId: userId)),
        child: const HomeView(),
      ),
    );
  }
}

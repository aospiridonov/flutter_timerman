// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timerman/src/core/util.dart';
import 'package:flutter_timerman/src/features/profile/presentation/bloc/bloc.dart';
import 'package:flutter_timerman/src/features/profile/presentation/widgets/widgets.dart';
import 'package:flutter_timerman/src/features/user/domain/bloc/user_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<UserBloc>().state;
    //final userId = user.id;
    //final user = UserData.myUser;
    return state.when(
      loading: () => Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator.adaptive(strokeWidth: 2),
            const SizedBox(width: 10),
            Text(l10n.loading),
          ],
        ),
      ),
      loaded: (user) {
        return BlocProvider(
          //lazy: false,
          create: (BuildContext context) =>
              UserProfileBloc()..add(UserProfileEvent.init(user: user)),
          child:
              const ProfileView(), //TODO: add route to profile or registration
        );
      },
      error: () {
        return Center(
          child: Row(
            children: [
              Text(l10n.user_not_found),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {}, //switch to create account
                child: Text(l10n.logout),
              )
            ],
          ),
        );
      },
    );

    ;
  }
}

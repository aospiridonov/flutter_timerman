// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timerman/src/features/app/app.dart';
import 'package:flutter_timerman/src/features/user/data/repository/firestore_user_repository.dart';
import 'package:flutter_timerman/src/features/user/domain/bloc/user_bloc.dart';
import 'package:flutter_timerman/src/features/user/presentation/widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    final userId = user.id;
    //final user = UserData.myUser;
    return BlocProvider(
      create: (_) => UserBloc(
        repository: FirestoreUserRepository(),
      )..add(UserEventGetUser(userId: userId)),
      child: const ProfileView(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timerman/src/core/util.dart';
import 'package:flutter_timerman/src/core/widgets/widgets.dart';
import 'package:flutter_timerman/src/features/app/app.dart';
import 'package:flutter_timerman/src/features/user/domain/bloc/user_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  void _signOut(BuildContext context) {
    context.read<AppBloc>().add(AppLogoutRequested());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<UserBloc>().state;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppBarTitle(),
        actions: [
          IconButton(
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
            icon: const Icon(
              Icons.close,
            ),
            //color: Colors.black,
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: state.when(
        loading: () {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator.adaptive(strokeWidth: 2),
                const SizedBox(width: 10),
                Text(l10n.loading),
              ],
            ),
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
        loaded: (user) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              color: Colors.white70.withOpacity(0.9),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    child: InkWell(
                      onTap: () {},
                      child: AvatarWidget(
                        imagePath: user.imageUrl,
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomEditableText(
                          labelText: l10n.last_name,
                          text: user.lastName,
                        ),
                      ),
                      Expanded(
                        child: CustomEditableText(
                          labelText: l10n.first_name,
                          text: user.firstName,
                        ),
                      ),
                      Expanded(
                        child: CustomEditableText(
                          labelText: l10n.middle_name,
                          text: user.middleName,
                        ),
                      ),
                    ],
                  ),
                  CustomEditableText(
                    labelText: l10n.phone,
                    text: user.phone,
                  ),
                  CustomEditableText(
                    labelText: l10n.email,
                    text: user.email,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                        child: CustomEditableText(
                          labelText: 'Страна',
                          text: 'Россия',
                        ),
                      ),
                      Expanded(
                        child: CustomEditableText(
                          labelText: 'Регион',
                          text: 'Татарстан',
                        ),
                      ),
                      Expanded(
                        child: CustomEditableText(
                          labelText: 'Город',
                          text: 'Казань',
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: () => _signOut(context),
                      child: Text(l10n.logout),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

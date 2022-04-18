import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timerman/src/core/pages/pages.dart';
import 'package:flutter_timerman/src/core/util.dart';
import 'package:flutter_timerman/src/core/widgets/widgets.dart';
import 'package:flutter_timerman/src/features/app/app.dart';
import 'package:flutter_timerman/src/features/profile/presentation/bloc/bloc.dart';
import 'package:flutter_timerman/src/features/user/domain/bloc/user_bloc.dart';
import 'package:flutter_timerman/src/features/user/user.dart';
import 'package:page_transition/page_transition.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  void _signOut(BuildContext context) {
    context.read<AppBloc>().add(AppLogoutRequested());
  }

  void _save({required BuildContext context, required User user}) {
    context.read<UserBloc>().add(UserEvent.save(user: user));
  }

  void _changeUser({required BuildContext context, required User user}) {
    context.read<UserProfileBloc>().add(
          UserProfileEvent.update(user: user),
        );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<UserProfileBloc>().state;

    final sexMap = <String, String>{
      '': '',
      'm': l10n.sex_male,
      'f': l10n.sex_female,
    }; //TODO: refactoring switch to app constants
    //TODO: refactoring states to multiply bloc's
    if (state is UserProfileStateUndefined) {
      return const Center();
    } else {
      late User user;
      if (state is UserProfileStateModified) {
        user = state.user;
      }
      if (state is UserProfileStateOrigin) {
        user = state.user;
      }
      return BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserStateLoaded) {
            context
                .read<UserProfileBloc>()
                .add(UserProfileEvent.init(user: state.user));
          }
        },
        child: Scaffold(
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
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              color: Colors.white70.withOpacity(0.9),
              child: ListView(
                //TODO: refactoring to Columns
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    child: InkWell(
                      onTap: () => _onEditImagePage(
                        context: context,
                        user: user,
                      ),
                      child: AvatarWidget(
                        imagePath: user.imageUrl,
                        onPressed: () => _onEditImagePage(
                          context: context,
                          user: user,
                        ),
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
                          onChanged: (value) {
                            _changeUser(
                              context: context,
                              user: user.copyWith(lastName: value),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: CustomEditableText(
                          labelText: l10n.first_name,
                          text: user.firstName,
                          onChanged: (value) {
                            _changeUser(
                              context: context,
                              user: user.copyWith(firstName: value),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: CustomEditableText(
                          labelText: l10n.middle_name,
                          text: user.middleName,
                          onChanged: (value) {
                            _changeUser(
                              context: context,
                              user: user.copyWith(middleName: value),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomDatePicker(
                          labelText: l10n.birth_date,
                          selectedDate: DateTime.now(),
                        ),
                      ),
                      Expanded(
                        child: CustomDropdown(
                          hintText: l10n.please_select_value,
                          labelText: l10n.sex,
                          value: sexMap[user.sex],
                          items: sexMap.values.toList(),
                          onChanged: (value) {
                            final key = sexMap.keys
                                .firstWhere((k) => sexMap[k] == value);
                            _changeUser(
                              context: context,
                              user: user.copyWith(sex: key),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  CustomEditableText(
                    labelText: l10n.phone_number,
                    text: user.phone,
                    onChanged: (value) {
                      _changeUser(
                        context: context,
                        user: user.copyWith(phone: value),
                      );
                    },
                  ),
                  CustomEditableText(
                    labelText: l10n.email,
                    text: user.email,
                    onChanged: (value) {
                      _changeUser(
                        context: context,
                        user: user.copyWith(email: value),
                      );
                    },
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomEditableText(
                          labelText: l10n.country,
                          text: user.country,
                          onChanged: (value) {
                            _changeUser(
                              context: context,
                              user: user.copyWith(country: value),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: CustomEditableText(
                          labelText: l10n.region,
                          text: user.region,
                          onChanged: (value) {
                            _changeUser(
                              context: context,
                              user: user.copyWith(region: value),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: CustomEditableText(
                          labelText: l10n.city,
                          text: user.city,
                          onChanged: (value) {
                            _changeUser(
                              context: context,
                              user: user.copyWith(city: value),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  if (state is UserProfileStateModified)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: ElevatedButton(
                        onPressed: () {
                          _save(context: context, user: user);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue, // background
                        ),
                        child: Text(l10n.save),
                      ),
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
          ),
        ),
      );
    }
  }

  void _onEditImagePage({
    required BuildContext context,
    required User user,
  }) {
    Navigator.push<void>(
      context,
      PageTransition(
        type: PageTransitionType.topToBottom,
        child: EditImagePage(
          imageUrl: user.imageUrl,
          onChanged: (value) {
            _changeUser(
              context: context,
              user: user.copyWith(imageUrl: value),
            );
          },
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_timerman/common/common_widgets/app_bar_title.dart';
import 'package:flutter_timerman/src/common/constant/widget/custom_editable_text.dart';
import 'package:flutter_timerman/src/feature/user/model/user_data.dart';
import 'package:flutter_timerman/src/feature/user/widget/avatar_widget.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _signOut() async {
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final user = UserData.myUser;

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
      body: Padding(
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
                    imagePath: user.image,
                    onPressed: () {},
                  ),
                ),
              ),
              _buildFIO(),
              const CustomEditableText(
                labelText: 'Телефон',
                text: '+7 123 456 78 90',
              ),
              const CustomEditableText(
                labelText: 'Электронная почта',
                text: 'test@test.ru',
              ),
              _buildLocation(),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: _signOut,
                  child: const Text('Logout'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFIO() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Expanded(
          child: CustomEditableText(
            labelText: 'Фамилия',
            text: 'Спиридонов',
          ),
        ),
        Expanded(
          child: CustomEditableText(
            labelText: 'Имя',
            text: 'Александр',
          ),
        ),
        Expanded(
          child: CustomEditableText(
            labelText: 'Отчество',
            text: 'Олегович',
          ),
        ),
      ],
    );
  }

  Widget _buildLocation() {
    return Row(
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
    );
  }
}

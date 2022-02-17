import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_timerman/common/common_widgets/app_bar_title.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({Key? key}) : super(key: key);

  @override
  Future<void> _signOut() async {
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Container(
        color: Colors.white70.withOpacity(0.9),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text('avatar'),
            ),
            const ListTile(
              title: Text('FIO'),
            ),
            const ListTile(
              title: Text('FIO'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _signOut,
                child: const Text('Logout'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

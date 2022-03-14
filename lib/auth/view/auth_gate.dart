import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timerman/auth/view/header_logo.dart';
import 'package:flutter_timerman/home/home_page.dart';
import 'package:flutter_timerman/src/common/util/l10n/l10n.dart';
import 'package:flutterfire_ui/auth.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // User is not signed in
        if (!snapshot.hasData) {
          final l10n = context.l10n;
          return SignInScreen(
            providerConfigs: const [
              EmailProviderConfiguration(),
              GoogleProviderConfiguration(
                clientId:
                    '366728991878-vq3drk6hdbprf3k1sg5u3na7r3699doo.apps.googleusercontent.com',
              ),
              FacebookProviderConfiguration(
                clientId: '478207670615281',
              )
            ],
            headerBuilder: (context, constraints, _) {
              return const HeaderLogo();
            },
            headerMaxExtent: 220,
            subtitleBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: Text(
                  action == AuthAction.signIn
                      ? l10n.welcome_sign_in
                      : l10n.welcome_register,
                ),
              );
            },
            footerBuilder: (context, _) {
              return Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  l10n.sign_in_term,
                  style: const TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
              );
            },
          );
        }

        return const HomePage();
      },
    );
  }
}

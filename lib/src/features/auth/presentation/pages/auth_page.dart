import 'package:flutter/material.dart';
import 'package:flutter_timerman/src/core/util/l10n/l10n.dart';
import 'package:flutter_timerman/src/features/auth/presentation/widgets/header_logo.dart';
import 'package:flutterfire_ui/auth.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: AuthPage());

  static const String googleClientId =
      '366728991878-vq3drk6hdbprf3k1sg5u3na7r3699doo.apps.googleusercontent.com';

  static const String facebookClientId = '478207670615281';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SignInScreen(
      providerConfigs: const [
        EmailProviderConfiguration(),
        GoogleProviderConfiguration(clientId: googleClientId),
        FacebookProviderConfiguration(clientId: facebookClientId),
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
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        );
      },
    );
  }
}

// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_timerman/auth/view/auth_gate.dart';
import 'package:flutter_timerman/common/thema.dart';
import 'package:flutter_timerman/src/common/util/l10n/l10n.dart';
import 'package:flutter_timerman/src/common/util/localization/flutter_fire_ui_ru_localizations_delegate.dart';
import 'package:flutterfire_ui/i10n.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      //darkTheme: darkTheme,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        FlutterFireUIRuLocalizationsDelegate(),
        FlutterFireUILocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      //locale: Locale('ru', 'RU'),
      home: const AuthGate(),
    );
  }
}

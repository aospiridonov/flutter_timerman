// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_timerman/auth/localization/flutter_fire_ui_ru_localizations_delegate.dart';
import 'package:flutter_timerman/auth/localization/label_overrides.dart';
import 'package:flutter_timerman/auth/view/auth_gate.dart';
import 'package:flutter_timerman/counter/counter.dart';
import 'package:flutter_timerman/l10n/l10n.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:flutterfire_ui/i10n.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String defaultLocale = Platform.localeName;

    print(defaultLocale);
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFFC81426)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFFC81426),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          constraints: const BoxConstraints(maxHeight: 45),
          //contentPadding: EdgeInsets.zero,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.all(16),
            ),
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xFFC81426)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
        ),
      ),
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

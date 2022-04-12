import 'package:flutter/widgets.dart';
import 'package:flutter_timerman/src/features/app/app.dart';
import 'package:flutter_timerman/src/features/auth/auth.dart';
import 'package:flutter_timerman/src/features/home/home.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [AuthPage.page()];
    //TODO: add lending page or splash screen
  }
}

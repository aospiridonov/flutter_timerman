// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_timerman/src/core/app.dart';
import 'package:flutter_timerman/bootstrap.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_timerman/src/features/auth/auth.dart';
//import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await bootstrap(
    () => App(
      authRepository: AuthFirebaseRepository(),
    ),
  );
}

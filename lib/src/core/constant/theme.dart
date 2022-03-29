import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  visualDensity: const VisualDensity(vertical: 0.5, horizontal: 0.5),
  primaryColor: const Color(0xffEDD5B3),
  primaryColorLight: const Color(0x1aF5E0C3),
  primaryColorDark: const Color(0xff936F3E),
  canvasColor: Colors.black26.withOpacity(0.1), //nav bar color
  scaffoldBackgroundColor: const Color(0xffF9F9F9),
  bottomAppBarColor: const Color(0xff6D42CE),
  cardColor: const Color(0xaaF5E0C3),
  dividerColor: const Color(0x1f6D42CE),
  focusColor: const Color(0x1aF5E0C3),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: const MaterialColor(
      0xFFC81426,
      <int, Color>{
        50: Color(0x1aF5E0C3),
        100: Color(0xa1F5E0C3),
        200: Color(0xaaF5E0C3),
        300: Color(0xafF5E0C3),
        400: Color(0xffF5E0C3),
        500: Color(0xffEDD5B3),
        600: Color(0xffDEC29B),
        700: Color(0xffC9A87C),
        800: Color(0xffB28E5E),
        900: Color(0xff936F3E)
      },
    ),
  ).copyWith(
    secondary: const Color(0xff457BE0),
  ),
  appBarTheme: const AppBarTheme(
    color: Color(0xffF2F2F2),
    centerTitle: true,
    iconTheme: IconThemeData(
      color: Color(0xFFC81426),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    //constraints: const BoxConstraints(maxHeight: 45, minHeight: 40),
    //contentPadding: EdgeInsets.zero,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(
        const EdgeInsets.all(15),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(
        const Color(0xFFC81426),
      ),
      foregroundColor: MaterialStateProperty.all<Color>(
        Colors.white,
      ),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontSize: 18,
        ),
      ),
    ),
  ),
);

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    visualDensity: const VisualDensity(vertical: 0.5, horizontal: 0.5),
    primaryColor: const Color(0xff5D4524),
    primaryColorLight: const Color(0x1a311F06),
    primaryColorDark: const Color(0xff936F3E),
    canvasColor: const Color(0xffE09E45),
    scaffoldBackgroundColor: const Color(0xffB5BFD3),
    bottomAppBarColor: const Color(0xff6D42CE),
    cardColor: const Color(0xaa311F06),
    dividerColor: const Color(0x1f6D42CE),
    focusColor: const Color(0x1a311F06),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: const MaterialColor(
        0xFFF5E0C3,
        <int, Color>{
          50: Color(0x1a5D4524),
          100: Color(0xa15D4524),
          200: Color(0xaa5D4524),
          300: Color(0xaf5D4524),
          400: Color(0x1a483112),
          500: Color(0xa1483112),
          600: Color(0xaa483112),
          700: Color(0xff483112),
          800: Color(0xaf2F1E06),
          900: Color(0xff2F1E06)
        },
      ),
    ).copyWith(secondary: const Color(0xff457BE0)));

ThemeData templateTheme = ThemeData(
  primaryColor: const Color(0xFFC81426),
  appBarTheme: const AppBarTheme(color: Colors.black12),
  colorScheme: ColorScheme.fromSwatch(
    accentColor: const Color(0xFFC81426),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    //constraints: const BoxConstraints(maxHeight: 45, minHeight: 40),
    //contentPadding: EdgeInsets.zero,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(
        const EdgeInsets.all(15),
      ),
      backgroundColor:
          MaterialStateProperty.all<Color>(const Color(0xFFC81426)),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 18)),
    ),
  ),
  textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.purple)),
);

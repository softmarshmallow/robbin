import 'package:flutter/material.dart';

class ThemeColors {
  static const textPrimary = const Color(0xff1E1E1E);
}

class ThemeDense {
  static const d0 = 0.0;
  static const d4 = 4.0;
  static const d8 = 8.0;
  static const d16 = 16.0;
  static const d24 = 24.0;
  static const d32 = 32.0;
  static const d36 = 36.0;
  static const d40 = 40.0;
  static const d42 = 42.0;
  static const d48 = 48.0;
  static const d56 = 56.0;
  static const d72 = 72.0;
  static const d100 = 100.0;
}

ThemeData buildTheme(BuildContext context) {
  return ThemeData(
    primarySwatch: Colors.amber,
    scaffoldBackgroundColor: Colors.yellow,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 96,
          color: ThemeColors.textPrimary,
          fontWeight: FontWeight.w700),
      headline2: TextStyle(
          fontSize: 60,
          color: ThemeColors.textPrimary,
          fontWeight: FontWeight.w900),
      headline3: TextStyle(fontSize: 48, color: ThemeColors.textPrimary),
      headline4: TextStyle(fontSize: 34, color: ThemeColors.textPrimary),
      headline5: TextStyle(fontSize: 24, color: ThemeColors.textPrimary),
      headline6: TextStyle(fontSize: 20, color: ThemeColors.textPrimary),
      subtitle1: TextStyle(fontSize: 16, color: ThemeColors.textPrimary),
      subtitle2: TextStyle(fontSize: 14),
      bodyText1: TextStyle(fontSize: 16),
      bodyText2: TextStyle(fontSize: 14),
      button: TextStyle(fontSize: 14),
      caption: TextStyle(fontSize: 12),
      overline: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
    ),
  );
}

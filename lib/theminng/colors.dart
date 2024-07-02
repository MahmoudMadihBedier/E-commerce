import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  static const Color royalBlue = Color(0xFF0D47A1);
  static const Color blueGray = Color(0xFF607D8B);
  static const Color midnightBlue = Color(0xFF283593);
  static const Color navyBlue = Color(0xFF1A237E);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: royalBlue,
    hintColor: blueGray,
    scaffoldBackgroundColor: navyBlue,
    appBarTheme: AppBarTheme(
      color: royalBlue,
      iconTheme: IconThemeData(color: blueGray),
      // textTheme: TextTheme(
      //   headline6: TextStyle(color: blueGray, fontSize: 20),
      // ),
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: blueGray),
      bodyText2: TextStyle(color: midnightBlue),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: blueGray,
      textTheme: ButtonTextTheme.primary,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: blueGray,
    ),
  );
}
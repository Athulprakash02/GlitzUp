import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        actionsIconTheme: IconThemeData(color: Colors.black)),
    primarySwatch: Colors.red,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'SpaceGrotesk',
    textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black)));

final darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        actionsIconTheme: IconThemeData(color: Colors.white)),
    primarySwatch: Colors.red,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.black,
    fontFamily: 'SpaceGrotesk',
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      // bodySmall: TextStyle(color: Colors.white),
    ));

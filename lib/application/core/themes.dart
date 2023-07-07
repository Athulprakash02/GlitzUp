import 'package:flutter/material.dart';
import 'package:glitzup/application/core/colors.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
appBarTheme: const AppBarTheme(backgroundColor: kWhiteColor),
primarySwatch: Colors.red,
primaryColor: kBlackColor,

scaffoldBackgroundColor: kWhiteColor,
fontFamily: 'SpaceGrotesk',

textTheme: const TextTheme(
  bodyLarge: TextStyle(color: kBlackColor),
  bodyMedium: TextStyle(color: kBlackColor)
)

);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
appBarTheme: const AppBarTheme(backgroundColor: kBlackColor),
primarySwatch: Colors.red,
primaryColor: kWhiteColor,
scaffoldBackgroundColor: kBlackColor,
fontFamily: 'SpaceGrotesk',
textTheme: const TextTheme(
  bodyLarge: TextStyle(color: kWhiteColor),
  bodyMedium: TextStyle(color: kWhiteColor),
  bodySmall: TextStyle(color: kWhiteColor),
  
  
  
)


);
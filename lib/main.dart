import 'package:flutter/material.dart';
import 'package:glitzup/application/core/themes.dart';
import 'package:glitzup/presentatioon/screens/login_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MediaQuery.of(context).platformBrightness == Brightness.dark
          ? darkTheme
          : lightTheme,

          debugShowCheckedModeBanner: false,
          home: const LoginScreen(),
    );
  }
}

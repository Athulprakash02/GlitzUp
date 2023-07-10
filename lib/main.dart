import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:glitzup/core/themes.dart';
import 'package:glitzup/presentatioon/screens/auth/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          home:  LoginScreen(),
    );
  }
}

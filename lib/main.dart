import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glitzup/application/showtextfeild%20provider/show_textfeild_provider.dart';
import 'package:glitzup/core/themes.dart';
import 'package:glitzup/infrastructure/auth/firebase_auth_methods.dart';
import 'package:glitzup/presentatioon/screens/auth/authwrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        ChangeNotifierProvider(
          create: (_) => ShowTextFeildProvider(),
        ),
        StreamProvider(
            create: (context) => context.read<FirebaseAuthMethods>().authState,
            initialData: null)
      ],
      child: GetMaterialApp(
          theme: MediaQuery.of(context).platformBrightness == Brightness.dark
              ? darkTheme
              : lightTheme,
          debugShowCheckedModeBanner: false,
          home: const AuthWrapper()),
    );
  }
}

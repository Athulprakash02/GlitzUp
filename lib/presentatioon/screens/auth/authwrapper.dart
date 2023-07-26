import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glitzup/presentatioon/screens/auth/login_screen.dart';
import 'package:glitzup/presentatioon/screens/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if(firebaseUser != null){
      return const BottomNavBar();
    }else{
      return   const LoginScreen();
    }
  }
}
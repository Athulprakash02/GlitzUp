import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glitzup/views/screens/auth/login_screen.dart';
import 'package:glitzup/views/screens/bottom%20nav/bottom_nav_bar.dart';
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
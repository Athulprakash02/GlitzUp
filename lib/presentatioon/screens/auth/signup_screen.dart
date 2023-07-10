import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glitzup/infrastructure/auth/firebase_auth_methods.dart';
import 'package:glitzup/presentatioon/screens/auth/otp_verification_screen.dart';
import 'package:glitzup/presentatioon/screens/home_screen.dart';
import 'package:glitzup/presentatioon/widgets/login_textfeild.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // TextEditingController _userNameTextController = TextEditingController();

  // TextEditingController _fullNameTextController = TextEditingController();

  TextEditingController _emailTextController = TextEditingController();

  TextEditingController _passwordTextController = TextEditingController();

// @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _emailTextController.dispose();
//     _passwordTextController.dispose();
//   }

  void signupUser() async {
    FirebaseAuthMethods(FirebaseAuth.instance)
        .signUpWithEmail(
      email: _emailTextController.text,
      password: _passwordTextController.text,
      context: context,
    )
        .then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => OTPScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Sign up',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Create a new account',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),

                // Image.asset(
                //   'assets/images/signup.png',
                //   width: size.width * .4,
                // ),
                const SizedBox(
                  height: 15,
                ),
                // loginTextFeild('Username', false, _userNameTextController),
                // const SizedBox(
                //   height: 20,
                // ),
                // loginTextFeild('Full Name', false, _fullNameTextController),
                // const SizedBox(
                //   height: 20,
                // ),
                loginTextFeild('Email Address', false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                loginTextFeild('Password', true, _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      print(_emailTextController.text.trim());
                      signupUser();
                      // FirebaseAuth.instance
                      //     .createUserWithEmailAndPassword(
                      //         email: _emailTextController.text.trim(),
                      //         password: _passwordTextController.text.trim())
                      //     .then((value) {
                      //   Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //     builder: (context) => HomeScreen(),
                      //   )).onError((error, stackTrace) {
                      //     print(error.toString());
                      //   });
                      // });
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
          ),
        ),
      )),
    );
  }
}

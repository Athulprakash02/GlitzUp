import 'package:flutter/material.dart';
import 'package:glitzup/core/colors.dart';
import 'package:glitzup/presentatioon/screens/bottom_nav_bar.dart';
import 'package:glitzup/presentatioon/screens/auth/signup_screen.dart';
import 'package:glitzup/presentatioon/widgets/login_textfeild.dart';

class LoginScreen extends StatelessWidget {

   LoginScreen({super.key});

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

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
                Image.asset(
                  'assets/images/login.png',
                  width: size.width * .4,
                ),
                const SizedBox(
                  height: 10,
                ),
                loginTextFeild("Email or username", false,_emailTextController),
                const SizedBox(
                  height: 20,
                ),
                loginTextFeild("Password", true,_passwordTextController),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot password?',style: TextStyle(color: kGreyColor),
                        ))
                  ],
                ),
                // const SizedBox(height: 15,),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => BottomNavBar(),
                          ),
                          (route) => false);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width * .38,
                      height: 1,
                      decoration: const BoxDecoration(color: kGreyColor),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Or',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      width: size.width * .38,
                      height: 1,
                      decoration: const BoxDecoration(color: kGreyColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/images/google.png'),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(
                        'assets/images/facebook.png',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ));
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(fontSize: 18),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
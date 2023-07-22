import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glitzup/core/colors.dart';
import 'package:glitzup/core/constants.dart';
import 'package:glitzup/infrastructure/auth/firebase_auth_methods.dart';
import 'package:glitzup/presentatioon/screens/auth/signup_screen.dart';
import 'package:glitzup/presentatioon/screens/bottom_nav_bar.dart';
import 'package:glitzup/presentatioon/widgets/login_textfeild.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTextController = TextEditingController();

  final TextEditingController _passwordTextController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
  }

  void loginUser() async {
    await FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
        email: _emailTextController.text,
        password: _passwordTextController.text,
        context: context);
  }

 
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return;
    }
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
   try {
     await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const BottomNavBar(),
          ),
          (route) => false);
    });
   // ignore: empty_catches
   } catch (e) {
     
   }

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
            child: Form(
              key: _formkey,
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
                  loginTextFeild("Email", false, _emailTextController,
                      validateEmail,context,const Icon(Icons.clear,size: 16,),),
                  const SizedBox(
                    height: 20,
                  ),
                  loginTextFeild("Password", true, _passwordTextController,
                      validatePassword,context,const Icon(Icons.clear,size: 16,),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(color: kGreyColor),
                          ))
                    ],
                  ),
                  // const SizedBox(height: 15,),
                  ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          
                          loginUser();
                        }
                        // Navigator.of(context).pushAndRemoveUntil(
                        //     MaterialPageRoute(
                        //       builder: (context) => BottomNavBar(),
                        //     ),
                        //     (route) => false);
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 5),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          googleLogin();
                        },
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              AssetImage('assets/images/google.png'),
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(
                            'assets/images/facebook.png',
                          ),
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
                              builder: (context) => const SignupScreen(),
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
        ),
      )),
    );
  }
}

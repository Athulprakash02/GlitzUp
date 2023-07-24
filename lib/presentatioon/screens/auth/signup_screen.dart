import 'package:flutter/material.dart';
import 'package:glitzup/application/showtextfeild%20provider/show_textfeild_provider.dart';
import 'package:glitzup/core/colors.dart';
import 'package:glitzup/infrastructure/auth/firebase_auth_methods.dart';
import 'package:glitzup/presentatioon/widgets/login_textfeild.dart';
import 'package:provider/provider.dart';

bool hiddentextFeild = false;

class SignupScreen extends StatelessWidget {
   SignupScreen({super.key});

  // TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  final TextEditingController _passwordTextController = TextEditingController();

  final TextEditingController _otpTextController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

// @override
  @override
  Widget build(BuildContext context) {
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
                  const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Create a new account',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  loginTextFeild(
                    'Email Address',
                    false,
                    _emailTextController,
                    validateEmail,
                    context,
                    const Text('Send OTP'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  loginTextFeild(
                      'otp',
                      false,
                      _otpTextController,
                      validateOTP,
                      context,
                      const Text('Verify OTP'),
                      _emailTextController.text),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     boxShadow: [
                  //       BoxShadow(
                  //           color: Colors.grey.withOpacity(0.2), // Shadow color
                  //           spreadRadius: 2, // Spread radius
                  //           blurRadius: 5, // Blur radius
                  //           offset: const Offset(0, 3),
                  //           blurStyle: BlurStyle.inner),
                  //     ],
                  //   ),
                  //   child: TextFormField(
                  //     controller: _otpTextController,
                  //     decoration: InputDecoration(
                  //         fillColor: Theme.of(context).primaryColor,
                  //         filled: true,
                  //         suffix: InkWell(
                  //             onTap: () {
                  //               hiddentextFeild = verifyOTP(
                  //                   _emailTextController.text.trim(),
                  //                   _otpTextController.text,
                  //                   context);
                  //               if (hiddentextFeild) {
                  //                 setState(() {
                  //                   hiddentextFeild = true;
                  //                 });
                  //               }
                  //             },
                  //             child: Text('Verify OTP')),
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10),
                  //         ),
                  //         focusedBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(10),
                  //             borderSide: const BorderSide(color: kRedColor)),
                  //         labelText: 'Otp'),
                  //     obscureText: false,
                  //     validator: validateOTP,
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer<ShowTextFeildProvider>(
                    builder: (context, showTextFeildProvider, _) {
                      return Visibility(
                        visible: showTextFeildProvider.isVisible,
                        child: loginTextFeild(
                          'Password',
                          true,
                          _passwordTextController,
                          validatePassword,
                          context,
                          const Icon(
                            Icons.clear,
                            size: 16,
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          // signupUser();
                          context.read<FirebaseAuthMethods>().signUpWithEmail(
                              email: _emailTextController.text.trim(),
                              password: _passwordTextController.text.trim(),
                              context: context);
                              context.read<ShowTextFeildProvider>().toggleVisbility(false);
                        }
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}

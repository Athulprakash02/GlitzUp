import 'package:flutter/material.dart';
import 'package:glitzup/infrastructure/auth/firebase_auth_methods.dart';
import 'package:glitzup/presentatioon/widgets/login_textfeild.dart';
import 'package:provider/provider.dart';

bool hiddentextFeild = false;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
                  const SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    visible: hiddentextFeild,
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

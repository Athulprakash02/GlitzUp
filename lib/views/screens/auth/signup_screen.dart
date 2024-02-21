import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:glitzup/controller/showtextfeild%20provider/show_textfeild_provider.dart';
import 'package:glitzup/controller/text%20feild%20validator%20provider/textfeild_validator_rovider.dart';
import 'package:glitzup/services/auth/firebase_auth_methods.dart';
import 'package:glitzup/views/widgets/login_textfeild.dart';
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
            child: FormBuilder(
              autovalidateMode: AutovalidateMode.always,
              key: _formkey,
              child: Consumer<TextfieldValidatorProvider>(
                builder: (context, provider, child) {
                  return Column(
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
                      
                      context,
                      const Text('Send OTP'),
                      validator: provider.validateEmail
                      
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    loginTextFeild(
                        'otp',
                        false,
                        _otpTextController,
                         
                        context,
                        const Text('Verify OTP'),
                        email: _emailTextController.text,
                        validator: provider.validateOTP),
                        
                    
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
                            //  context.read<TextfieldValidatorProvider>().validatePassword(_passwordTextController.text) as String? Function(String? value),
                            context,
                            const Icon(
                              Icons.clear,
                              size: 16,
                            ),
                            validator: provider.validatePassword
                          ),
                        );
                      },
                    ),
              
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (FormBuilder.of(context)!.validate()) {
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
                );
                },
                
              ),
            ),
          ),
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:glitzup/application/text%20feild%20validator%20provider/textfeild_validator_rovider.dart';
import 'package:glitzup/infrastructure/auth/forgot_password.dart';
import 'package:glitzup/presentatioon/widgets/login_textfeild.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ResetPasswordScreen extends StatefulWidget {
 const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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
                    'assets/images/otp.png',
                    width: size.width * 0.55,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: size.width * .7,
                      child: const FittedBox(
                          child: Text(
                        'Enter your email to reset password',
                      ))),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer<TextfieldValidatorProvider>(
                    builder: (context, provider, child) {
                      return loginTextFeild(
                        'Email',
                        false,
                        _emailController,
                        validator: provider.validateEmail,
                        context,
                        const Icon(
                          Icons.clear,
                          size: 16,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () async{
                        if (_formkey.currentState!.validate()) {
                          passwordReset(_emailController.text.trim(), context);
                        }
                      },
                      child: const Text(
                        'Reset Password',
                        style: TextStyle(fontSize: 18),
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

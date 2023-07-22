import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glitzup/infrastructure/auth/firebase_auth_methods.dart';
import 'package:glitzup/presentatioon/widgets/login_textfeild.dart';



    bool hiddentextFeild = false;


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}



class _SignupScreenState extends State<SignupScreen> {
  // TextEditingController _userNameTextController = TextEditingController();

  // TextEditingController _fullNameTextController = TextEditingController();

  final TextEditingController _emailTextController = TextEditingController();

  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _otpTextController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

@override
  void dispose() {
    super.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _otpTextController.dispose();
  }

  void signupUser() async {
     
   await FirebaseAuthMethods(FirebaseAuth.instance)
        .signUpWithEmail(
      email: _emailTextController.text,
      password: _passwordTextController.text,
      context: context,
    );
  }

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
                  loginTextFeild('Email Address', false, _emailTextController,validateEmail,context,const Text('Send OTP'),),
                  const SizedBox(
                    height: 20,
                  ),
                   loginTextFeild('otp', false, _otpTextController,validateOTP,context,const Text('Verify OTP'),_emailTextController.text),
                  const SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    visible: hiddentextFeild  ,
                    child: loginTextFeild('Password', true, _passwordTextController,validatePassword,context,const Icon(Icons.clear,size: 16,),)),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if(_formkey.currentState!.validate() && hiddentextFeild == true){
                          signupUser();
                        }
                      //  if(_emailTextController.text.isEmpty){
                      //   showSnackbar(context, 'Please enter email');
                      //  }else if(_passwordTextController.text.isEmpty){
                      //   showSnackbar(context, 'Please enter your password');
                      //  }else{
                      //   // signupUser();
                        
                      //  }
                        
                        
                        // signupUser();
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
        ),
      )),
    );
  }
}

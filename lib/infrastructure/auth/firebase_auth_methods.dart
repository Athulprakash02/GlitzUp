import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:glitzup/presentatioon/screens/add%20profile/add_details_screen.dart';
import 'package:glitzup/presentatioon/screens/bottom_nav_bar.dart';
import 'package:glitzup/presentatioon/widgets/snackbar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;

  FirebaseAuthMethods(this._auth);

  //Email Sign Up
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              color: Colors.transparent,
              child: SpinKitRing(
                // duration: Duration(milliseconds: 500),
                color: Theme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        },
      );

      // await emailVerification(email, context);

      // Wait for the user to verify their email before proceeding
      // await _auth
      //     .authStateChanges()
      //     .firstWhere((user) => user?.emailVerified == true);

      // The user's email is now verified, proceed with creating the user
      await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        Navigator.of(context, rootNavigator: true)
            .pop(); // Close the loading dialog

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const AddDetails(),
          ),
          (route) => false,
        );
      });
    } on FirebaseAuthException catch (e) {
      Navigator.of(context, rootNavigator: true).pop();
      showSnackbar(context, e.message!);
    }
  }

  // Future<void> emailVerification(String email, BuildContext context) async {
  //   try {
  //     await _auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: 'TempPassword',
  //     );

  //     final user = _auth.currentUser;
  //     if (user != null) {
  //       await user.sendEmailVerification();
  //       showSnackbar(context, 'Email verification sent!');
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     showSnackbar(context, e.message!);
  //   }
  // }

  //Email login

  Future<void> loginWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              color: Colors.transparent,
              child: SpinKitRing(
                //  duration:  Duration(seconds: 1),
                color: Theme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        },
      );

      // await Future.delayed(Duration(milliseconds: 500));
      //   await _auth
      //       .signInWithEmailAndPassword(
      //     email: email,
      //     password: password,
      //   )
      //       .then((value) {
      //     Navigator.of(context).pushAndRemoveUntil(
      //         MaterialPageRoute(
      //           builder: (context) => BottomNavBar(),
      //         ),
      //         (route) => false);
      //   });
      //   // if(_auth.currentUser!.emailVerified){
      //   //   showSnackbar(context, 'Email not verified');
      //   // }
      // } on FirebaseAuthException catch (e) {
      //   Navigator.of(context, rootNavigator: true).pop();
      //   showSnackbar(context, e.message!);
      // }

      // UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      //   email: email,
      //   password: password,
      // );

      // Check if the user's email is verified
      // if (!userCredential.user!.emailVerified) {
      //   // If the email is not verified, send the verification email
      //   await emailVerification(email, context);
      //   Navigator.of(context, rootNavigator: true)
      //       .pop(); // Close the loading dialog
      //   return;
      // }

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const BottomNavBar(),
        ),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      Navigator.of(context, rootNavigator: true).pop();
      showSnackbar(context, e.message!);
    }
    // finally{
    //   Navigator.of(context,rootNavigator: true).pop();
    // }
  }
}

String? validatePassword(String? value) {
  if (value!.isEmpty) {
    return 'Please enter your password';
  } else if (value.length < 6 && value.isNotEmpty) {
    return 'Minimum 6 characters requiered';
  } else {
    return null;
  }
}

String? validateEmail(String? value) {
  if (value!.isEmpty) {
    return 'Please enter your Email';
  } else if (value.isEmpty ||
      !RegExp(r'^[\w-]+(?:\.[\w-]+)*@(?:[\w-]+\.)+[a-zA-Z]{2,7}$')
          .hasMatch(value)) {
    return 'Enter valid Email';
  } else {
    return null;
  }
}

String? validateOTP(String? value) {
  if (value!.isEmpty) {
    return 'please enter OTP';
  } else {
    return null;
  }
}

final emailAuth = EmailOTP();

void sendOTP(String email, BuildContext context) async {
  emailAuth.setConfig(
      appEmail: "me@rohitchouhan.com",
      appName: "GlitsUp",
      userEmail: email,
      otpLength: 6,
      otpType: OTPType.digitsOnly);
  // var res = await emailAuth.sendOtp(recipientMail: email);
  if (await emailAuth.sendOTP() == true) {
    // ignore: use_build_context_synchronously
    showSnackbar(context, 'OTP send succesfully');
  } else {
    // ignore: use_build_context_synchronously
    showSnackbar(context, 'Please try again');
  }
}

bool verifyOTP(String email, String userOtp, BuildContext context) {
// var res = emailAuth.validateOtp(recipientMail: email, userOtp: userOtp);

  if (emailAuth.verifyOTP(otp: userOtp) == true) {
    showSnackbar(context, 'Otp verified');
    return true;
  } else {
    showSnackbar(context, 'Invalid OTP');
    return false;
  }
}

void clearText(TextEditingController textController) {
  textController.clear();
}

import 'package:flutter/material.dart';
import 'package:glitzup/core/colors.dart';
import 'package:glitzup/infrastructure/auth/firebase_auth_methods.dart';
import 'package:glitzup/presentatioon/screens/auth/signup_screen.dart';
  


Widget loginTextFeild(String hintText, bool obscureText,
    TextEditingController textController, String? Function(String? value) validator,BuildContext context,Widget suffix,[String? email]) {
  
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [ 
      BoxShadow(
        color: Colors.grey.withOpacity(0.2), // Shadow color
        spreadRadius: 2, // Spread radius
        blurRadius: 5, // Blur radius
        offset: const Offset(0, 3), 
        blurStyle: BlurStyle.inner
      ),
    ],
      ),
    child: TextFormField(
      controller: textController,
      
      decoration: InputDecoration(
        fillColor: Theme.of(context).primaryColor,
        filled: true,
        suffix:InkWell(
         
          onTap: () {
            if(hintText == 'Email' || hintText == 'Password' ){
              clearText(textController);
            }else if(hintText == 'otp'){
              
            hiddentextFeild = verifyOTP(email!, textController.text, context);
            

            }else if(hintText == 'Email Address'){
              sendOTP(textController.text, context);
            }
            
          },
          child: suffix),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: kRedColor)),
          
          labelText: hintText
          ),
      obscureText: obscureText,
      validator: validator,
    ),
  );
}



import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:glitzup/application/showtextfeild%20provider/show_textfeild_provider.dart';
import 'package:glitzup/application/text%20feild%20validator%20provider/textfeild_validator_rovider.dart';
import 'package:glitzup/core/colors.dart';
import 'package:glitzup/infrastructure/auth/firebase_auth_methods.dart';
import 'package:glitzup/presentatioon/screens/auth/signup_screen.dart';
import 'package:provider/provider.dart';
  


Widget loginTextFeild(String hintText, bool obscureText,
    TextEditingController textController,BuildContext context,Widget suffix,{required String? Function(String?) validator,String? email, }) {
  
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
    
      ),
    child: FormBuilderTextField(
      
      name: hintText,
      controller: textController,
      onChanged: (value) {
        if(hintText == 'otp' && textController.text.isNotEmpty){
           context.read<TextfieldValidatorProvider>().updateOTP(value!);
          if(textController.text.isEmpty){
            Provider.of<ShowTextFeildProvider>(context,listen: false).toggleVisbility(false);
          }
        }else if(hintText == 'email' &&textController.text.isNotEmpty){
          context.read<TextfieldValidatorProvider>().updateEmail(value!);
        }else if(hintText == 'password' && textController.text.isNotEmpty){
          context.read<TextfieldValidatorProvider>().updatePassword(value!);
        }
      },
      decoration: InputDecoration(
        fillColor: Theme.of(context).primaryColor,
        filled: true,
        suffix:InkWell(
         
          onTap: () {
            if(hintText == 'Email' || hintText == 'Password' ){
              clearText(textController);
            }else if(hintText == 'otp'){
              
            hiddentextFeild = verifyOTP(email!, textController.text, context);
            if(hiddentextFeild){

              Provider.of<ShowTextFeildProvider>(context,listen: false).toggleVisbility(true);
            }
            

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
      validator:validator
    ),
  );
}



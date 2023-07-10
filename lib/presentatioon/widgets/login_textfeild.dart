import 'package:flutter/material.dart';
import 'package:glitzup/core/colors.dart';

Widget loginTextFeild(String hintText, bool obscureText,TextEditingController textController) {
  return TextFormField(
    controller: textController,
    decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: kRedColor
                    )),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        //   borderSide: const BorderSide(color:kBlackColor),
        // ),
        labelText: hintText
        // hintText: hintText,
        ),
    obscureText: obscureText,
  );
}

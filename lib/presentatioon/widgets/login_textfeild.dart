import 'package:flutter/material.dart';
import 'package:glitzup/application/core/colors.dart';

Widget loginTextFeild(String hintText, bool obscureText) {
  return TextFormField(
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

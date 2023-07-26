import 'package:flutter/material.dart';
import 'package:glitzup/core/colors.dart';

void showSnackbar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    
    SnackBar(
      // shape: BorderRadius.circular(10),
      backgroundColor: kRedColor,
      behavior: SnackBarBehavior.floating,
      content: Text(text,style: TextStyle(fontSize: 15),)),
  );
}

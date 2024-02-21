import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glitzup/controller/user%20controller/user_controller.dart';
import 'package:glitzup/model/user%20model/user_model.dart';
import 'package:glitzup/views/screens/bottom%20nav/bottom_nav_bar.dart';

final userRepo = Get.put(UserController());
Future<void> saveUserData(UserModel user, BuildContext context) async {
  await userRepo.createUser(user);

  Get.offAll(() =>  const BottomNavBar());
}

String? validateFullName(String? value) {
  if (value!.isEmpty) {
    return 'Please enter your name';
  } else {
    return null;
  }
}

String? validateUsername(String? value) {
  if (value!.isEmpty) {
    return 'Username cannot be empty';
  } else if (value.length < 4) {
    return 'Username must be at least 4 characters long';
  } else if (value.contains(' ')) {
    return 'Username cannot contain spaces';
  }
  return null; // Return null if the validation passes
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glitzup/application/user%20controller/user_controller.dart';
import 'package:glitzup/domain/user%20model/user_model.dart';
import 'package:glitzup/presentatioon/screens/home_screen.dart';

final userRepo = Get.put(UserController());
Future<void> saveUserData(UserModel user,BuildContext context) async {
  print('athyathe keri');
  await userRepo.createUser(user);
  print('ithum kainj');
  Get.offAll(()=>HomeScreen());
 
}

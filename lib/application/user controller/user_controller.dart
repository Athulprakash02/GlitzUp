import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:glitzup/domain/user%20model/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    print('second ivde vannu');
    await _db
        .collection("Users")
        .add(user.toJson());
        print('kainj');
  }
}

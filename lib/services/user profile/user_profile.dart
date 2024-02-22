import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:glitzup/model/user%20model/user_model.dart';
import 'package:glitzup/views/screens/bottom%20nav/bottom_nav_bar.dart';

Future<DocumentSnapshot<Map<String, dynamic>>?> getUserDataByEmail(
    String email) async {
  final userColection = FirebaseFirestore.instance.collection('Users');
  final querySnapShot =
      await userColection.where('email', isEqualTo: email).limit(1).get();
  if (querySnapShot.docs.isNotEmpty) {
    // userData =querySnapShot.docs.first;
    return querySnapShot.docs.first;
  } else {
    return null;
  }
}

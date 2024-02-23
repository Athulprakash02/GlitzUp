import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:glitzup/model/user%20model/user_model.dart';

class SearchService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> fetchSearchDetails(
      String searchQuery, List<UserModel> users) async {
    try {
      final querySnapshot = await _firebaseFirestore
          .collection('Users')
          .where(
            'username',
            isGreaterThanOrEqualTo: searchQuery,
          )
          .get();
      users.clear();
      // print(querySnapshot.docs.length);
      for (var data in querySnapshot.docs) {
        Map<String, dynamic> user = data.data();
        users.add(UserModel.fromJson(user));
      }
      
      // print(users.first.email);
      // return users;
    } catch (e) {
      // print(e.toString());
      // return users;
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:glitzup/model/post%20model/post_model.dart';
import 'package:glitzup/views/screens/bottom%20nav/bottom_nav_bar.dart';

void addPostToFirestore(String username,String caption, String imageUrl) async {

    PostModel newPost = PostModel(
        username: username,
        caption: caption,
        imagePath: imageUrl,
        timestamp: DateTime.now(),
        likes: [],
        comments: []);

    FirebaseFirestore.instance
        .collection('posts')
        .add(newPost.toJson())
        .then((value) {
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(
      //       builder: (context) => BottomNavBar(),
          // ),
          // (route) => false);
          Get.offAll(const BottomNavBar());
    }).onError((error, stackTrace) {
    });
  }

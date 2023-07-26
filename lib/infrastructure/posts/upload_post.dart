import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:glitzup/domain/post%20model/post_model.dart';
import 'package:glitzup/presentatioon/screens/bottom_nav_bar.dart';

void addPostToFirestore(String username,String caption, String imageUrl) async {
    print("image $imageUrl");

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
      print('post added');
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(
      //       builder: (context) => BottomNavBar(),
          // ),
          // (route) => false);
          Get.offAll(BottomNavBar());
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }

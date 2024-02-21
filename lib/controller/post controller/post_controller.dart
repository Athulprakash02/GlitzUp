import 'package:get/get.dart';
import 'package:glitzup/services/posts/posts.dart';

class PostController extends GetxController {
  final FireBasePostService _fireBasePostService = FireBasePostService();

  void likeButtonClicked(String postId, String currentUserEmailId) {
    _fireBasePostService.postLiked(postId, currentUserEmailId);
print('controlleril keroi');

  }
}

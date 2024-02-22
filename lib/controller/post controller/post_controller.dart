import 'package:get/get.dart';
import 'package:glitzup/model/comment%20model/comment_model.dart';
import 'package:glitzup/model/post%20model/post_model.dart';
import 'package:glitzup/services/posts/posts.dart';

class PostController extends GetxController {
  final FireBasePostService _fireBasePostService = FireBasePostService();
  var isFavourite = false.obs;
  var likesCount = 0.obs;

  void fetchIsLiked(PostModel post, String emailId) {
    isFavourite.value = post.likes.contains(emailId);
    likesCount.value = post.likes.length;
  }

  // void updateLikesCount(int newLikesCount) {
  //   print('ivdem keri');
  //   likesCount.value = newLikesCount;
  // }

  void likeButtonClicked(
      String postId, String currentUserEmailId, PostModel post) async {
    // isFavourite.value = post.likes.contains(currentUserEmailId);
    if (isFavourite.value) {
      isFavourite.value = !isFavourite.value;
      likesCount.value =
          await _fireBasePostService.postUnliked(postId, currentUserEmailId);
      // updateLikesCount(likesCount.value);
    } else {
      isFavourite.value = !isFavourite.value;
      likesCount.value =
          await _fireBasePostService.postLiked(postId, currentUserEmailId);
      // updateLikesCount(likesCount.value);
    }
  }

  Future<List<CommentModel>> commentButtonClicked(String postId) async {
    List<CommentModel> comments =
        await _fireBasePostService.fetchComments(postId);
    return comments;
  }

  void postComment(CommentModel comment, String postId) async{
   await _fireBasePostService.addComment(comment, postId);
    commentButtonClicked(postId);
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glitzup/controller/post%20controller/post_controller.dart';
import 'package:glitzup/controller/user_provider/user_provider.dart';
import 'package:glitzup/core/colors.dart';
import 'package:glitzup/core/constants.dart';
import 'package:glitzup/model/comment%20model/comment_model.dart';
import 'package:glitzup/model/post%20model/post_model.dart';
import 'package:provider/provider.dart';

import '../../controller/functions/date_time_fornat.dart';

Widget postCard(Size size, PostModel post, BuildContext context) {
  final userProvider = Provider.of<UserProvider>(context);
  final TextEditingController commentController = TextEditingController();
  final PostController postController = PostController();
  postController.fetchIsLiked(post, FirebaseAuth.instance.currentUser!.email!);

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: size.width,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            // onTap: () => Get.to(()=> OtherUserProfile(profile: )),
            child: ListTile(
              leading: FutureBuilder<String>(
                future: userProvider.getProfilePictureUrl(post.username),
                builder: (context, snapshot) {
                  String? imageUrl = snapshot.data;
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircleAvatar(
                      backgroundImage: NetworkImage(profileImage),
                    );
                  } else if (snapshot.hasError) {
                    return const CircleAvatar(
                      backgroundColor: kGreyColor,
                    );
                  } else {
                    return CircleAvatar(
                      // radius: 20,
                      backgroundImage: NetworkImage(imageUrl!),
                    );
                  }
                },
              ),
              title: Text(post.username),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                  )),
            ),
          ),

          Container(
            height: 280,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(post.imagePath), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20)),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          Row(
            children: [
              Obx(
                () => IconButton(
                    onPressed: () {
                      postController.likeButtonClicked(post.postId!,
                          FirebaseAuth.instance.currentUser!.email!, post);
                    },
                    icon: postController.isFavourite.value
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 28,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                            size: 28,
                          )),
              ),
              IconButton(
                  onPressed: () {
                    postController.commentButtonClicked(post.postId!);
                    commentBottomSheet(size, context, commentController,
                        post.postId!, postController);
                  },
                  icon: const Icon(
                    Icons.comment_bank_outlined,
                    size: 28,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send,
                    size: 28,
                  )),
              //
              const Spacer(),
              // Icon(Icons.bookmark_border,size: 30,),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_border,
                    size: 28,
                  )),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Obx(
                () => Text(
                  '${postController.likesCount.value} likes',
                  style: const TextStyle(fontSize: 18),
                ),
              )),
          const SizedBox(
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              post.caption != null ? post.caption.toString() : "",
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              formatDateTime(post.timestamp),
              style: const TextStyle(fontSize: 16, color: kGreyColor),
            ),
          )
        ],
      ),
    ),
  );
}

Future<dynamic> commentBottomSheet(
    Size size,
    BuildContext context,
    TextEditingController commentController,
    String postId,
    PostController postController) {
  return showModalBottomSheet(
    constraints:
        BoxConstraints.expand(height: size.height * .6, width: size.width),
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    // clipBehavior: Clip.hardEdge,
    // barrierColor: Colors.red,
    // enableDrag: false,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.all(size.width / 16),
        child: Column(
          children: [
            const Text(
              'comments',
              style: TextStyle(fontSize: 18),
            ),
            const Divider(
              // height: 3,
              color: Colors.white,
            ),
            Expanded(
                child:Obx(() =>  ListView.builder(
                      itemCount: postController.comments.length,
                      itemBuilder: (context, index) => ListTile(
                            leading: const CircleAvatar(),
                            title: RichText(
                              text: TextSpan(children: [
                                TextSpan(text: postController.comments[index].username),
                                const TextSpan(text: '  '),
                                 TextSpan(
                                    text: formatDateTime(postController.comments[index].timestamp),
                                    style: const TextStyle(color: kGreyColor))
                              ]),
                            ),
                            subtitle: Text(postController.comments[index].text),
                          )))),
            SizedBox(
              height: size.width / 20,
            ),
            SizedBox(
              height: size.width * .12,
              child: TextField(
                controller: commentController,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          CommentModel comment = CommentModel(
                              postId: postId,
                              email: FirebaseAuth.instance.currentUser!.email!,
                              username: 'athul',
                              text: commentController.text,
                              timestamp: DateTime.now());
                          commentController.clear();
                          postController.postComment(comment, postId);
                        },
                        icon: const Icon(Icons.send)),
                    hintText: 'Add a comment...',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            )
          ],
        ),
      );
    },
  );
}

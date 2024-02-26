import 'package:flutter/material.dart';
import 'package:glitzup/core/colors.dart';

class UserTile extends StatelessWidget {
  final String text;
  final String profilePicUrl;
  final String? time;
  const UserTile({
    super.key,
    required this.text,
    this.time, required this.profilePicUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
          leading:  CircleAvatar(
            radius: 20,
            backgroundImage:  NetworkImage(profilePicUrl),
          ),
          title: RichText(
              text: TextSpan(children: [
            TextSpan(text: text),
            TextSpan(text: '  ${time?? ''}', style: const TextStyle(color: kGreyColor))
          ]))),
    );
  }
}

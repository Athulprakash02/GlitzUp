import 'package:flutter/material.dart';
import 'package:glitzup/core/colors.dart';

class UserTile extends StatelessWidget {
  final String text;
  final String? time;
  UserTile({
    super.key,
    required this.text,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
          leading: const CircleAvatar(
            radius: 20,
          ),
          title: RichText(
              text: TextSpan(children: [
            TextSpan(text: text),
            TextSpan(text: '  ' + (time?? ''), style: TextStyle(color: kGreyColor))
          ]))),
    );
  }
}

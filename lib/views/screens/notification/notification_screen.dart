import 'package:flutter/material.dart';
import 'package:glitzup/views/widgets/user_tile.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('notifications',style: TextStyle(fontSize: 25),),),
      body:  ListView.builder(
                  itemCount: 20 ,itemBuilder: (context, index) {
                return    UserTile(profilePicUrl: '',  text: 'atx.ul_ liked your post',time: '1h', );
                },) ,
    );
  }
}
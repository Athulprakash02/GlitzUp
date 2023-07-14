import 'package:flutter/material.dart';
import 'package:glitzup/presentatioon/widgets/user_tile.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('notifications',style: TextStyle(fontSize: 25),),),
      body:  ListView.builder(
                  itemCount: 20 ,itemBuilder: (context, index) {
                return   UserTile(text: 'atx.ul_ liked your post',time: '1h', );
                },) ,
    );
  }
}
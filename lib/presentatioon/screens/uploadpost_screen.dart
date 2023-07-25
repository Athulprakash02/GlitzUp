import 'package:flutter/material.dart';

class UploadPost extends StatelessWidget {
  const UploadPost({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(title: const Text('upload'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
            
            width: size.width*.7,
            
            height: size.width*.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 21, 21, 21)
            ),
            )
          ],
        ),
      ), 
    );
  }
}
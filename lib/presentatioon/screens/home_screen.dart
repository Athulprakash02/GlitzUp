import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        
        title: Padding(
          padding: const EdgeInsets.only(left: 13),
          child: Image.asset('assets/images/glitzUp logo.png',width: size.width*0.33,),
          
        ),
      )
    );
  }
}
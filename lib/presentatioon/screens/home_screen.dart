import 'package:flutter/material.dart';
import 'package:glitzup/application/user_provider/user_provider.dart';
import 'package:glitzup/infrastructure/users/user_details.dart';
import 'package:glitzup/presentatioon/screens/add%20profile/add_details_screen.dart';

import 'package:glitzup/presentatioon/widgets/post_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
   
  
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 13),
          child: Image.asset(
            'assets/images/glitzUp logo.png',
            width: size.width * 0.33,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddDetails(),));
            },
            icon: const Icon(Icons.messenger_outline_rounded),
          ),
        ],
      ),
      body: SafeArea(
          child: ListView.builder(
        // scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => postCard(size),
      )),
    );
  }
}

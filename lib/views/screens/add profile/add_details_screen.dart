import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glitzup/controller/user%20controller/user_controller.dart';
import 'package:glitzup/core/constants.dart';
import 'package:glitzup/model/user%20model/user_model.dart';
import 'package:glitzup/services/auth/firebase_auth_methods.dart';
import 'package:glitzup/services/users/add_image.dart';
import 'package:glitzup/services/users/user_details.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'widgets/details_text_feild.dart';

// ignore: must_be_immutable
class AddDetails extends StatefulWidget {
  const AddDetails({super.key});

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController userNameController = TextEditingController();

  TextEditingController bioController = TextEditingController();

  final UserController userController = Get.put(UserController());

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String? imagePath;
  String? imageUrl;

  // @override
  // void dispose() {
  //   super.dispose();
  //   fullNameController.dispose();
  //   userController.dispose();
  //   bioController.dispose();
  //   userController.dispose();
  // }

  
Future<void> imagePick() async {
    final imagePicked =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      setState(() {
        imagePath = imagePicked.path;
      });
      
    imageUrl =await addProfileImge(imagePicked);
    }
     
  }

  @override
  Widget build(BuildContext context) {
     final signeduser = context.read<FirebaseAuthMethods>().currentUser;
    
    Size size = MediaQuery.sizeOf(context);
    return Form(
      key: _formkey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add profile'),
          centerTitle: true,
          actions: [
            TextButton(
                onPressed: () {
                   if(_formkey.currentState!.validate()){
                    final user = UserModel(
                      email: signeduser!.email!,
                      profilePic: imageUrl!=null ? imageUrl!:profileImage,
                      coverImage: coverImage,
                    fullName: fullNameController.text.trim(),
                    userName: userNameController.text.trim(),
                    likedPosts: [],
                    bio:bioController.text.isNotEmpty? bioController.text.trim() : '');
                   
                    saveUserData(user,context);
                   }
                  
                      
                },
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 18),
                ))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(size.width / 16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Stack(
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundImage: imagePath == null ? const AssetImage('assets/images/download.png') as ImageProvider:FileImage(File(imagePath!)),
                      ),
                      Positioned(
                        
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              imagePick();
                            },
                            child: const Icon(
                              Icons.add_a_photo,
                              size: 30,
                            ),
                          ))

                
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  DetailsTextFeild(
                      nameController: fullNameController,
                      hintText: 'Full name',
                      obscureText: false,
                      maxLines: 1,validate: validateFullName),
                  const SizedBox(
                    height: 25,
                  ),
                  DetailsTextFeild(
                      nameController: userNameController,
                      hintText: 'username',
                      obscureText: false,
                      maxLines: 1,validate: validateUsername,),
                  const SizedBox(
                    height: 25,
                  ),
                  DetailsTextFeild(
                    nameController: bioController,
                    hintText: 'Bio',
                    obscureText: false,
                    maxLines: 6,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

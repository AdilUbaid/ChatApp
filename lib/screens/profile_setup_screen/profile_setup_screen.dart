import 'dart:developer';

import 'package:chitchat/screens/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../db/models/chat_user.dart';
import '../../widgets/user_avatar.dart';
import '../home_screen/home_screen.dart';
import '../number_register_screen/number_registration_screen.dart';

class ProfileSetupScreen extends StatelessWidget {
  ProfileSetupScreen({super.key});

  final nameController = TextEditingController();
  final aboutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Profile")),
      body: Center(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 550.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UserAvatar(
                      icon: Icons.camera_alt_outlined,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: greyShade,
                        ),
                        height: 70.h,
                        // color: Colors.orange.shade100,
                        width: 600.w,
                        child: TextField(
                          controller: nameController,
                          autofocus: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: ' Name (required) ',
                              hintStyle: TextStyle(color: Colors.grey[400])),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: greyShade,
                      ),
                      height: 70.h,
                      // color: Colors.orange.shade100,
                      width: 600.w,
                      child: TextField(
                        controller: aboutController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: ' about(optional) ',
                            hintStyle: TextStyle(color: Colors.grey[400])),
                        // keyboardType: TextInputType.,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: 30.h),
                  child: SizedBox(
                    height: 87.h,
                    width: 660.w,
                    child: TextButton(
                      onPressed: () {
                        log(nameController.text);
                        createUser(name: nameController.text, context: context);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      },
                      style: const ButtonStyle(

                          // backgroundColor: MaterialStatePropertyAll(orangeColor)),
                          ),
                      child: Text(
                        'save',
                        style: const TextStyle(color: whiteColor),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  // Stream<List<ChatUser>> readUsers() =>
  //     FirebaseFirestore.instance.collection('users').snapshots().map((snapshot)=>snapshot.docs.map((doc)=>ChatUser.fromJson(doc.data())).data).tolist;

  Future createUser({required String name, context}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    // if (imageUrl == "") {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(content: Text('please upload an image')));
    //   return;
    // }
    final user = ChatUser(
        id: docUser.id,
        image: imageUrl,
        userName: nameController.text,
        phoneNumber: gPhoneNumber!,
        aboutMe: aboutController.text);
    final json = user.toJson();
    await docUser.set(json);
  }
}
// class ChatUser {
// }


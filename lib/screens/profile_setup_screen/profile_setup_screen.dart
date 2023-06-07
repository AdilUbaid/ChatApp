import 'dart:developer';

import 'package:chitchat/screens/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../db/models/chat_user.dart';
import '../../widgets/user_avatar.dart';
import '../home_screen/home_screen.dart';
import '../number_register_screen/number_registration_screen.dart';
import '../number_register_screen/otp_screen.dart';

class ProfileSetupScreen extends StatelessWidget {
  UserCredential? credential;
  ProfileSetupScreen({super.key, this.credential});

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
                        createUser(
                            name: nameController.text,
                            context: context,
                            credential: credential!);

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

  Future createUser(
      {required String name,
      context,
      required UserCredential credential}) async {
    final docUser = FirebaseFirestore.instance;

    FirebaseAuth auth = FirebaseAuth.instance;

    // ConfirmationResult confirmationResult =
    //     await auth.signInWithPhoneNumber(gPhoneNumber!);
    // String verificationId = confirmationResult.verificationId;

    // AuthCredential credential = PhoneAuthProvider.credential(
    //     verificationId: verificationId, smsCode: gOTP!);

    //UserCredential userCredential = await auth.signInWithCredential(credential);

    // return userCredential;

    final user = ChatUser(
        id: credential.user!.uid,
        image: imageUrl,
        userName: nameController.text,
        phoneNumber: gPhoneNumber!,
        aboutMe: aboutController.text,
        lastMessageTime: DateTime.now());
    await docUser
        .collection('users')
        .doc(credential.user!.uid)
        .set(user.toJson());
    log(credential.user!.uid.toString());
  }
}
// class ChatUser {
// }


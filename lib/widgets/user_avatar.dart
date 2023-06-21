import 'dart:io';

// import 'package:audioplayers/audioplayers.dart';
import 'package:chitchat/db/models/chat_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../controller/provider.dart';
import '../screens/constants.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
// import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
String imageUrl = "";

class UserAvatar extends StatefulWidget {
  final IconData icon;
  UserAvatar({
    super.key,
    required this.icon,
  });

  @override
  State<UserAvatar> createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserProvider>(context).getUser;
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          backgroundImage: imagePic(currentUser),
          radius: 140.r,
        ),
        Container(
          decoration: BoxDecoration(
              color: orangeColor, borderRadius: BorderRadius.circular(50.r)),
          child: IconButton(
              onPressed: () async {
                ImagePicker imagePicker = ImagePicker();
                XFile? file =
                    await imagePicker.pickImage(source: ImageSource.gallery);
                if (file == null) return;
                String uniqFileName =
                    DateTime.now().millisecondsSinceEpoch.toString();

                Reference referenceRoot = FirebaseStorage.instance.ref();
                Reference referenceDirImages = referenceRoot.child('images');
                Reference referenceImageToUpload =
                    referenceDirImages.child(uniqFileName);
                try {
                  await referenceImageToUpload.putFile(File(file.path));
                  setState(() async {
                    imageUrl = await referenceImageToUpload.getDownloadURL();
                  });
                } catch (error) {}
              },
              icon: Icon(widget.icon, color: whiteColor)),
        )
      ],
    );
  }

  getImage() async {
    final ref = FirebaseFirestore.instance.collection("users");
    final snapOne =
        await ref.where('id', isEqualTo: 'YmNg4jJm9NpL5ndsXT4i').get();
    final List result = snapOne.docs.map((e) => e.data()).toList();
    setState(() {
      String networkImage = result[0][Image];
    });
    
  }

  imagePic(ChatUser currentUser) {
    // setState(() {
    if (imageUrl == "") {
      return NetworkImage(currentUser.image);
    } else {
      setState(() {});
      return NetworkImage(imageUrl);
    }
    // });

    // .then(
    //   (DocumentSnapshot doc) {
    //     final data = doc.data() as Map<String, dynamic>;
    //     // ...
    //   },
    //   onError: (e) => print("Error getting document: $e"),
    // );

    //   final ref = FirebaseFirestore.instance.collection('users');
    //   final snapshot = await ref.doc(user.uid);
    //   if (snapshot.exists) {
    //     print(snapshot.value);
    //   } else {
    //     print('No data available.');
  }
}

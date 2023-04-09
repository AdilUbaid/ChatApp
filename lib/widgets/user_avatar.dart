import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../screens/constants.dart';
 String imageUrl="";

class UserAvatar extends StatelessWidget {
  final IconData icon;
   UserAvatar({
    super.key,
    required this.icon,
  });
 
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          backgroundImage: const AssetImage("assets/images/avatar_main.png"),
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
                  imageUrl=await  referenceImageToUpload.getDownloadURL();
                } catch (error) {}
              },
              icon: Icon(icon, color: whiteColor)),
        )
      ],
    );
  }
}

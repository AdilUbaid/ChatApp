import 'dart:developer';
import 'dart:io';

import 'package:chitchat/screens/home_screen/widgets/story_avatar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants.dart';

class StoryHorizondal extends StatefulWidget {
  const StoryHorizondal({super.key});

  @override
  State<StoryHorizondal> createState() => _StoryHorizondalState();
}

String? imgUrl;

class _StoryHorizondalState extends State<StoryHorizondal> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: SizedBox(
        height: 182.h,
        // color: Colors.amber,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 8.w, right: 8.w, bottom: 8.h),
                      child: GestureDetector(
                        onTap: () => picImage(ImageSource.camera),
                        onLongPress: () => picImage(ImageSource.gallery),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: const Icon(
                            Icons.add,
                            // color: Colors.orangeColor,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => const StoryAvatar(),
                        itemCount: 8),
                  ],
                ),
              ),
            ),
            const Divider(
              color: seperationGrey,
              indent: 10,
              endIndent: 10,
            ),
          ],
        ),
      ),
    );
  }

  Future picImage(ImageSource mode) async {
    XFile? file = await ImagePicker().pickImage(source: mode);
    print(file?.path.toString());
    if (file == null) return null;
    String uniqName = DateTime.now().microsecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImage = referenceRoot.child('story');
    Reference referenceImageToUpload = referenceDirImage.child(uniqName);
    try {
      await referenceImageToUpload.putFile(File(file.path));
      imgUrl = await referenceImageToUpload.getDownloadURL();
    } catch (error) {}
  }
}

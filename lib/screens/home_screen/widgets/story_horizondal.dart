import 'dart:developer';
import 'dart:io';

import 'package:chitchat/controller/provider.dart';
import 'package:chitchat/controller/story/story_repository.dart';
import 'package:chitchat/screens/home_screen/widgets/story_avatar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../db/models/chat_user.dart';
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
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: SizedBox(
        height: 182.h,
        // color: Colors.amber,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        onTap: () =>
                            picImage(ImageSource.camera, userProvider.getUser),
                        onLongPress: () =>
                            picImage(ImageSource.gallery, userProvider.getUser),
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
                    FutureBuilder(
                        future: FirebaseStoryApi.getStories(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                // print(snapshot.data!.docs[index]['userName']);
                                // print('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
                                return StoryAvatar(
                                  storySnap: snapshot.data!.docs[index],
                                );
                              },
                              itemCount: snapshot.data!.docs.length);
                        }),
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

  Future picImage(ImageSource mode, ChatUser userProvider) async {
    XFile? file = await ImagePicker().pickImage(source: mode);
    // print(file?.path.toString());
    if (file == null) return null;
    String uniqName = DateTime.now().microsecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImage = referenceRoot.child('story');
    Reference referenceImageToUpload = referenceDirImage.child(uniqName);
    try {
      await referenceImageToUpload.putFile(File(file.path));
      imgUrl = await referenceImageToUpload.getDownloadURL();

      FirebaseStoryApi.uploadStory(
              userId: userProvider.id,
              userName: userProvider.userName,
              image: imgUrl!,
              uploadTime: DateTime.now(),
              isSeen: false,
              userAvatar: userProvider.image)
          .then((_) {
        log('Story uploaded successfully!');
      }).catchError((error) {
        log('Failed to upload story: $error');
      });
    } catch (error) {
      log(error.toString());
    }
  }
}

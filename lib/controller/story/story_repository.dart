import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../db/models/story.dart';

class FirebaseStoryApi {
  static Future<void> uploadStory({
    required String userId,
    required String userName,
    required String image,
    required DateTime uploadTime,
    required bool isSeen,
     required String userAvatar,

  }) async {
    final storiesCollection = FirebaseFirestore.instance.collection('stories');

    final newStory = Story(
      userId: userId,
      userName: userName,
      image: image,
      uploadTime: uploadTime,
      isSeen: isSeen, userAvatar: userAvatar,
    );

    await storiesCollection.add(newStory.toJson());
  }

  // static Stream<QuerySnapshot<Map<String, dynamic>>> getStories()  {
  //   final storiesCollection = FirebaseFirestore.instance
  //       .collection('stories')
  //       .orderBy(
  //         'uploadTime',
  //         descending: true,
  //       )
  //       .get();
  //   return  storiesCollection;
  // }
  static Future<QuerySnapshot<Map<String, dynamic>>> getStories() async {
    final storiesCollection = FirebaseFirestore.instance
        .collection('stories')
        .orderBy('uploadTime', descending: true)
        .get();
    return await storiesCollection;
  }
}

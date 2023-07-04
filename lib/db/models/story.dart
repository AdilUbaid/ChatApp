import 'package:chitchat/db/models/untill.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Story {
  final String image;
  final String userName;
  final String userId;
  final DateTime? uploadTime;
  final bool isSeen;
  final String userAvatar;

  const Story(
      {required this.userAvatar,
      required this.image,
      required this.userId,
      required this.userName,
      required this.uploadTime,
      required this.isSeen});

  // static Story fromSnap(DocumentSnapshot snap) {
  //   var snapshot = snap.data() as Map<String, dynamic>;

  //   // Convert Timestamp to DateTime
  //   DateTime? uploadTime;
  //   Timestamp? timestamp = snapshot['uploadTime'];
  //   if (timestamp != null) {
  //     uploadTime = timestamp.toDate();
  //   }

  //   return Story(
  //     image: snapshot["image"],
  //     userName: snapshot["userName"],
  //     isSeen: snapshot['isSeen'],
  //     uploadTime: Utils.toDateTime(snapshot['lastMessageTime']),
  //     userId: snapshot['userId'],
  //   );
  // }
  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      userId: json['userId'],
      userName: json['userName'],
      image: json['image'],
      uploadTime: (json['uploadTime'] as Timestamp).toDate(),
      isSeen: json['isSeen'],
      userAvatar: json['userAvatar'],
    );
  }

  Map<String, dynamic> toJson() => {
        'image': image,
        'userName': userName,
        'uploadTime': Utils.fromDateTimeToJson(uploadTime),
        'isSeen': isSeen,
        'userId': userId,
        'userAvatar': userAvatar
      };
}

class UserField {
  static final String uploadTime = 'uploadTime';
}

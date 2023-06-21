import 'package:chitchat/db/models/untill.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Story {
  final String image;
  final String userName;
  final DateTime? uploadTime;

  const Story({
    required this.image,
    required this.userName,
    required this.uploadTime,
  });

  static Story fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    // Convert Timestamp to DateTime
    DateTime? uploadTime;
    Timestamp? timestamp = snapshot['uploadTime'];
    if (timestamp != null) {
      uploadTime = timestamp.toDate();
    }

    return Story(
      image: snapshot["image"],
      userName: snapshot["userName"],
      uploadTime: Utils.toDateTime(snapshot['lastMessageTime']),
    );
  }

  Map<String, dynamic> toJson() => {
        'image': image,
        'userName': userName,
        'lastMessageTime': Utils.fromDateTimeToJson(uploadTime)
      };
}

class UserField {
  static final String uploadTime = 'uploadTime';
}

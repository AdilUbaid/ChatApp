import 'package:chitchat/db/models/untill.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatUser {
  final String id;
  final String image;
  final String userName;
  final String phoneNumber;
  final String aboutMe;
  final DateTime? lastMessageTime;

  const ChatUser({
    required this.id,
    required this.image,
    required this.userName,
    required this.phoneNumber,
    required this.aboutMe,
    required this.lastMessageTime,
  });

  // static ChatUser fromSnap(DocumentSnapshot snap) {
  //   var snapshot = snap.data() as Map<String, dynamic>;

  //   return ChatUser(
  //       id: snapshot    ["id"],
  //       image: snapshot["image"],
  //       userName: snapshot["userName"],
  //       phoneNumber: snapshot["phoneNumber"],
  //       aboutMe: snapshot["aboutMe"],
  //       lastMessageTime: snapshot["lastMessageTime"]);
  // }
  static ChatUser fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    // Convert Timestamp to DateTime
    DateTime? lastMessageTime;
    Timestamp? timestamp = snapshot['lastMessageTime'];
    if (timestamp != null) {
      lastMessageTime = timestamp.toDate();
    }

    return ChatUser(
      id: snapshot["id"],
      image: snapshot["image"],
      userName: snapshot["userName"],
      phoneNumber: snapshot["phoneNumber"],
      aboutMe: snapshot["aboutMe"],
      lastMessageTime: Utils.toDateTime(snapshot['lastMessageTime']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'userName': userName,
        'phoneNumber': phoneNumber,
        'aboutMe': aboutMe,
        'lastMessageTime': Utils.fromDateTimeToJson(lastMessageTime)
      };
}

class UserField {
  static final String lastMessageTime = 'lastMessageTime';
}

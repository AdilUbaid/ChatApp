import 'package:cloud_firestore/cloud_firestore.dart';

class Call {
  final String callerId;
  final String callerName;
  final String callerAvatar;
  final String receiverId;
  final String receiverName;
  final String receiverAvatar;
  final bool isMissed;
  final bool isVideo;
  final DateTime timeOfCall;

  const Call({
    required this.isVideo,
    required this.callerId,
    required this.callerName,
    required this.callerAvatar,
    required this.receiverId,
    required this.receiverName,
    required this.receiverAvatar,
    required this.isMissed,
    required this.timeOfCall,
  });

  static Call fromJson(DocumentSnapshot? jsonDoc) {
    var json = jsonDoc?.data() as Map<String, dynamic>;
    return Call(
      isVideo: json['isVideo'],
      callerId: json['callerId'],
      callerName: json['callerName'],
      callerAvatar: json['callerAvatar'],
      receiverId: json['receiverId'],
      receiverName: json['receiverName'],
      receiverAvatar: json['receiverAvatar'],
      isMissed: json['isMissed'],
      timeOfCall: (json['timeOfCall'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() => {
        'callerId': callerId,
        'callerName': callerName,
        'callerAvatar': callerAvatar,
        'receiverId': receiverId,
        'receiverName': receiverName,
        'receiverAvatar': receiverAvatar,
        'isMissed': isMissed,
        'timeOfCall': timeOfCall,
        'isVideo': isVideo,
      };
}

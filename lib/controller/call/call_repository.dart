import 'package:cloud_firestore/cloud_firestore.dart';

import '../../db/models/call_model.dart';

class FirebaseCallApi {
  // Uploading call detail to Firestore
  static Future<void> uploadCallDetail({
    required String callerId,
    required String callerName,
    required String callerAvatar,
    required String receiverId,
    required String receiverName,
    required String receiverAvatar,
    required bool isMissed,
    required bool isVideo,
    required DateTime timeOfCall,
  }) async {
    final callDetail = Call(
      callerId: callerId,
      callerName: callerName,
      callerAvatar: callerAvatar,
      receiverId: receiverId,
      receiverName: receiverName,
      receiverAvatar: receiverAvatar,
      isMissed: isMissed,
      timeOfCall: timeOfCall,
      isVideo: isVideo,
    );

    await FirebaseFirestore.instance
        .collection('calls')
        .doc(callerId)
        .collection('callLogs')
        .add(callDetail.toJson());
  }

  // Fetching call details
  static Stream<QuerySnapshot<Map<String, dynamic>>> getCallDetails(
          String userId) =>
      FirebaseFirestore.instance
          .collection('calls')
          .doc(userId)
          .collection('callLogs')
          .orderBy('timeOfCall', descending: true)
          .snapshots();
}
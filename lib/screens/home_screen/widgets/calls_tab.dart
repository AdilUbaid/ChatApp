import 'package:chitchat/screens/audio_call_screen/audio_call_screen.dart';
import 'package:chitchat/screens/constants.dart';
import 'package:chitchat/widgets/avater_circle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../controller/provider.dart';

class CallTab extends StatelessWidget {
  const CallTab({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('calls')
            .doc(userProvider.getUser.id)
            .collection('callLogs')
            // .orderBy('lastMessageTime', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.separated(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final callSnap = snapshot.data!.docs[index];
              DateTime dateTime = callSnap['timeOfCall'].toDate();
              return ListTile(
                leading: AvatarCircle(
                  url: callSnap['callerAvatar'],
                ),
                title: Text(
                  callSnap['callerName'],
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 27.sp),
                ),
                subtitle: Text(DateFormat('hh:mm').format(dateTime)),
                trailing: IconButton(
                    icon: Icon(
                      callSnap['isVideo'] ? Icons.videocam_rounded : Icons.call,
                      color: orangeColor,
                    ),
                    onPressed: () {
                      index % 2 == 0
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const AudioCallScreen(index: 1),
                              ))
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const AudioCallScreen(index: 0),
                              ));
                    }),
              );
            },
            itemCount: snapshot.data!.docs.length,
            separatorBuilder: (BuildContext context, int index) => Divider(
              height: 0,
              color: Colors.grey[200],
              indent: 10,
              endIndent: 10,
              // thickness: 1,
            ),
          );
        });
  }
}

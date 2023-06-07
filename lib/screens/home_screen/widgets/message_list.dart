import 'dart:developer';

import 'package:chitchat/screens/constants.dart';
import 'package:chitchat/screens/home_screen/widgets/message_contact_info.dart';
import 'package:chitchat/screens/search_screen/search_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:chitchat/db/models/chat_user.dart' as model;

import '../../audio_call_screen/audio_call_screen.dart';

class MessageList extends StatelessWidget {
  const MessageList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .orderBy('lastMessageTime', descending: true)
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
              DocumentSnapshot userSnap = snapshot.data!.docs[index];
              log(snapshot.data!.docs.length.toString());
              return SizedBox(
                width: 30,
                child: Slidable(
                    startActionPane:
                        ActionPane(motion: const StretchMotion(), children: [
                      SlidableAction(
                        onPressed: (context) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const AudioCallScreen(index: 1),
                            )) /* call */,
                        icon: Icons.phone,
                        label: 'voice call',
                        backgroundColor: orangeColor,
                        foregroundColor: whiteColor,
                        spacing: 0,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        // padding: EdgeInsets.all(0),
                      ),
                      SlidableAction(
                        onPressed: (context) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const AudioCallScreen(index: 0),
                            )) /* call */,
                        icon: vdo,
                        label: 'Video call',
                        backgroundColor: orangeColor,
                        foregroundColor: whiteColor,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                      )
                    ]),
                    child: MessageContactInfo(
                      index: index,
                      // snap: model.ChatUser.fromSnap(snapshot.data!.docs[index]),
                      userSnap: userSnap,
                    )),
              );
            },
            // itemCount: availableUsers.length,
            itemCount: snapshot.data!.docs.length,

            separatorBuilder: (BuildContext context, int index) => Divider(
              color: Colors.grey[200],
              indent: 10,
              endIndent: 10,
              // thickness: 1,
            ),
          );
        });
  }
}

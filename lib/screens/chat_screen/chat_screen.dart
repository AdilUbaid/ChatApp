// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:chitchat/screens/chat_screen/widget/message_box.dart';
import 'package:chitchat/screens/chat_screen/widget/text_field.dart';
import 'package:chitchat/screens/constants.dart';
import 'package:chitchat/db/models/messeges.dart' as model;
import 'package:provider/provider.dart';

import '../../controller/chat/chat_repository.dart';
import '../../controller/provider.dart';
import '../audio_call_screen/audio_call_screen.dart';

// QueryDocumentSnapshot<Map<String, dynamic>>? querySnapshotChatScreen = null;

class ChatScreen extends StatefulWidget {
  // ChatUser snap;
  String idUser;
  DocumentSnapshot receiver;

  ChatScreen({
    Key? key,
    required this.idUser,
    required this.receiver,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    addData();
    super.initState();
  }

  addData() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshUser();
    log(FirebaseAuth.instance.currentUser!.displayName.toString());
  }

  @override
  Widget build(BuildContext context) {
    // final currentUser = Provider.of<UserProvider>(context).getUser;
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    // final currentUser = getDocumentByField(widget.idUser);
    // log(currentUser.toString());
    // final user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
          elevation: .7,
          leading: Padding(
            padding: const EdgeInsets.all(3),
            child: CircleAvatar(
                radius: 46.r,
                backgroundImage: NetworkImage(widget.receiver['image'])),
          ),
          actions: <Widget>[
            SizedBox(
              width: 600.h,
              // color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        // currentUser.id,
                        widget.receiver['userName'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25.sp),
                      ),
                      // const Text('online'),
                    ],
                  ),
                  SizedBox(
                      width: 215.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          CircleIconBack(
                            index: 0,
                            icon: vdo,
                          ),
                          CircleIconBack(
                            index: 1,
                            icon: phn,
                          )
                        ],
                      )),
                ],
              ),
            )
          ]),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: StreamBuilder(
                stream: FirebaseApi.getMessages(
                    idUser: userProvider.getUser.id, recieverId: widget.idUser),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  log(widget.idUser);
                  log(FirebaseAuth.instance.currentUser!.uid);
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return snapshot.data!.docs.isEmpty
                      ? buildText('Say Hi...')
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          reverse: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final messagessnap = model.Message.fromJson(
                                snapshot.data!.docs[index]);

                            return MessageBox(
                              isRight: messagessnap.recieverId !=
                                  FirebaseAuth.instance.currentUser!.uid,

                              content: MessageText(
                                isRight: true,
                                message: messagessnap.message,
                              ),
                              time: messagessnap.createdAt,

                              // const MessageBox(
                              //     isRight: true,
                              //     content: MessageText(
                              //       isRight: true,
                              //       message:
                              //           'In Flutter, the AppBar widget is used to create a top app bar that contains various elements such as the apps logo, title, and actions. To add multiple widgets to the AppBar, you can use the Row widget to create a horizontal row of widgets, and then wrap the Row widget with an Expanded widget to make sure that it takes up all the available space within the AppBar',
                              //     )),
                              // const MessageBox(
                              //   isRight: false,
                              //   content: MessageText(
                              //     isRight: false,
                              //     message: 'Hi',
                              //   ),
                              // ),
                              //  MessageBox(
                              //     isRight: false,
                              //     content: MessageText(
                              //       isRight: false,
                              //       message:
                              //           'In Flutter, the AppBar widget is used to create a top app bar that contains various elements such as the apps logo, title, and actions. To add multiple widgets to the AppBar, you can use the Row widget to create a horizontal row of widgets, and then wrap the Row widget with an Expanded widget to make sure that it takes up all the available space within the AppBar',
                              //     ))
                              // const MessageBox(
                              //     isRight: true,
                              //     content: AudioProgress(
                              //       isRight: true,
                              //     ))
                            );
                          }

                          // Container(child: AudioProgressBar())
                          // ],
                          );
                }),
          ),
          TextMessageField(
            receiver: widget.receiver,
          ),
        ],
      )),
    );
  }

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 24),
        ),
      );
}

// Future<DocumentSnapshot<Map<String, dynamic>>> getDocumentByField(
//     String idUser) async {
//   final querySnapshot = await FirebaseFirestore.instance
//       .collection('users')
//       .where('id', isEqualTo: idUser)
//       // .limit(1)
//       .get();
//   log(querySnapshot.docs.first.toString());
//   querySnapshotChatScreen = querySnapshot.docs.first;

//   // if (querySnapshot.docs.isNotEmpty) {
//   return querySnapshot.docs.first;
//   // }

//   // return null; // Document not found
// }

class CircleIconBack extends StatelessWidget {
  final IconData icon;
  final int index;
  const CircleIconBack({
    super.key,
    required this.icon,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 80.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: orangeColor),
      // color: orangeColor,
      child: IconButton(
        onPressed: () {
          index == 0
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AudioCallScreen(
                            index: 0,
                          )))
              : Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AudioCallScreen(
                            index: 1,
                          )));
        },
        icon: Icon(icon),
        color: whiteColor,
      ),
    );
  }
}

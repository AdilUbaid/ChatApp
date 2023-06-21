// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:chitchat/db/models/chat_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:chitchat/screens/chat_screen/widget/message_box.dart';
import 'package:chitchat/screens/chat_screen/widget/text_field.dart';
import 'package:chitchat/db/models/messeges.dart' as model;
import 'package:provider/provider.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../controller/chat/chat_repository.dart';
import '../../controller/provider.dart';

// ignore: must_be_immutable
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
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                      width: 250.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // CircleIconBack(
                          //   index: 0,
                          //   icon: vdo,
                          // ),
                          SizedBox(
                              height: 35,
                              width: 35,
                              child: actionButton(false, userProvider.getUser)),
                          SizedBox(
                              height: 35,
                              width: 35,
                              child: actionButton(true, userProvider.getUser)),
                          // CircleIconBack(
                          //   index: 1,
                          //   icon: phn,
                          // )
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
            // flex: 1,
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
                          // shrinkWrap: true,
                          // physics: const BouncingScrollPhysics(),
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
  ZegoSendCallInvitationButton actionButton(bool isVideo, ChatUser user) {
    log('zego works');
    return ZegoSendCallInvitationButton(
      notificationMessage: 'incoming call',
      notificationTitle: widget.receiver['userName'],
      iconTextSpacing: 0.0,
            iconSize: const Size(35, 35),
      isVideoCall: isVideo,
      callID: '12',
      invitees: [
        ZegoUIKitUser(
            id: widget.receiver['id'], name: widget.receiver['userName'])
      ],
    );
  }
}


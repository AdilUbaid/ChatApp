
import 'package:chitchat/controller/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';

import 'package:chitchat/screens/chat_screen/widget/request_payment.dart';
import 'package:chitchat/screens/constants.dart';
import 'package:provider/provider.dart';

import '../../../controller/chat/chat_repository.dart';
import '../../../helper/image_picker.dart';

// ignore: must_be_immutable
class TextMessageField extends StatelessWidget {
  // ChatUser snap;
  DocumentSnapshot receiver;
  TextMessageField({
    Key? key,
    required this.receiver,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    String messages = '';
    final _textController = TextEditingController();

    void sendMessage() async {
      FocusScope.of(context).unfocus();
      // log(currentUser.id);
      // log(messages);
      //upload message
      await FirebaseApi.uploadMessage(
        currentUserId: userProvider.getUser.id,
        recieverId: receiver['id'],
        message: messages,
        recieverAvatarUrl: receiver['image'],
        recieverUsername: receiver['userName'],
      );

      _textController.clear();
      messages = '';
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SpeedDial(
            overlayColor: const Color.fromARGB(0, 0, 0, 0),
            overlayOpacity: 0,
            // closeDialOnPop: true,
            buttonSize: Size(80.w, 80.w),
            activeForegroundColor: Colors.transparent,
            backgroundColor: greyShade,
            icon: Icons.attach_file_rounded,
            children: [
              cameraSpeedDial(Icons.photo_camera_outlined, context),
              imageSpeedDial(Icons.image_outlined, context),
              // paymentSpeedDial(Icons.currency_rupee_outlined, context),
              // locationSpeedDial(Icons.add_location_outlined, context),
            ],
          ),
          SizedBox(
            width: 10.w,
          ),
          Container(
            // color: Colors.amber,
            decoration: BoxDecoration(
                color: greyShade, borderRadius: BorderRadius.circular(50.r)),
            width: 518.w,
            child: Row(
              children: [
                SizedBox(
                  width: 350.w,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: TextField(
                      controller: _textController,
                      // autofocus: true,
                      minLines: 1,
                      maxLines: 7,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.emoji_emotions_outlined)),
                IconButton(
                    onPressed: () async {
                      messages = _textController.text;
                      messages.trim().isEmpty
                          ? showSnackBar(context, 'Type some message to sent!')
                          : sendMessage();
                    },
                    icon: const Icon(Icons.send)),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.mic)),

          // IconButton(onPressed: () {}, icon: Icon(Icons.attach_file_rounded)),
        ],
      ),
    );
  }

  // SpeedDialChild locationSpeedDial(IconData icon, BuildContext context) {
  //   return SpeedDialChild(
  //       shape: const CircleBorder(),
  //       child: IconButton(
  //           onPressed: () {
  //             showDialog(
  //               context: context,
  //               builder: (BuildContext context) {
  //                 return const RequestPayment();
  //               },
  //             );
  //           },
  //           icon: Icon(icon)));
  // }

  SpeedDialChild cameraSpeedDial(IconData icon, BuildContext context) {
    return SpeedDialChild(
        shape: const CircleBorder(),
        child: IconButton(
            onPressed: () async {
              await ImagePicker().pickImage(source: ImageSource.camera);
            },
            icon: Icon(icon)));
  }

  SpeedDialChild imageSpeedDial(IconData icon, BuildContext context) {
    return SpeedDialChild(
        shape: const CircleBorder(),
        child: IconButton(
            onPressed: () async {
              await ImagePicker().pickImage(source: ImageSource.gallery);
            },
            icon: Icon(icon)));
  }

  // SpeedDialChild paymentSpeedDial(IconData icon, BuildContext context) {
  //   return SpeedDialChild(
  //       shape: const CircleBorder(),
  //       child: IconButton(
  //           onPressed: () {
  //             showDialog(
  //               context: context,
  //               builder: (BuildContext context) {
  //                 return const RequestPayment();
  //               },
  //             );
  //           },
  //           icon: Icon(icon)));
  // }
  

}

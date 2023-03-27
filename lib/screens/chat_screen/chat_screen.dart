import 'package:chitchat/screens/chat_screen/widget/date_container.dart';
import 'package:chitchat/screens/chat_screen/widget/message_box.dart';
import 'package:chitchat/screens/chat_screen/widget/text_field.dart';
import 'package:chitchat/screens/constants.dart';
import 'package:chitchat/widgets/avater_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../audio_call_screen/audio_call_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: .7,
          leading: const AvatarCircle(),
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
                        'Name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25.sp),
                      ),
                      const Text('online'),
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
            child: ListView(
              children: [
                const DateContainer(),
                Column(
                  children: const [
                    MessageBox(
                      isRight: true,
                      content: MessageText(
                        isRight: true,
                        message: 'Hi',
                      ),
                    ),
                    MessageBox(
                        isRight: true,
                        content: MessageText(
                          isRight: true,
                          message:
                              'In Flutter, the AppBar widget is used to create a top app bar that contains various elements such as the apps logo, title, and actions. To add multiple widgets to the AppBar, you can use the Row widget to create a horizontal row of widgets, and then wrap the Row widget with an Expanded widget to make sure that it takes up all the available space within the AppBar',
                        )),
                    MessageBox(
                      isRight: false,
                      content: MessageText(
                        isRight: false,
                        message: 'Hi',
                      ),
                    ),
                    MessageBox(
                        isRight: false,
                        content: MessageText(
                          isRight: false,
                          message:
                              'In Flutter, the AppBar widget is used to create a top app bar that contains various elements such as the apps logo, title, and actions. To add multiple widgets to the AppBar, you can use the Row widget to create a horizontal row of widgets, and then wrap the Row widget with an Expanded widget to make sure that it takes up all the available space within the AppBar',
                        )),
                    MessageBox(
                        isRight: true,
                        content: AudioProgress(
                          isRight: true,
                        ))
                  ],
                ),

                // Container(child: AudioProgressBar())
              ],
            ),
          ),
          const TextMessageField(),
        ],
      )),
    );
  }
}

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


import 'package:chitchat/screens/chat_screen/chat_screen.dart';
import 'package:chitchat/screens/constants.dart';
import 'package:chitchat/widgets/avater_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'avatar_pop_up.dart';

class MessageContactInfo extends StatefulWidget {
  const MessageContactInfo({super.key});

  @override
  State<MessageContactInfo> createState() => _MessageContactInfoState();
}

class _MessageContactInfoState extends State<MessageContactInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AvatarPopUp();
                },
              );
            },
            child: Stack(
              alignment: const AlignmentDirectional(.8, .9),
              children: [
                const AvatarCircle(),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor),
                  child: const Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Icon(
                      Icons.circle,
                      color: Colors.green,
                      size: 12,
                    ),
                  ),
                )
              ],
            ),
          ),
          InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChatScreen(),
                  )),
              child: SizedBox(
                // color: Colors.red,
                height: 80.w,
                width: 580.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "name",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 27.sp),
                          ),
                          Row(
                            children: const [
                              Text("last message preview"),
                              Text('  time'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: 35.h,
                        // width: 35.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 8.w,
                            right: 8.w,
                          ),
                          child: const Text(
                            '999+',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}




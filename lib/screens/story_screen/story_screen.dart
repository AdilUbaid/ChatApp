import 'package:chitchat/screens/constants.dart';
import 'package:chitchat/widgets/avater_circle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class StoryScreen extends StatefulWidget {
  final String? avatarUrl;
  final String storyUrl;
  final String userName;
  final Timestamp time;
  const StoryScreen(
      {super.key,
      required this.userName,
      required this.time,
      this.avatarUrl,
      required this.storyUrl});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10))
          ..addListener(() {
            setState(() {});
          });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = widget.time.toDate();

    return Scaffold(
      body: SafeArea(
          child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: blackColor,
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: imagePick(widget.storyUrl))),
                height: double.infinity,
                width: double.infinity,
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.h),
                    child: LinearProgressIndicator(
                      value: controller.value,
                      backgroundColor: Colors.grey,
                      color: whiteColor,
                    ),
                  ),
                  ListTile(
                    leading: AvatarCircle(
                      url: widget.avatarUrl,
                    ),
                    title: Text(
                      widget.userName,
                      style: TextStyle(color: whiteColor),
                    ),
                    subtitle: Text(DateFormat('hh:mm').format(dateTime),
                        style: TextStyle(color: whiteColor)),
                    trailing: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          color: whiteColor,
                          size: 50.sp,
                        )),
                  ),
                ],
              ),
              // TextMessageField()
            ],
          ),
          // Padding(
          //   padding: EdgeInsets.only(bottom: 15.h),
          //   child: Container(
          //     // color: Colors.amber,
          //     decoration: BoxDecoration(
          //         color: greyShade, borderRadius: BorderRadius.circular(50.r)),
          //     width: 670.w,
          //     child: Row(
          //       children: [
          //         SizedBox(
          //           width: 490.w,
          //           child: Padding(
          //             padding: EdgeInsets.only(left: 15.w),
          //             child: const TextField(
          //               // autofocus: true,
          //               minLines: 1,
          //               maxLines: 7,
          //               decoration: InputDecoration(
          //                 border: InputBorder.none,
          //               ),
          //             ),
          //           ),
          //         ),
          //         IconButton(
          //             onPressed: () {},
          //             icon: const Icon(Icons.emoji_emotions_outlined)),
          //         IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      )),
    );
  }
}

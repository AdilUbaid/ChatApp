import 'package:chitchat/screens/constants.dart';
import 'package:chitchat/widgets/avater_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: blackColor,
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage("assets/images/story_audi.jpg"))),
                height: double.infinity,
                width: double.infinity,
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.h),
                    child: const LinearProgressIndicator(
                      value: .3,
                      backgroundColor: Colors.grey,
                      color: whiteColor,
                    ),
                  ),
                  ListTile(
                    leading: const AvatarCircle(),
                    title: const Text(
                      "Name",
                      style: TextStyle(color: whiteColor),
                    ),
                    subtitle:
                        const Text('1h', style: TextStyle(color: whiteColor)),
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
          Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: Container(
              // color: Colors.amber,
              decoration: BoxDecoration(
                  color: greyShade, borderRadius: BorderRadius.circular(50.r)),
              width: 670.w,
              child: Row(
                children: [
                  SizedBox(
                    width: 490.w,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child: const TextField(
                        // autofocus: true,
                        minLines: 1,
                        maxLines: 7,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.emoji_emotions_outlined)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

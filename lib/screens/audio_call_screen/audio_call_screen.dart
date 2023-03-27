import 'package:chitchat/screens/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AudioCallScreen extends StatelessWidget {
  final int index;
  const AudioCallScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.amber,
            image: DecorationImage(
                image: AssetImage('assets/images/avatar_formal_1.jpg'),
                colorFilter: ColorFilter.mode(
                    Color.fromARGB(123, 0, 0, 0), BlendMode.darken),
                fit: BoxFit.fitHeight)),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 300.h,
                ),
                Container(
                  // color: Colors.amber,
                  height: 300.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.r)),
                    color: Colors.amber,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/avatar_formal_1.jpg'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h, bottom: 8.h),
                  child: Text(
                    "Name",
                    style: TextStyle(color: whiteColor, fontSize: 45.sp),
                  ),
                ),
                Text(
                  "Incoming call",
                  style: TextStyle(color: whiteColor, fontSize: 25.sp),
                ),
              ],
            ),
            SizedBox(
              height: 360.h,
            ),
            Visibility(
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                visible: index == 0 ? true : false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    VideoCallButtons(
                      icon: Icons.volume_off_outlined,
                    ),
                    VideoCallButtons(
                      icon: Icons.videocam_outlined,
                    ),
                    VideoCallButtons(
                      icon: Icons.mic_off_outlined,
                    ),
                  ],
                )),
            SizedBox(
              height: 60.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CallWidget(
                  icon: Icons.call_rounded,
                  color: Color.fromARGB(255, 82, 188, 85),
                ),
                CallWidget(
                  icon: Icons.call_end_rounded,
                  color: redColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class VideoCallButtons extends StatelessWidget {
  final IconData icon;
  const VideoCallButtons({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(121, 199, 191, 191),
        ),
        //
        height: 100.h,
        width: 100.w,
        child: IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              color: whiteColor,
            )),
      ),
    );
  }
}

class CallWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  const CallWidget({
    super.key,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: 140.w,
      // ,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(50), color: color),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          icon,
          color: whiteColor,
          size: 40,
        ),
      ),
    );
  }
}

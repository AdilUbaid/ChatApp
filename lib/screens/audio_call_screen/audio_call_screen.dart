import 'package:chitchat/screens/constants.dart';
import 'package:chitchat/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../controller/provider.dart';

class AudioCallScreen extends StatefulWidget {
  final int index;
  const AudioCallScreen({super.key, required this.index});

  @override
  State<AudioCallScreen> createState() => _AudioCallScreenState();
}

class _AudioCallScreenState extends State<AudioCallScreen> {
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
        body: SafeArea(
            child: ZegoUIKitPrebuiltCall(
      appID: Utils.appId,
      appSign: Utils.appSignIn,
      userID: userProvider.getUser.id,
      userName: userProvider.getUser.userName,
      callID: '12',
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()..onOnlySelfInRoom,
    )));
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

import 'package:chitchat/screens/user_profile_view/widgets/options_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/user_avatar.dart';
import '../constants.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            SizedBox(
              // color: Colors.amber,
              height: 400.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UserAvatar(
                    icon: Icons.edit,
                  ),
                  Text(
                    'Username',
                    style:
                        TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'about',
                    style: TextStyle(
                      fontSize: 30.sp,
                    ),
                  )
                ],
              ),
            ),
            OptionsBar(
                icon: Icons.dark_mode,
                option: "Dark Mode",
                widget: Switch(
                  value: light,
                  activeColor: orangeColor,
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      light = value;
                    });
                  },
                )),
            // OptionsBar(
            //     icon: Icons.notifications,
            //     option: "Notification",
            //     widget: IconButton(
            //       icon: const Icon(Icons.keyboard_arrow_right_outlined),
            //       onPressed: () {},
            //     )),
            const OptionsBar(
                icon: Icons.policy,
                option: "Privacy policy",
                widget: SizedBox()),
            const OptionsBar(
                icon: Icons.info_rounded, option: " About", widget: SizedBox())
          ],
        ),
      )),
    );
  }
}

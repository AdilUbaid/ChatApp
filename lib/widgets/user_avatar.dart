import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/constants.dart';

class UserAvatar extends StatelessWidget {
  final IconData icon;
   const UserAvatar({
    super.key, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          backgroundImage: const AssetImage("assets/images/avatar_main.png"),
          radius: 140.r,
        ),
        Container(
          decoration: BoxDecoration(
              color: orangeColor, borderRadius: BorderRadius.circular(50.r)),
          child: IconButton(
              onPressed: () {},
              icon: Icon(icon, color: whiteColor)),
        )
      ],
    );
  }
}

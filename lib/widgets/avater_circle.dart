import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarCircle extends StatelessWidget {
  const AvatarCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: CircleAvatar(
        radius: 46.r,
        backgroundImage: const AssetImage('assets/images/avatar_formal_1.jpg'),
      ),
    );
  }
}

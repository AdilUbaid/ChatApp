import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';

class AvatarPopUp extends StatelessWidget {
  const AvatarPopUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.transparent,
          height: 590.h,
          width: 500.w,
          child: Column(
            children: [
              Container(
                height: 500.h,
                width: 500.w,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/avatar_formal_1.jpg'))),
              ),
             TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.red),
          textStyle: MaterialStateProperty.all(TextStyle(
              color: whiteColor, fontSize: 35.sp, fontWeight: FontWeight.bold)),
          foregroundColor: MaterialStateProperty.all(whiteColor),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.r))),
          fixedSize: MaterialStateProperty.all(Size(500.w, 90.h))),
      child: const Text("Block contact"),
    )
            ],
          ),
        )
      ],
    );
  }
}
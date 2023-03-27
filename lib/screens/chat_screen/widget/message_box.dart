import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';

class MessageBox extends StatelessWidget {
  // final String message;
  final Widget content;
  final bool isRight;
  const MessageBox({
    super.key,
    // required this.message,
    required this.isRight,
    required this.content,
    // required String message
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 5.w, bottom: 5.w),
      child: Row(
        mainAxisAlignment:
            isRight ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: isRight
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10))
                    : const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                color: isRight ? orangeColor : greyShade),
            // width: 560.w,
            // color: orangeColor,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 560.w),
              child: Stack(
                alignment: const AlignmentDirectional(1, .9),
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 25.w, right: 25.w, top: 25.w, bottom: 25.w),
                    child: content,
                  ),
                  SizedBox(
                    width: 100.w,
                    child: Row(
                      children: [
                        Text(
                          '12:20',
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.check,
                          size: 20.sp,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageText extends StatelessWidget {
  const MessageText({
    super.key,
    required this.message,
    required this.isRight,
  });

  final String message;
  final bool isRight;

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      maxLines: 1000,
      style: TextStyle(
          color: isRight ? whiteColor : blackColor,
          fontSize: 28.sp,
          height: 1.3,),
    );
  }
}

class AudioProgress extends StatelessWidget {
  final bool isRight;

  const AudioProgress({
    super.key,
    required this.isRight,
  });

  @override
  Widget build(BuildContext context) {
    Color themeColor = isRight ? whiteColor : blackColor;
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.play_arrow_rounded,
              color: themeColor,
              size: 60.sp,
              // weight: 90,
            )),
        SizedBox(
          width: 420.w,
          // color: Colors.black,
          child: Column(
            children: [
              Slider(
                value: .3,
                onChanged: (value) {},
                activeColor: themeColor,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       '00:00',
              //       style: TextStyle(color: themeColor),
              //     ),
              //     Text('00:00', style: TextStyle(color: themeColor))
              //   ],
              // )
            ],
          ),
        ),
      ],
    );
  }
}

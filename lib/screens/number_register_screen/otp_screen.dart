import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/welcome_button.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    // width: 430.w,
                    child: Text(
                      'Enter Your otp',
                      style: TextStyle(
                          fontSize: 50.sp, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: 12.h, maxHeight: 100.h)),
                  Container(
                      alignment: Alignment.center,
                      width: 500.w,
                      child: Text(
                        "Please enter your otp number",
                        style: TextStyle(fontSize: 27.sp),
                        textAlign: TextAlign.center,
                      )),
                  ConstrainedBox(constraints: BoxConstraints(minHeight: 102.h)),
                  SizedBox(
                      width: 320.w,
                      child: TextField(
                        autofocus: true,
                        maxLength: 6,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontSize: 50.sp,
                          letterSpacing: 13,
                        ),
                        decoration: const InputDecoration(
                          fillColor: Colors.red,
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                      ))
                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(bottom: 20.h),
            //   child: const WelcomeButton(
            //     textOfButton: "Continue",
            //     pageNumber: 2,
            //   ),
            // )
          ],
        ),
      )),
    );
  }
}

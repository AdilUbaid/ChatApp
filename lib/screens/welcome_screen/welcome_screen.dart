import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/welcome_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 600.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/welcomeScreen.png'),
                      fit: BoxFit.fitHeight)),
            ),
            SizedBox(
              width: 430.w,
              child: Text(
                'Connect easily with your family and friends over countries',
                style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 70.h,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(30.0.h),
                  child: const Text('Terms & Privacy Policy '),
                ),
                const WelcomeButton(
                  pageNumber: 0,
                  textOfButton: "Start Messaging",
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}

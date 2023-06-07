import 'package:chitchat/screens/home_screen/home_screen.dart';
import 'package:chitchat/screens/number_register_screen/number_registration_screen.dart';
import 'package:chitchat/screens/profile_setup_screen/profile_setup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/welcome_button.dart';
import '../constants.dart';

String? gOTP;

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
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
                        controller: otpController,
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
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: SizedBox(
                      height: 87.h,
                      width: 660.w,
                      child: TextButton(
                        onPressed: () async {
                          try {
                            PhoneAuthCredential credential =
                                PhoneAuthProvider.credential(
                                    verificationId: NumberRegScreen.verify,
                                    smsCode: otpController.text);
                          UserCredential userCredential = await auth.signInWithCredential(credential);
                            gOTP = otpController.text;
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfileSetupScreen(
                                          credential: userCredential,
                                        )));
                          } catch (e) {
                            print('wrong OTP');
                          }
                        },
                        style: const ButtonStyle(

                            // backgroundColor: MaterialStatePropertyAll(orangeColor)),
                            ),
                        child: const Text(
                          'continue',
                          style: TextStyle(color: whiteColor),
                        ),
                      ),
                    ),
                  )
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

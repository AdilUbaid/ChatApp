import 'package:chitchat/widgets/welcome_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumberRegScreen extends StatelessWidget {
  NumberRegScreen({super.key});
  final countryCodeController = TextEditingController();
  final phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final countryCodeController = TextEditingController();

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
                      'Enter Your Phone Number',
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
                        "Please confirm your country code and enter your phone number",
                        style: TextStyle(fontSize: 27.sp),
                        textAlign: TextAlign.center,
                      )),
                  ConstrainedBox(constraints: BoxConstraints(minHeight: 102.h)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        // color: Colors.orange.shade100,
                        height: 60.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: const DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: AssetImage(
                                    'assets/images/Flag_of_India.png'))),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.orange.shade50,
                        ),
                        height: 70.h,
                        // color: Colors.orange.shade100,
                        width: 100.w,
                        child: TextField(
                          controller: countryCodeController,
                          autofocus: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '+91',
                              hintStyle: TextStyle(color: Colors.grey[400])),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.orange.shade50,
                        ),
                        height: 70.h,
                        // color: Colors.orange.shade100,
                        width: 450.w,
                        child: TextField(
                          controller: phoneNumberController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Phone Number ',
                              hintStyle: TextStyle(color: Colors.grey[400])),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: WelcomeButton(
                function: authFunction(),
                textOfButton: "Confirm number",
                pageNumber: 1,
              ),
            )
          ],
        ),
      )),
    );
  }

  authFunction() async {
    {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91 9961 755 401',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {},
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => const OtpScreen()));
    }
  }
}

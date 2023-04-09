import 'package:chitchat/screens/profile_setup_screen/profile_setup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/constants.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/number_register_screen/number_registration_screen.dart';
import '../screens/number_register_screen/otp_screen.dart';

class WelcomeButton extends StatelessWidget {
  final String textOfButton;
  final int pageNumber;
  final Function? callback;
  const WelcomeButton({
    super.key,
    required this.textOfButton,
    required this.pageNumber,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 87.h,
      width: 660.w,
      child: TextButton(
        onPressed: () {
          
          pageNavigator(pageNumber, context);
        },
        style: const ButtonStyle(

            // backgroundColor: MaterialStatePropertyAll(orangeColor)),
            ),
        child: Text(
          textOfButton,
          style: const TextStyle(color: whiteColor),
        ),
      ),
    );
  }

  pageNavigator(number, context) async {
    switch (number) {
      case 0:
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NumberRegScreen()));
        }
        break;
      case 1:
        {
          callback!();
          // await FirebaseAuth.instance.verifyPhoneNumber(
          //   phoneNumber:countryCodeController.text + phoneNumberCOntroller.text,,
          //   verificationCompleted: (PhoneAuthCredential credential) {},
          //   verificationFailed: (FirebaseAuthException e) {},
          //   codeSent: (String verificationId, int? resendToken) {},
          //   codeAutoRetrievalTimeout: (String verificationId) {},
          // );
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  OtpScreen()));
        }
        break;
      case 2:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>  ProfileSetupScreen()));
        break;
      case 3:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
        break;
    }
  }
}

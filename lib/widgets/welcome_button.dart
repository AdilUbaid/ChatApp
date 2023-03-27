import 'package:chitchat/screens/profile_setup_screen/profile_setup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/constants.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/number_register_screen/number_registration_screen.dart';

class WelcomeButton extends StatelessWidget {
  final String textOfButton;
  final int pageNumber;
  const WelcomeButton({
    super.key,
    required this.textOfButton,
    required this.pageNumber,
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
          style:const TextStyle(color: whiteColor),
        ),
      ),
    );
  }

  pageNavigator(number, context) {
    switch (number) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NumberRegScreen()));
        break;
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ProfileSetupScreen()));
        break;
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
        break;
    }
  }
}

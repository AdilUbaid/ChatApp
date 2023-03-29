import 'package:chitchat/screens/constants.dart';
import 'package:chitchat/widgets/welcome_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/user_avatar.dart';

class ProfileSetupScreen extends StatelessWidget {
  const ProfileSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Profile")),
      body: Center(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 550.h,
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const UserAvatar(
                      icon: Icons.camera_alt_outlined,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: greyShade,
                        ),
                        height: 70.h,
                        // color: Colors.orange.shade100,
                        width: 600.w,
                        child: TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: ' Name (required) ',
                              hintStyle: TextStyle(color: Colors.grey[400])),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: greyShade,
                      ),
                      height: 70.h,
                      // color: Colors.orange.shade100,
                      width: 600.w,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: ' about(optional) ',
                            hintStyle: TextStyle(color: Colors.grey[400])),
                        // keyboardType: TextInputType.,
                      ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(bottom: 30.h),
              //   child: const WelcomeButton(
              //     textOfButton: "Save",
              //     pageNumber: 3,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

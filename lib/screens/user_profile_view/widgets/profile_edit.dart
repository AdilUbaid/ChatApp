import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../controller/provider.dart';
import '../../constants.dart';

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserProvider>(context).getUser;
    var nameController = TextEditingController();
    nameController.text = currentUser.userName;
    var aboutController = TextEditingController();
    aboutController.text = currentUser.aboutMe;

    return Dialog(
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(18.0.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(currentUser.image),
                    radius: 140.r,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: orangeColor,
                        borderRadius: BorderRadius.circular(50.r)),
                    child: IconButton(
                        onPressed: () {
                          ImagePicker();
                        },
                        icon: Icon(Icons.edit),
                        color: whiteColor),
                  )
                ],
              ),
              TextField(
                controller: nameController,
              ),
              TextField(
                controller: aboutController,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('save', style: TextStyle(color: whiteColor)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

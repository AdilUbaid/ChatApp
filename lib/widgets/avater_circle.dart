// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarCircle extends StatelessWidget {
  String? url;
   AvatarCircle({
    Key? key,
     this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: CircleAvatar(
        radius: 46.r,
        backgroundImage: imagePick(url) ,
      ),
    );
  }
}
imagePick(String? url){
    if( url==null){
      return AssetImage('assets/images/avatar_formal_1.jpg');
    }else
    return NetworkImage(url);
  }
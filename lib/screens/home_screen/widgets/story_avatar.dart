import 'package:flutter/material.dart';

import '../../../widgets/avater_circle.dart';
import '../../constants.dart';
import '../../story_screen/story_screen.dart';

class StoryAvatar extends StatelessWidget {
  const StoryAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4),
      child: Column(
        children: [
          InkWell(onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => const StoryScreen(),) ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: orangeColor, width: 3),
                borderRadius: BorderRadius.circular(40),
              ),
              child: const AvatarCircle(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 2),
            child: Text(
              'name',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}

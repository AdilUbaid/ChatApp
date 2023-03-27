import 'package:chitchat/screens/audio_call_screen/audio_call_screen.dart';
import 'package:chitchat/screens/constants.dart';
import 'package:chitchat/widgets/avater_circle.dart';
import 'package:flutter/material.dart';

class CallTab extends StatelessWidget {
  const CallTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const AvatarCircle(),
          title: const Text('name'),
          subtitle: const Text("time"),
          trailing: IconButton(
              icon: Icon(
                index % 2 == 0 ? Icons.call : Icons.videocam_rounded,
                color: orangeColor,
              ),
              onPressed: () {
                index % 2 == 0
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AudioCallScreen(index: 1),
                        ))
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AudioCallScreen(index: 0),
                        ));
              }),
        );
      },
      itemCount: 20,
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: 0,
        color: Colors.grey[200],
        indent: 10,
        endIndent: 10,
        // thickness: 1,
      ),
    );
  }
}

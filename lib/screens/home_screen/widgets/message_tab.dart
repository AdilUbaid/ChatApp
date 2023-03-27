import 'package:chitchat/screens/home_screen/widgets/story_horizondal.dart';
import 'package:flutter/material.dart';

import 'message_list.dart';

class MessageTab extends StatefulWidget {
  const MessageTab({super.key});

  @override
  State<MessageTab> createState() => _MessageTabState();
}

class _MessageTabState extends State<MessageTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: const [
            StoryHorizondal(),
            MessageList(),
            // Text('mess'),
          ],
        ),
      ),
    );
  }
}

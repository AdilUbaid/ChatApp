import 'package:chitchat/screens/search_screen/widgets/search_widget.dart';
import 'package:chitchat/widgets/avater_circle.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const SearchBox(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => const ListTile(
                leading: AvatarCircle(),
                title: Text('Name'),
                subtitle: Text('about'),
              ),
              itemCount: 20,
            ),
          )
        ],
      )),
    );
  }
}

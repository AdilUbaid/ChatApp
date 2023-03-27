import 'package:chitchat/screens/constants.dart';
import 'package:flutter/material.dart';

class OptionsBar extends StatelessWidget {
  final IconData icon;
  final String option;
  final Widget widget;
  const OptionsBar(
      {super.key,
      required this.icon,
      required this.option,
      required this.widget});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: orangeColor,
      ),
      title: Text(option),
      trailing: widget,
    );
  }
}

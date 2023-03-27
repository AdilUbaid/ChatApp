import 'dart:async';
import 'package:chitchat/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const WelcomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: 200,
          child: Lottie.network(
              "https://assets9.lottiefiles.com/packages/lf20_xcydna5c.json"),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          "ChitChat",
          style: TextStyle(
              color: Color.fromARGB(255, 221, 143, 54),
              fontSize: 25,
              fontWeight: FontWeight.w500),
        )
      ]),
    ));
  }
}

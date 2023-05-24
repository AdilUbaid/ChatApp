import 'dart:async';
import 'package:chitchat/screens/home_screen/home_screen.dart';
import 'package:chitchat/screens/number_register_screen/number_registration_screen.dart';
import 'package:chitchat/screens/profile_setup_screen/profile_setup_screen.dart';
import 'package:chitchat/screens/welcome_screen/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    Timer(const Duration(seconds: 4), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        // if (user == null) {
        //   print('User is currently signed out!');
        //   Navigator.pushReplacement(context,
        //       MaterialPageRoute(builder: (context) => const WelcomeScreen()));
        // } else {
        //   print('User is signed in!');

        //   Navigator.pushReplacement(
        //       context, MaterialPageRoute(builder: (context) => HomeScreen()));
        // }
        Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) =>NumberRegScreen()));
      });
    });
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
          "kouvénta",
          style: TextStyle(
              color: Color.fromARGB(255, 221, 143, 54),
              fontSize: 25,
              fontWeight: FontWeight.w500),
        )
      ]),
    ));
  }
}

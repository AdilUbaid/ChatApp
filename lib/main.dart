import 'package:chitchat/screens/constants.dart';
import 'package:chitchat/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        // darkTheme: ThemeData.light(),
        theme: ThemeData(
          floatingActionButtonTheme:
              const FloatingActionButtonThemeData(backgroundColor: orangeColor),
          textButtonTheme: const TextButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.orange))),
          // primaryTextTheme: TextTheme(),
          // primarySwatch: Colors.orange,
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        // home: SplashScreen(),
        home: const HomeScreen(),
        // home: AudioCallScreen()
      ),
      designSize: const Size(720, 1560),
    );
  }
}

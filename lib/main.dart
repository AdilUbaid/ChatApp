import 'package:chitchat/screens/constants.dart';
import 'package:chitchat/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'controller/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
        ],
        child: MaterialApp(
          // darkTheme: ThemeData.light(),
          theme: ThemeData(
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: orangeColor),
            textButtonTheme: const TextButtonThemeData(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.orange))),
            // primaryTextTheme: TextTheme(),
            // primarySwatch: Colors.orange,
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
          // home: const HomeScreen(),
          // home: const OtpScreen()
        ),
      ),
      designSize: const Size(720, 1560),
    );
  }
}

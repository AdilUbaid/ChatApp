import 'package:chitchat/screens/constants.dart';
import 'package:chitchat/screens/home_screen/widgets/calls_tab.dart';
import 'package:chitchat/screens/home_screen/widgets/message_tab.dart';
import 'package:chitchat/screens/search_screen/search_screen.dart';
import 'package:chitchat/screens/user_profile_view/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            // backgroundColor: Colors.white, elevation: 4,
            title: const ChatName(),
            // ignore: prefer_const_literals_to_create_immutables
            actions: [const UserIcon()],
            bottom: TabBar(
                labelColor: Colors.black,
                indicatorColor: Colors.black,
                controller: controller,
                tabs: const [
                  Tab(
                    text: "Messages",
                  ),
                  Tab(
                    text: 'Calls',
                  )
                ]),
          ),
          body: TabBarView(
              controller: controller,
              children: const [MessageTab(), CallTab()]),
          floatingActionButton: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: FloatingActionButton(
              backgroundColor: orangeColor,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchScreen()));
              },
              child: Icon(
                Icons.search_outlined,
                // controller.index % 2 == 0 ? Icons.message_rounded : Icons.call,
                color: whiteColor,
                size: 50.sp,
              ),
            ),
          )),
    );
  }
}

class UserIcon extends StatelessWidget {
  const UserIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const UserProfileView(),
          )),
      child: const Padding(
        padding: EdgeInsets.only(right: 8),
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/images/avatar_male_1.jpg"),
        ),
      ),
    );
  }
}

class ChatName extends StatelessWidget {
  const ChatName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Kouvénta",
      style: TextStyle(
          color: Color.fromARGB(255, 3, 3, 3),
          fontSize: 25,
          fontWeight: FontWeight.w500),
    );
  }
}

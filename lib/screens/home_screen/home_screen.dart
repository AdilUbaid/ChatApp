import 'dart:developer';

import 'package:chitchat/screens/constants.dart';
import 'package:chitchat/screens/home_screen/widgets/calls_tab.dart';
import 'package:chitchat/screens/home_screen/widgets/message_tab.dart';
import 'package:chitchat/screens/search_screen/search_screen.dart';
import 'package:chitchat/screens/user_profile_view/user_profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import '../../controller/provider.dart';
import '../../utils/utils.dart';
import '../../widgets/avater_circle.dart';

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
    addData();
    controller = TabController(length: 2, vsync: this);
  }

  addData() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshUser();
    log(FirebaseAuth.instance.currentUser!.displayName.toString());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    ZegoUIKitPrebuiltCallInvitationService().init(
      appID: Utils.appId /*input your AppID*/,
      appSign: Utils.appSignIn /*input your AppSign*/,
      userID: userProvider.getUser.id,
      userName: userProvider.getUser.userName,
      plugins: [ZegoUIKitSignalingPlugin()],
    );

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
  const UserIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserProvider>(context).getUser;

    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.id)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasData) {
          DocumentSnapshot userSnap = snapshot.data!;
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UserProfileView(),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: CircleAvatar(
                backgroundImage: imagePick(currentUser.image),
              ),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
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

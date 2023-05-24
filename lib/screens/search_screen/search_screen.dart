import 'dart:developer';

import 'package:chitchat/screens/chat_screen/chat_screen.dart';
import 'package:chitchat/screens/search_screen/widgets/search_widget.dart';
import 'package:chitchat/widgets/avater_circle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

List<dynamic> availableUsers = [];
List<dynamic> filteredUsers = [];

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    // availableUsers.clear();
    fetchData();
    // log(fetchData().toString());
    // int x = fetchData().toString() as int;
    log(availableUsers[0].toString());
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SearchBox(onChanged: filterUsers),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => InkWell(
                child: ListTile(
                  leading: const AvatarCircle(),
                  title: Text(filteredUsers[index].data()['userName']),
                  subtitle: Text(filteredUsers[index].data()['aboutMe']),
                ),
                onTap: () => MaterialPageRoute(
                  builder: (context) =>  ChatScreen(idUser: availableUsers[index].data()['id'],),
                ),
              ),
              itemCount: filteredUsers.length,
            ),
          )
        ],
      )),
    );
  }

  Future<int> fetchData() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    await db.collection("users").get().then((event) {
      for (var doc in event.docs) {
        availableUsers.add(doc);
        // print("${doc.id} => ${doc.data()}")
        // log("${doc.id} => ${doc.data()}");
        // log(availableUsers.length.toString());
      }
    });
    log(availableUsers.length.toString());
    return availableUsers.length;
  }

  void filterUsers(String query) {
    filteredUsers = availableUsers.where((user) {
      String name = user.data()['userName'].toLowerCase();
      String searchLower = query.toLowerCase();
      return name.contains(searchLower);
    }).toList();
  }
}

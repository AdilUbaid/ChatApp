import 'dart:developer';

import 'package:chitchat/screens/chat_screen/chat_screen.dart';
import 'package:chitchat/screens/search_screen/widgets/search_widget.dart';
import 'package:chitchat/widgets/avater_circle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:chitchat/db/models/chat_user.dart' as model;

List<dynamic> availableUsers = [];
List<dynamic> filteredUsers = [];

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SearchBox(onChanged: filterUsers),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    log("Data received");
                    availableUsers = snapshot.data!.docs;
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        final DocumentSnapshot userSnap =
                            filteredUsers[index];
                        return InkWell(
                          child: ListTile(
                            leading: AvatarCircle(url: userSnap['image']),
                            title: Text(userSnap['userName']),
                            subtitle: Text(userSnap['aboutMe']),
                          ),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                receiver: userSnap,
                                idUser: userSnap['id'],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: filteredUsers.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          color: Colors.grey[200],
                          indent: 10,
                          endIndent: 10,
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void filterUsers(String query) {
    setState(() {
      filteredUsers = availableUsers.where((user) {
        String name = user.data()['userName'].toLowerCase();
        String searchLower = query.toLowerCase();
        return name.contains(searchLower);
      }).toList();
    });
  }
}

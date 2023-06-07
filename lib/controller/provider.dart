import 'package:flutter/cupertino.dart';
import '../db/models/chat_user.dart';
import 'auth_service.dart';

class UserProvider with ChangeNotifier {
  ChatUser? _user;
  final AuthMethods _authMethods = AuthMethods();

  ChatUser get getUser => _user!;

  Future<void> refreshUser() async {
    ChatUser user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}

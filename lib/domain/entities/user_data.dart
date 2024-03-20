

import 'package:firebase_auth/firebase_auth.dart';

class UserData{
  final User user;
  final bool isLoggedIn;

  UserData({required this.user, required this.isLoggedIn});
}
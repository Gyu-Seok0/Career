import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class AuthNotifier with ChangeNotifier {
  //FirebaseUser _user;
  User _user;

  // FirebaseUser get user => _user;
  User get user => _user;

  //  void setUser(FirebaseUser user) {
  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}

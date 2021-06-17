import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class AuthService2{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInAnon() async {
    try{
     var temp = await _auth.signInAnonymously();
     User user = temp.user;
     return user;

    }catch(e){
      print(e.toString());
      return null;
    }
  }
}
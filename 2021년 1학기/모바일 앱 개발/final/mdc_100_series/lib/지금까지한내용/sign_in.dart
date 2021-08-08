import 'package:Shrine/%E1%84%8C%E1%85%A1%E1%86%B8%E1%84%83%E1%85%A9%E1%86%BC%E1%84%89%E1%85%A3%E1%84%82%E1%85%B5/auth.dart';
import 'package:flutter/material.dart';
import 'package:Shrine/%EC%A7%80%EA%B8%88%EA%B9%8C%EC%A7%80%ED%95%9C%EB%82%B4%EC%9A%A9/auth.dart';

class SignIn extends StatefulWidget {

  @override
  _State createState() => _State();
}

class _State extends State<SignIn> {

  final AuthService2 _auth = AuthService2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.brown[40],
        elevation: 0.0,
        title: Text('Sign in to Brw Crew'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
        child: ElevatedButton(
          child: Text('Sign in anon'),
          onPressed: () async{
             dynamic result = await _auth.signInAnon();
             if (result == null){
               print('error signing in');
             }
             else{
               print('signed in');
               print(result);
             }
          },
        )
    )
    );
  }
}

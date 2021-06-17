import 'package:Shrine/%EC%A7%80%EA%B8%88%EA%B9%8C%EC%A7%80%ED%95%9C%EB%82%B4%EC%9A%A9/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget{
  @override
  _AuthenticateState createState() => _AuthenticateState();

}

class _AuthenticateState extends State<Authenticate>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SignIn(), // sign_in.dart가 있네
    );
  }



}
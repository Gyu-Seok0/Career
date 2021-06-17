
import 'package:Shrine/test2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class App2 extends StatelessWidget{
  const App2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot){
          if (snapshot.hasError){
            return Center(
              child: Text("FireBase Error"),
            );
          }

          if (snapshot.connectionState == ConnectionState.done){
            return ShrineApp2();
          }
          return CircularProgressIndicator();

        }
        );
  }
}
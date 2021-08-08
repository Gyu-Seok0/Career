// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'home.dart';
import 'login.dart';
import 'test.dart';

// TODO: Convert ShrineApp to stateful widget (104)
class ShrineApp2 extends StatelessWidget {
  const ShrineApp2 ({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("Firebase sns login"),
        ),
        body:StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (BuildContext context, AsyncSnapshot<User> snapshot){
              if (!snapshot.hasData){
                return LoginWidget();
              }
              else{
                return
                  Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${snapshot.data.displayName}님 환영합니다."),
                          FlatButton(
                            color: Colors.grey,
                            child: Text("log out"),
                            onPressed: FirebaseAuth.instance.signOut,
                          )
                        ],
                      )
                  );
              }
            }
        )

    );
  }

}


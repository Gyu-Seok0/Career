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

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // 추가된 내용
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  User currentUser;
  String name;
  String email;
  String url;


  Future <String> SignIn() async{
    final GoogleSignInAccount account = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await account.authentication;
    // 약간 수정
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    //final AuthResult authResult = await _auth.signInWithCredential(credential);
    final User user = (await _auth.signInWithCredential(credential)).user;
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    currentUser = await _auth.currentUser;
    assert(user.uid == currentUser.uid);

    setState(() {
      email = user.email;
      url = user.photoURL;
      name = user.displayName;
    });

    return '구글 로그인 성공: $user';
  }

  void SignOut() async{
    await _auth.signOut();
    await googleSignIn.signOut();

    setState(() {
      email = "";
      url = "";
      name = "";
    });
    print("User Sign Out");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                SizedBox(height: 16.0),
                Text('Final Project'),
              ],
            ),
            SizedBox(height: 100.0),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                      onPressed: (){
                        SignIn();
                      },
                      color: Colors.greenAccent,
                      child: Text('Google'),
                  ),
                  MaterialButton(
                    onPressed: () => null,
                    color: Colors.black12,
                    child: Text('Guest'),
                  ),
                ],
              ),
            ),

            //
            // SizedBox(height: 120.0),
            // TextField(
            //   controller: _usernameController,
            //   decoration: InputDecoration(
            //     filled: true,
            //     labelText: 'Username',
            //   ),
            // ),
            // SizedBox(height: 12.0),
            // // TODO: Wrap Password with AccentColorOverride (103)
            // TextField(
            //   controller: _passwordController,
            //   decoration: InputDecoration(
            //     filled: true,
            //     labelText: 'Password',
            //   ),
            //   obscureText: true,
            // ),
            // ButtonBar(
            //   children: <Widget>[
            //     // TODO: Add a beveled rectangular border to CANCEL (103)
            //     FlatButton(
            //       child: Text('CANCEL'),
            //       onPressed: () {
            //         _usernameController.clear();
            //         _passwordController.clear();
            //       },
            //     ),
            //     // TODO: Add an elevation to NEXT (103)
            //     // TODO: Add a beveled rectangular border to NEXT (103)
            //     RaisedButton(
            //       child: Text('NEXT'),
            //       onPressed: () {
            //         Navigator.pop(context);
            //       },
            //     ),
            //   ],
            // ),


          ],
        ),
      ),
    );
  }
}



// TODO: Add AccentColorOverride (103)

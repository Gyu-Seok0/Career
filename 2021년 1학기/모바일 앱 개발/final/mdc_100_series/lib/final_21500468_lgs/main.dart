// void main() => runApp(ShrineApp());
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

//import 'home.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'auth.dart';
import 'wrapper.dart';
//import 'globals.dart' as globals;

//
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(
//     MaterialApp(
//       title: 'Google Sign In',
//       home: Wrapper(),
//     ),
//   );
// }

//

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class AuthService2 {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // 게스트 로그인
  Future signInAnon() async {
    try {
      // 맞는거 : var temp = await _auth.signInAnonymously();
      var temp = await _auth.signInAnonymously();

      //UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
      User user = temp.user;


      return user;

    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  Future signOut() async{
    try{
      print("sign out");
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }


  // 구글로그인.
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

}

// 진짜 우리꺼.
void main() async {
  // globals.isLoggedIn = null;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      home: SignInDemo(),
    ),
  );
}

class SignInDemo extends StatefulWidget {
  @override
  State createState() => SignInDemoState();
}

class SignInDemoState extends State<SignInDemo> {





  GoogleSignInAccount _currentUser;
  String _contactText = '';

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
      //print(_currentUser.displayName);
    });
    _googleSignIn.signInSilently();
  }

  // Future<void> _handleSignIn() async {
  //   try {
  //     await _googleSignIn.signIn();
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  static var target = 0;
  static String UID;

  final AuthService2 _auth = AuthService2(); // 새로추가.
  static dynamic result = null;

  Widget _buildBody() {


    GoogleSignInAccount user = _currentUser;

    if (user != null) {
      return
        Column(
          children: <Widget>[
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    user.photoUrl != null ?
                          Image.network(user.photoUrl)
                        : Image.asset('assets/logo2.png',height: 150, fit: BoxFit.fill),
                    SizedBox(height: 16.0),
                    Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          user.id ?? '',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                    Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(user.email ?? "Anonymous",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30))),
                  ],
                )
            ),
          ],
        );


      //   Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: <Widget>[
      //     ListTile(
      //       leading: GoogleUserCircleAvatar(
      //         identity: user,
      //       ),
      //       title: Text(user.displayName ?? ''),
      //       subtitle: Text(user.email),
      //     ),
      //     const Text("Signed in successfully."),
      //     Text(_contactText),
      //     ElevatedButton(
      //       child: const Text('SIGN OUT'),
      //       onPressed: _handleSignOut,
      //     ),
      //   ],
      // );
    }
    else if (target == 2){
      return
        Column(
          children: <Widget>[
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Image.asset('assets/logo2.png',height: 150, fit: BoxFit.fill),
                    SizedBox(height: 16.0),
                    Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          UID,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                    Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text("Anonymous",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30))),
                  ],
                )
            ),
          ],
        );


    }

    else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/diamond.png'),
          SizedBox(height: 16.0),
          Text('Final Project'),
          //const Text("You are not currently signed in."),
          MaterialButton(
            child: const Text('Google'),
            color: Colors.greenAccent,
            //onPressed: _handleSignIn,
            onPressed: () async {
              setState(() {
                target = 1;
              });
              dynamic result = await _auth.signInWithGoogle();
              if (result == null) {
                print('Error: Goggle sign in');

              } else {
                print("Success Google sign in");
                setState(() {

                });
                // print("result");
                // print(result.user.toString());

                // print("result.id");
                // print(result.user.uid.toString());
                // print(result.user.toString());

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Wrapper(target: result.user.uid.toString(), )),
                );
              }
            },
          ),
          MaterialButton(
            onPressed: () async {
              setState(() {
                target = 2;
              });

              dynamic result = await _auth.signInAnon();

              UID = result.uid.toString();

              if (result == null) {
                print('Error: Guest Sign in');
              } else {
                print("Success: Guest Sign in");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Wrapper(target: UID)),
                );
              }
            },
            color: Colors.black12,
            child: Text('Guest'),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Sign In'),
          actions: [
            _currentUser == null ? Text('') :
                IconButton(
                    onPressed: (){
                      _handleSignOut();
                      print("Success to log out");
                    },
                    icon: Icon(Icons.exit_to_app)
                ),
            target == 2 ?
            IconButton(
                onPressed: () async {
                  await _auth.signOut();
                  print("Success to log out");
                  setState(() {
                    target = 0;
                  });
                },
                icon: Icon(Icons.exit_to_app)
            )

                : Text(''),

          ],
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: _buildBody(),
        ));
  }
}

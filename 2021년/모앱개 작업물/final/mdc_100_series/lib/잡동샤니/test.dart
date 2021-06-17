import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginWidget extends StatelessWidget{
  const LoginWidget({Key key}) : super(key: key);


  Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
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
                      signInWithGoogle();
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


          ],
        ),
      ),
    );
  }







// 잘되는
 // @override
 //  Widget build(BuildContext context){
 //   return Scaffold(
 //     appBar: AppBar(
 //       title: Text("SNS Login"),
 //     ),
 //     body: Center(
 //       child:Column(
 //         mainAxisAlignment: MainAxisAlignment.center,
 //         children: [
 //           FlatButton(
 //               color: Colors.grey,
 //               child: Text("Google Login"),
 //               onPressed: signInWithGoogle,
 //           )
 //         ],
 //       )
 //     ),
 //   );

 }

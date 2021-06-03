import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';

//class LoginPage extends StatefulWidget {
class SignUpPage extends StatefulWidget{
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cpasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: SafeArea(
        body: Form(
          key: _formKey,

          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[

              SizedBox(height: 120.0),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Username',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12.0),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Password';
                  }
                  return null;
                },
              ),

              SizedBox(height: 12.0),
              TextFormField(
                controller: _cpasswordController,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Confirm Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Confirm Password';
                  }
                  return null;
                },

              ),

              SizedBox(height: 12.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Email Address',
                ),
                //obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Address';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  // TODO: Add a beveled rectangular border to CANCEL (103)
                  RaisedButton(

                    child: Text('SIGN UP'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                       Navigator.push(
                            context, MaterialPageRoute(builder: (context) {
                          return HomePage();
                        }
                        )
                        );
                      }
                    },

                  ),
                ],
              ),
            ],
            //),
          ),
        )
    );
  }
}
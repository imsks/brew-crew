import 'package:flutter/material.dart';
import 'package:crew_brew/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[200],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        title: Text(
          'Sign in to Brew Crew'
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20
        ),
        child: RaisedButton(
          child: Text(
            'Sign in anon'
          ),
          onPressed: () async {
            dynamic result = await _auth.signInAnon();
            print(result);
          },
        ),
      ),
    );
  }
}
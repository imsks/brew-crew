import 'package:flutter/material.dart';
import 'package:crew_brew/services/auth.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    return Scaffold(
      backgroundColor: Colors.lightBlue[200],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        title: Text(
          'Brew Crew'
        ),
        actions: [
          FlatButton.icon(
            onPressed: () async {
              dynamic result = await _auth.signOut();
              print(result);
            }, 
            icon: Icon(Icons.person), 
            label: Text(
              'Logout'
            )
          )
        ],
      ),
    );
  }
}
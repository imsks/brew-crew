import 'package:crew_brew/utilities/loading.dart';
import 'package:flutter/material.dart';
import 'package:crew_brew/services/auth.dart';
import 'package:crew_brew/utilities/constants.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // Text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() :Scaffold(
      backgroundColor: Colors.lightBlue[200],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        title: Text(
          'Brew Crew'
        ),
        actions: [
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            }, 
            icon: Icon(Icons.person), 
            label: Text(
              'Register'
            )
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: textInputDecoration.copyWith(
                  hintText: 'Enter your email',
                ),
                validator: (val) => val.isEmpty ? "Enter an email" : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),

              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: textInputDecoration.copyWith(
                  hintText: 'Enter your password',
                ),
                validator: (val) => val.isEmpty ? "Enter correct password" : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),

              SizedBox(
                height: 20,
              ),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Sign in',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()) {
                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _auth.signInWithEmailAndPassword(email.trim(), password);
                    if(result == null) {
                      setState(() {
                        error = 'Please enter correct email or password';
                        loading = false;
                      });
                    }
                  }
                },
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
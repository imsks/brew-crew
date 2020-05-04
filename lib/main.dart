import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:crew_brew/models/user.dart';
import 'package:crew_brew/services/auth.dart';
import 'package:crew_brew/screens/wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
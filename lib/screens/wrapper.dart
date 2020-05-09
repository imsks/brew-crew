import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:crew_brew/models/user.dart';
import 'package:crew_brew/screens/home/home.dart';
import 'package:crew_brew/screens/authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return user == null ? Authenticate() : Home();
  }
}
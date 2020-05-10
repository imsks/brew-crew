import 'package:crew_brew/screens/home/settings_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crew_brew/services/auth.dart';
import 'package:crew_brew/services/database.dart';
import 'package:provider/provider.dart';
import 'package:crew_brew/models/brew.dart';
import 'package:crew_brew/screens/home/brew_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
          child: SettingsForm()
        );
      });
    }

    return StreamProvider<List<Brew>>.value(
        initialData: List(),
        value: DatabaseService().brews,
        child: Scaffold(
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
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings), 
              label: Text(
                'Settings'
              ),
              onPressed: () => _showSettingsPanel()
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/coffee_bg.png'
              ),
              fit: BoxFit.cover
            )
          ),
          child: BrewList()
        ),
      ),
    );
  }
}
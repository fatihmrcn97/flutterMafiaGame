import 'package:flutter/material.dart';
import 'package:mafia/models/mafiaProperties.dart';
import 'package:mafia/screen/home/settings_forms.dart';
import 'package:mafia/services/auth.dart';
import 'package:mafia/services/database.dart';
import 'package:provider/provider.dart';
import 'mafia_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 60),
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider<List<Mafia>>.value(
      value: DatabaseService().mafias,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: Text("Mafia"),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text("Log Out"),
            ),
            FlatButton.icon(
              onPressed: () {_showSettingsPanel();},
              icon: Icon(Icons.settings),
              label: Text("Settings"),
            ),
          ],
        ),
        body: MafiaList(),
      ),
    );
  }
}

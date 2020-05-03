import 'package:flutter/material.dart';
import 'package:mafia/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  
  final _formKey = GlobalKey<FormState>();
  final List<int> energy1 = [100, 200, 300, 400, 500, 600, 700, 800, 900];

  String _currentName;
  int _currentPower;
  int _currentEnergy;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            "Update your mafia Settings",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: textInputDecoration.copyWith(
              hintText: 'Name',
            ),
            validator: (val) => val.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(
            height: 20,
          ),
          //dropDown
          DropdownButtonFormField(
             
              itemHeight: 20,
              decoration:textInputDecoration,
              value: _currentEnergy ?? 100,
              items: energy1.map((energy) {
                return DropdownMenuItem(
                  value: energy,
                  child: Text("${energy} : Energy"),
                );
              }).toList(),
              onChanged: (val) => setState(() => _currentEnergy = val)),
          //Slider
          SizedBox(
            height: 20,
          ),
          Slider(
              inactiveColor: Colors.brown[_currentPower ?? 100],
              activeColor: Colors.brown[_currentPower ?? 100],
              value: (_currentPower ?? 100).toDouble(),
              min: 100,
              max: 900,
              divisions: 8,
              onChanged: (val) => setState(() => _currentPower = val.toInt())),

          //Button
          RaisedButton(
            onPressed: () async {
              print(_currentName);
              print(_currentEnergy);
              print(_currentPower);
            },
            color: Colors.pink[400],
            child: Text(
              "Update",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mafia/models/mafiaProperties.dart';

class MafiaTile extends StatelessWidget {
  final Mafia mafia;
  MafiaTile({this.mafia});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown,
          ),
          title: Text(mafia.name),
          subtitle: Text('Power : ${mafia.power} Energy : ${mafia.energy}'),
        ),
      ),
    );
  }
}

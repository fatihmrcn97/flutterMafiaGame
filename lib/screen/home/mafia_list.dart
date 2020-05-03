import 'package:flutter/material.dart';
import 'package:mafia/screen/home/mafia_tile.dart';
import 'package:mafia/models/mafiaProperties.dart';
import 'package:provider/provider.dart';

class MafiaList extends StatefulWidget {
  @override
  _MafiaListState createState() => _MafiaListState();
}

class _MafiaListState extends State<MafiaList> {
  @override
  Widget build(BuildContext context) {

    final mafias = Provider.of<List<Mafia>>(context);
    
    return ListView.builder(
      itemCount: mafias.length,
      itemBuilder: (contex,index){
        return MafiaTile(mafia: mafias[index]);
      },
    );
  }
}
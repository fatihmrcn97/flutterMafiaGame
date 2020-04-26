import 'package:flutter/material.dart';
import 'package:mafia/screen/wrapper.dart';
import 'package:mafia/services/auth.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';

void main(){
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
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
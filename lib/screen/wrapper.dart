import 'package:flutter/material.dart';
import 'package:mafia/screen/authenticate/authentitace.dart';
import 'package:mafia/screen/home/home.dart';
import 'package:provider/provider.dart';
import 'package:mafia/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
    
    // Return either home , authenticate widget
    
    if(user == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}
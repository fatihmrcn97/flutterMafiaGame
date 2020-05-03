import 'package:flutter/material.dart';

Color color1 = Colors.brown[400];
InputDecoration textInputDecoration = InputDecoration(
                  
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: color1,width: 2),),
                );

InputDecoration textInputDecoration2 = InputDecoration(
                  
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0),
                  ),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: color1,width:0),),
                );

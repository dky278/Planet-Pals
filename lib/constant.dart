import 'package:flutter/material.dart';


const kTextFieldDecoration =  InputDecoration(
  filled: true,
  fillColor: Color(0xFFF5F5F5),
  hintText: 'Enter total miles driven',
  hintStyle: TextStyle(
    fontSize: 14,
    color: Colors.blueGrey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(25.0),),
    borderSide: BorderSide.none,
  ),
);
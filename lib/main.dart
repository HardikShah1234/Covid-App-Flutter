import 'package:first_app/datasource.dart';
import 'package:first_app/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Circular',
      primaryColor: primaryBlack
    ),
    home: HomePage(),
  ));
}

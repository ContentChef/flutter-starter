import 'package:flutter/material.dart';
import 'package:flutter_starter/pages/home.dart';

void main() {
  runApp(MaterialApp(
    title: 'ContentChef + Flutter starter',
    theme: ThemeData(
      primarySwatch: Colors.blue
    ),
    home: Home(),
  ));
}
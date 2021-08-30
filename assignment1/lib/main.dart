import 'package:assignment1/text_control.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Assignment 1"),
        ),
        body: SafeArea(
          child: TextControl(),
        ),
      ),
    );
  }
}

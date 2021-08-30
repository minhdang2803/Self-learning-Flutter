import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  //const Question({ Key? key }) : super(key: key);
  final String? questionTask; //never change after initilization
  Question({this.questionTask});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(12.0),
      child: Text(
        questionTask ?? "Default Text!",
        style: TextStyle(
          fontSize: 26,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  //const Answer({ Key? key }) : super(key: ke//y);
  final VoidCallback selectHandler;
  final String? text;
  Answer({this.text, required this.selectHandler});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.teal,
          onPrimary: Colors.white,
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text(
          text ?? "Default Question",
        ),
        onPressed: selectHandler,
      ),
    );
  }
}

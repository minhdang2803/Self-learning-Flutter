import 'package:flutter/material.dart';
import 'package:assignment1/text_output.dart';

class TextControl extends StatefulWidget {
  const TextControl({Key? key}) : super(key: key);
  @override
  _TextControlState createState() => _TextControlState();
}

class _TextControlState extends State<TextControl> {
  String _mainText = "The initial text!";
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text("Press!"),
              onPressed: () {
                setState(() {
                  if (check == false) {
                    _mainText = "The text changed!";
                    check = true;
                  } else {
                    _mainText = "The initial text!";
                    check = false;
                  }
                });
              },
            ),
            TextOutput(_mainText),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TextOutput extends StatelessWidget {
  //const TextOutput({ Key? key }) : super(key: key);
  final String? text;
  TextOutput(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text ?? "defaultText"),
    );
  }
}

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int? finalScore;
  final VoidCallback? resetFunction;
  Result({this.finalScore, this.resetFunction});

  String getScore() {
    var resultText = "Nice Try";
    if (finalScore! >= 300)
      resultText = "Incredible";
    else if (finalScore! >= 200)
      resultText = "OutStanding";
    else if (finalScore! >= 100)
      resultText = "Good Job!";
    else
      resultText = "You did it!";
    return "\t\t\t\t\t\t\t\t\t\t\t\t" +
        resultText +
        "\n Your total Score is: $finalScore";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            getScore(),
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: resetFunction,
            child: Text(
              "Restart Quizz",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

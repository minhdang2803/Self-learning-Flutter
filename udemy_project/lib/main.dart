import 'package:flutter/material.dart';
import 'package:udemy_project/quiz.dart';
import 'package:udemy_project/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questions = const [
    {
      'Question': 'What is your favorite Color?',
      'Answer': [
        {'text': "Red", 'Score': 20},
        {'text': "Blue", 'Score': 50},
        {'text': "White", 'Score': 100},
        {'text': "Green", 'Score': 70}
      ],
    },
    {
      'Question': 'What is your favorite Animal?',
      'Answer': [
        {'text': "Cat", 'Score': 30},
        {'text': "Dog", 'Score': 100},
        {'text': "Fish", 'Score': 80},
        {'text': "Hamster", 'Score': 50}
      ],
    },
    {
      'Question': 'What is your favorite Teacher?',
      'Answer': [
        {'text': "Max", 'Score': 100},
        {'text': "Jenny", 'Score': 50},
        {'text': "James", 'Score': 20},
        {'text': "John", 'Score': 80}
      ],
    }
  ];
  var _questionIndex = 0;
  var _totalPoint = 0;

  void _resetQuizz() {
    setState(() {
      _questionIndex = _totalPoint = 0;
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    _totalPoint += score;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First Application!"),
        ),
        body: SafeArea(
          child: _questionIndex < _questions.length
              ? Quiz(
                  questionIndex: _questionIndex,
                  questions: _questions,
                  answerQuestion: _answerQuestion,
                )
              : Center(
                  child: Result(
                    finalScore: _totalPoint,
                    resetFunction: _resetQuizz,
                  ),
                ),
        ),
      ),
    );
  }
}

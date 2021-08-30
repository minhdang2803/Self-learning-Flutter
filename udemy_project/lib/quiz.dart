import 'answer.dart';
import 'question.dart';
import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  final Function? answerQuestion;
  final int? questionIndex;
  final List<Map<String, Object>>? questions;
  Quiz({this.questions, this.answerQuestion, this.questionIndex});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Question(
              questionTask:
                  questions![questionIndex ?? 0]['Question']! as String,
            ),
            ...(questions![questionIndex ?? 0]["Answer"]
                    as List<Map<String, Object>>)
                .map((value) => Answer(
                    selectHandler: () => answerQuestion!(value['Score']),
                    text: value['text'] as String))
                .toList(),
          ],
        ),
      ),
    );
  }
}

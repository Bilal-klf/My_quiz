import 'package:flutter/material.dart';
import 'package:my_app/data/questions.dart';
import 'package:my_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(this.selectedAnswer, this.restartQuiz, {super.key});

  final List<String> selectedAnswer;

  void Function() restartQuiz;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': selectedAnswer[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final summary = getSummaryData();
    final numberOfQuestions = questions.length;
    final numCorrectQuestions = summary.where((data) {
      return data["correct_answer"] == data["user_answer"];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "you answered $numCorrectQuestions correct question out of $numberOfQuestions",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 20),
            QuestionsSummary(summary),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 0),
              child: OutlinedButton.icon(
                
                onPressed: restartQuiz,
                icon: const Icon(Icons.restart_alt_outlined),
                label: const Text("restart quiz"),
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                      textStyle: const TextStyle(fontSize: 14),
                      foregroundColor: Colors.black,
                  ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}

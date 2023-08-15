import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_app/models/answer_button.dart';
import 'package:my_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(
    this.onSelectAnswer, {
    super.key,
  });

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }

  final void Function(String answer) onSelectAnswer;
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void incrementQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(Context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        //margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        //padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map(
              (answer) {


                return Container(
                  //padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                  //margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  margin: const EdgeInsets.all(5),
                  child: AnswerButton(
                      onTap: () {
                        incrementQuestion(answer);
                      },
                      text: answer),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}

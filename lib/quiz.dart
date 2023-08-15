import 'package:flutter/material.dart';
import 'package:my_app/start_page.dart';
import 'package:my_app/question_screen.dart';
import 'package:my_app/data/questions.dart';
import 'package:my_app/result_screen.dart';
import 'package:my_app/result_screen.dart';
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //Widget? activeScreen;
  var activeScreen = 'start-screen';
  final List<String> selectedAnswers = [];
  var screenWedjet;

  /*@override
  void initState() {
    activeScreen = startPage(switchScreen);
    super.initState();
  }*/
  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = 'result-screen';
      });
    }
    print(selectedAnswers);
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'start-screen';
      selectedAnswers.clear();
    });
  }

  @override
  Widget build(context) {
    if (activeScreen == 'start-screen'){
      screenWedjet = startPage(switchScreen);
    }
    if (activeScreen == 'question-screen'){
      screenWedjet = QuestionScreen(chooseAnswer);
    }
    if (activeScreen == 'result-screen'){
      screenWedjet = ResultScreen(selectedAnswers,restartQuiz);
    }
    //var screenWedjet = activeScreen == 'start-screen' ? startPage(switchScreen) : QuestionScreen(chooseAnswer);
    return MaterialApp(
      home: Scaffold(
        body: Container(
            child: screenWedjet),
        backgroundColor: const Color.fromRGBO(130, 86, 191, 100),
      ),
    );
  }
}

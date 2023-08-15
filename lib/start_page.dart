import 'package:flutter/material.dart';

class startPage extends StatelessWidget {
  const startPage(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 200,
            color: const Color.fromRGBO(0, 0, 0, 0.5),
          ),
          const SizedBox(height: 50),
          const Text(
            "welcome to quiz app",
            style: TextStyle(color: Colors.white, fontSize: 21),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: startQuiz,
            icon: Icon(Icons.arrow_forward_rounded),
            label: Text("start!"),
            //child: const Text("Start!"),
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                textStyle: const TextStyle(fontSize: 14),
                foregroundColor: Colors.black),
          )
        ],
      ),
    );
  }
}

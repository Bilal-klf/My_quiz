import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary(this.summary, {super.key});
  List<Map<String, Object>> summary = [];

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map(
            (data) {
              Color couleur = data['user_answer'] == data['correct_answer']?  Colors.blue :  Colors.red;
              return Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: couleur,
                    ),
                    child: Center(
                      child: Text(
                          ((data['question_index'] as int) + 1).toString()),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(((data['question'] as String)),
                            style: const TextStyle(color: Colors.white)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(((data['user_answer'] as String)),
                            style: const TextStyle(color: Colors.pinkAccent)),
                        Text(((data['correct_answer'] as String)),
                            style: const TextStyle(color: Colors.blue)),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

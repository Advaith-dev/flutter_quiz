import 'package:flutter/material.dart';
import 'package:flutter_quiz/answer_button.dart';
import 'package:flutter_quiz/gradient_custom.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/models/quiz_questions.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  int currentQnIndex = 0;

  void incrementQnIndex() {
    setState(() {
      currentQnIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final QuizQuestions currentQuestion = questions[currentQnIndex];
    return GradientCustom(
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentQuestion.question,
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 35),
              ...currentQuestion.getShuffledAns().map(
                (answer) =>
                    AnswerButton(ans: answer, checkAnswer: incrementQnIndex),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_quiz/answer_button.dart';
import 'package:flutter_quiz/gradient_custom.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/models/quiz_questions.dart';
import 'package:google_fonts/google_fonts.dart';

class Questions extends StatefulWidget {
  final void Function(String ans) chooseAns;
  const Questions(this.chooseAns, {super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  int currentQnIndex = 0;

  void incrementQnIndex(String selectedAns) {
    widget.chooseAns(selectedAns);
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
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 35),
              ...currentQuestion.getShuffledAns().map(
                (answer) => AnswerButton(
                  ans: answer,
                  checkAnswer: () {
                    incrementQnIndex(answer);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

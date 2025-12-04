import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String ans;
  final void Function() checkAnswer;

  const AnswerButton({required this.ans, required this.checkAnswer, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 21, 0, 88),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        elevation: 3,
      ),
      onPressed: checkAnswer,
      child: Text(
        ans,
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}

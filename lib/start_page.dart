import 'package:flutter/material.dart';
import 'package:flutter_quiz/gradient_custom.dart';
import 'package:google_fonts/google_fonts.dart';

class StartPage extends StatelessWidget {
  const StartPage(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return GradientCustom(
      child: Column(
        children: [
          const SizedBox(height: 200),
          Center(
            child: Image.asset(
              "assets/images/quiz-logo.png",
              width: 300,
              color: Color.fromARGB(140, 255, 255, 255),
            ),
          ),
          SizedBox(height: 50),
          const Text(
            "Learn Flutter the fun way!",
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: startQuiz,
            icon: Icon(
              Icons.arrow_right,
              color: const Color.fromARGB(255, 0, 26, 255),
            ),
            label: Text(
                "Start Quiz",
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20,
               ),  
            ),  
          ),
        ],
      ),
    );
  }
}

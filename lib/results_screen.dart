import 'package:flutter/material.dart';
import 'package:flutter_quiz/gradient_custom.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  int Function() checkAns;
  void Function() switchScreen;
  ResultsScreen(this.checkAns, this.switchScreen, {super.key});

  @override
  Widget build(BuildContext context) {
    return GradientCustom(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have answered ${checkAns()} out of ${questions.length} correctly ',
              style: GoogleFonts.lato(
                color: Colors.lightGreenAccent,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            Text('world'),
            SizedBox(height: 20),
            TextButton(
              onPressed: switchScreen,
              child: Text(
                "Restart Quiz",
                style: GoogleFonts.lato(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

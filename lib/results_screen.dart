import 'package:flutter/material.dart';
import 'package:flutter_quiz/gradient_custom.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/summary_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  int Function() checkAns;
  List<Map<String, String>> summaryMap = [];
  void Function() switchScreen;

  ResultsScreen(this.checkAns, this.summaryMap, this.switchScreen, {super.key});

  @override
  Widget build(BuildContext context) {
    return GradientCustom(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have answered ${checkAns()} out of ${questions.length} correctly !',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            SummaryScreen(summaryMap),
            SizedBox(height: 20),
            OutlinedButton.icon(
              icon: Icon(
                Icons.refresh,
                color: const Color.fromARGB(255, 0, 26, 255),
              ),
              onPressed: switchScreen,
              label: Text(
                "Restart Quiz",
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

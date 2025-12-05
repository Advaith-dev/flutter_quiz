import 'package:flutter/material.dart';
import 'package:flutter_quiz/quiz.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryScreen extends StatelessWidget {
  List<Map<String, String>> summaryMap = [];
  SummaryScreen(this.summaryMap, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (Map<String, String> data in summaryMap)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 20.0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Badge(
                        label: Text(
                          data['question_index'].toString(),
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        backgroundColor:
                            (data['correct_ans'].toString() ==
                                data['user_ans'].toString())
                            ? Color.fromARGB(255, 54, 250, 0)
                            : Color.fromARGB(255, 217, 0, 0),
                        padding: const EdgeInsets.all(6.0),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 6),
                            Text(
                              data['question'].toString(),
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Correct Answer: ${data['correct_ans'].toString()}",
                              style: GoogleFonts.poppins(
                                color: const Color.fromARGB(255, 20, 211, 17),
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "Your Answer: ${data['user_ans'].toString()}",
                              style: GoogleFonts.poppins(
                                color: const Color.fromARGB(255, 145, 255, 11),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

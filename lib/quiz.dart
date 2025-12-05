import 'package:flutter/material.dart';
import 'package:flutter_quiz/questions.dart';
import 'package:flutter_quiz/results_screen.dart';
import 'package:flutter_quiz/start_page.dart';
import 'package:flutter_quiz/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuestionsState();
}

class _QuestionsState extends State<Quiz> {
  List<String> chosenAns = [];
  String? activeScreen = "start-screen";
  List<Map<String, String>> summaryMap = [];

  void switchScreen() {
    setState(() {
      chosenAns = [];
      summaryMap = [];
      activeScreen = "question-screen";
    });
  }

  void chooseAns(String ans) {
    chosenAns.add(ans);
    if (chosenAns.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  int checkAns() {
    int numCorrectAns = 0;
    for (int i = 0; i < questions.length; i++) {
      summaryMap.add({
        "question_index": i.toString(),
        "question": questions[i].question,
        "correct_ans": questions[i].ansoptions[0],
        "user_ans": chosenAns[i],
      });
      if (questions[i].ansoptions[0] == chosenAns[i]) {
        numCorrectAns += 1;
      }
    }
    return numCorrectAns;
  }

  @override
  Widget build(BuildContext context) {
    late final Widget currentScreen;
    if (activeScreen == "start-screen") {
      currentScreen = StartPage(switchScreen);
    } else if (activeScreen == "question-screen") {
      currentScreen = Questions(chooseAns);
    } else if (activeScreen == "results-screen") {
      currentScreen = ResultsScreen(checkAns, summaryMap, switchScreen);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: currentScreen),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_quiz/questions.dart';
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

  void switchScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  void chooseAns(String ans) {
    chosenAns.add(ans);
    if (chosenAns.length == questions.length) {
      setState(() {
        chosenAns = [];
        activeScreen = 'start-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    late final Widget currentScreen;
    if (activeScreen == "start-screen") {
      currentScreen = StartPage(switchScreen);
    } else if (activeScreen == "question-screen") {
      currentScreen = Questions(chooseAns);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: currentScreen),
    );
  }
}

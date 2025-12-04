import 'package:flutter/material.dart';
import 'package:flutter_quiz/questions.dart';
import 'package:flutter_quiz/start_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuestionsState();
}

class _QuestionsState extends State<Quiz> {
  String? activeScreen = "start-screen";

  void switchScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    final Widget currentScreen = (activeScreen == "start-screen")
        ? StartPage(switchScreen)
        : Questions();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: currentScreen),
    );
  }
}

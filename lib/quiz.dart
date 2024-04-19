import 'package:adv_pro/data/question.dart';
import 'package:adv_pro/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_pro/start_screen.dart';
import 'package:adv_pro/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> seletedAnswer = [];
  var activeScreen = "switch-screen";
  void switchScreen() {
    setState(() {
      activeScreen = "questions_screen";
    });
  }

  void choosenAnswer(String answer) {
    seletedAnswer.add(answer);

    if (seletedAnswer.length == questions.length) {
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  void onRestart() {
    setState(() {
      seletedAnswer = [];
      activeScreen = "questions_screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions_screen') {
      screenWidget = QuestionScreen(
        onSelectedAnswer: choosenAnswer,
      );
    }
    if (activeScreen == "results-screen") {
      screenWidget = ResultScreen(
        chosenAnswer: seletedAnswer,
        onRestart: onRestart,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.purpleAccent, Colors.pinkAccent],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight),
          ),
          child: Center(
            child: screenWidget,
          ),
        ),
      ),
    );
  }
}

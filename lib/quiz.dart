import 'package:flutter/material.dart';
import 'package:my_second_app/data/questions_answer.dart';
import 'package:my_second_app/questions.dart';
import 'package:my_second_app/result_screen.dart';
import 'package:my_second_app/splashscreen.dart';

import 'landing_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  String activeScreen = 'start-screen';

  void setScreen() {
    setState(() {
      activeScreen = 'que-screen';
    });
  }

  void getAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == queans.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = "start-screen";
    });
  }

  void launchApp() {
    setState(() {
      activeScreen = "start-screen";
    });
  }

  Widget changeScreen() {
    if (activeScreen == 'splash-screen') {
      return SplashScreen(
        launchApp: launchApp,
      );
    } else if (activeScreen == 'start-screen') {
      return LandingScreen(setScreen);
    } else if (activeScreen == 'que-screen') {
      return QuestionScreen(
        chooseAnwer: getAnswer,
      );
    } else {
      return ResultScreen(
        selectedAnswers: selectedAnswer,
        onTap: restartQuiz,
      );
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            // height: MediaQuery.sizeOf(context).height * 1,
            // width: MediaQuery.sizeOf(context).width * 1,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 39, 19, 77),
                  Color.fromARGB(255, 121, 67, 221),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: changeScreen()),
      ),
    );
  }
}

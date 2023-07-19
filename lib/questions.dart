import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_second_app/answer_button.dart';
import 'package:my_second_app/data/questions_answer.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.chooseAnwer});
  final void Function(String answer) chooseAnwer;
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int questionindex = 0;

  void changeQuestion(String answer) {
    widget.chooseAnwer(answer);
    setState(() {
      questionindex++;
    });
  }

  @override
  Widget build(context) {
    final currentUsers = queans[questionindex];
    return SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentUsers.text,
                style: GoogleFonts.lato(color: Colors.white, fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              ...currentUsers.suffledList.map(
                (item) => AnswerButton(
                    onTap: () {
                      changeQuestion(item);
                    },
                    answer: item),
              ),
            ],
          ),
        ));
  }
}

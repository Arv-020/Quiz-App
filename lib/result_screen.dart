import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_second_app/data/questions_answer.dart';
import 'package:my_second_app/summary_data.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.selectedAnswers, required this.onTap});
  final List<String> selectedAnswers;
  final VoidCallback onTap;

  List<Map<String, dynamic>> get summaryData {
    final List<Map<String, dynamic>> summarydata = [];

    for (int i = 0; i < queans.length; i++) {
      summarydata.add({
        "question_index": i + 1,
        "question": queans[i].text,
        "correct_ans": queans[i].answers[0],
        "user_ans": selectedAnswers[i]
      });
    }
    return summarydata;
  }

  @override
  Widget build(BuildContext context) {
    int totalAns = queans.length;
    int correctAns = summaryData
        .where(
          (element) => element["correct_ans"] == element["user_ans"],
        )
        .length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "You Answered $correctAns out $totalAns Answer Correctly",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SummaryData(
            summaryData: summaryData,
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: onTap,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.refresh),
            label: const Text('Restart Quiz'),
          )
        ]),
      ),
    );
  }
}

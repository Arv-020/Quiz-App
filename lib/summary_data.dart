import 'package:flutter/material.dart';

class SummaryData extends StatelessWidget {
  const SummaryData({super.key, required this.summaryData});
  final List<Map<String, dynamic>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map((item) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: item["user_ans"] == item["correct_ans"]
                        ? Colors.green
                        : Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: Text((item["question_index"] as int).toString()))),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      item["question"],
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      item["correct_ans"],
                      style: TextStyle(color: Colors.green.withOpacity(0.8)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      item["user_ans"],
                      style: TextStyle(
                          color: item["user_ans"] == item["correct_ans"]
                              ? Colors.green.withOpacity(0.8)
                              : Colors.red.withOpacity(0.8)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          );
        }).toList()),
      ),
    );
  }
}

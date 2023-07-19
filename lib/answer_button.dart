import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.onTap, required this.answer});
  final VoidCallback onTap;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          fixedSize: Size.fromWidth(MediaQuery.sizeOf(context).width * 0.8),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          backgroundColor: const Color.fromARGB(255, 66, 29, 130),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          )),
      child: Text(
        answer,
        textAlign: TextAlign.center,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AnswersButton extends StatelessWidget {
  const AnswersButton({super.key, required this.answers, required this.onTap});
  final void Function() onTap;
  final String answers;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: const Color.fromARGB(255, 228, 145, 214),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        answers,
        textAlign: TextAlign.center,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:adv_pro/question_summary/question_identifiers.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = itemData['answer'] == itemData['choosen_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIndetifer(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemData['question_index'] as int),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(itemData['answer'] as String,
                  style:
                      const TextStyle(color: Color.fromARGB(255, 38, 6, 243))),
              Text(itemData['choosen_answer'] as String,
                  style:
                      const TextStyle(color: Color.fromARGB(255, 243, 6, 85))),
            ],
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../domain/question/question.dart';

class WeakQuestionCard extends StatelessWidget {
  const WeakQuestionCard({required this.question, Key? key}) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(question.text)
        ],
      ),
    );
  }
}

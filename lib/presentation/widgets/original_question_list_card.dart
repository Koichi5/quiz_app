import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/question/question.dart';

class OriginalQuestionListCard extends HookConsumerWidget {
  const OriginalQuestionListCard({required this.originalQuestion, Key? key}) : super(key: key);

  final Question originalQuestion;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Column(
        children: [
          Text(originalQuestion.text)
        ],
      ),
    );
  }
}

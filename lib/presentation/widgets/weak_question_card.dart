import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/question/question.dart';

final weakQuestionCardGestureProvider = StateProvider((ref) => false);

class WeakQuestionCard extends StatelessWidget {
  const WeakQuestionCard({required this.question, Key? key}) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpandablePanel(
          header: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(question.text),
          ),
          collapsed: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("答え"),
          ),
          expanded: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(question.options
                .elementAt(question.options
                    .indexWhere((element) => element.isCorrect == true))
                .text),
          ),
        ),
      ),
    );
  }
}

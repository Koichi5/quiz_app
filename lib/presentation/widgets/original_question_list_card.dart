import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/question/question.dart';

class OriginalQuestionListCard extends HookConsumerWidget {
  const OriginalQuestionListCard({required this.originalQuestion, Key? key})
      : super(key: key);

  final Question originalQuestion;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpandablePanel(
          header: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(originalQuestion.text),
          ),
          collapsed: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("答え"),
          ),
          expanded: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(originalQuestion.options
                .elementAt(originalQuestion.options
                .indexWhere((element) => element.isCorrect == true))
                .text),
          ),
        ),
      ),
      // child: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Text(originalQuestion.text),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Text(originalQuestion.options
      //             .elementAt(originalQuestion.options
      //             .indexWhere((element) => element.isCorrect == true))
      //             .text),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(question.text),
                ),
                // Text(question.options.any((element) => element.isCorrect == true ? element.text))
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(question.options
                      .elementAt(question.options
                          .indexWhere((element) => element.isCorrect == true))
                      .text),
                )
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.star))
          ],
        ),
      ),
    );
  }
}

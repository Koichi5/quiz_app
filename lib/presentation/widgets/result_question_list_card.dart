import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/domain/question/question.dart';
import 'package:quiz_app/general/general_provider.dart';
import 'package:quiz_app/presentation/controller/weak_question_controller.dart';

class ResultQuestionListCard extends HookConsumerWidget {
  const ResultQuestionListCard(
      {required this.question, required this.answerIsCorrect, Key? key})
      : super(key: key);
  final Question question;
  final bool answerIsCorrect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(answerIsCorrect ? "正解" : "不正解"),
          Text(question.text),
          ElevatedButton(
              onPressed: () {
                //苦手問題登録
                ref
                    .watch(weakQuestionControllerProvider.notifier)
                    .addWeakQuestion(
                        quizDocRef: question.quizDocRef!,
                        categoryDocRef: question.categoryDocRef!,
                        questionDocRef: question.questionDocRef!);
              },
              child: const Text("苦手"))
        ],
      ),
    );
  }
}
